//
//  NetworkRequestHandler.swift
//  RaffleIt
//
//  Created by Tamara Milisa on 24/03/2018.
//  Copyright © 2018 Tamara Milisa. All rights reserved.
//

import Foundation
import Alamofire

protocol NetworkRequestHandler {
    
    var networking: AlamofireNetworking! { get set }
    
    var successfulStatusCodes: CountableClosedRange<Int> { get }
    
    var defaultNetworkError: RequestError { get }
    
    func extractedError(data: Data) -> RequestError
    
    func parseJSONArray<T: Decodable>(data: Data) -> Result<[T]>
    
    func parseJSONAsTopLevelArray<T: Decodable>(data: Data, response: HTTPURLResponse) -> Result<[T]>
    
    func parseJSONDictionary<T: Decodable>(data: Data) -> Result<T>
    
    func parseJSONAsTopLevelDictionary<T: Decodable>(data: Data, response: HTTPURLResponse) -> Result<T>
}

extension NetworkRequestHandler {
    
    var successfulStatusCodes: CountableClosedRange<Int> {
        return (200 ... 299)
    }
    
//    var defaultNetworkError: RequestError {
//        return RequestError(from: )
//    }
    
    func extractedError(data: Data) {//-> RequestError {
        logJSON(data: data)
        let decoder = JSONDecoder()
        
        if let errors = try? decoder.decode([RequestError].self, from: data), let error = errors.first {
//            return error
        }
        if let error = try? decoder.decode(RequestError.self, from: data) {
//            return error
        }
        
//        return RequestError(from: decoder)
    }
    
    func parseJSONArray<T: Decodable>(data: Data) -> Result<[T]> {
        let decoder = JSONDecoder()
        if let mappedData = try? decoder.decode([T].self, from: data) {
            return .success(mappedData)
        } else {
            return .failure(defaultNetworkError)
        }
    }
    
    func parseJSONAsTopLevelArray<T: Decodable>(data: Data, response: HTTPURLResponse) -> Result<[T]> {
        logJSON(data: data)
        if successfulStatusCodes.contains(response.statusCode) {
            return parseJSONArray(data: data)
        } else {
            return .failure(extractedError(data: data))
        }
    }
    
    func parseJSONDictionary<T: Decodable>(data: Data) -> Result<T> {
        let decoder = JSONDecoder()
        if let mappedData = try? decoder.decode(T.self, from: data) {
            return .success(mappedData)
        } else {
            return .failure(defaultNetworkError)
        }
    }
    
    func parseJSONAsTopLevelDictionary<T: Decodable>(data: Data, response: HTTPURLResponse) -> Result<T> {
        logJSON(data: data)
        if successfulStatusCodes.contains(response.statusCode) {
            return parseJSONDictionary(data: data)
        } else {
            return .failure(extractedError(data: data))
        }
    }
    
    func logJSON(data: Data) {
        DispatchQueue.global(qos: .background).async {
            if let json = String(data: data, encoding: .utf8) {
                print(json)
            }
        }
    }
    
}


