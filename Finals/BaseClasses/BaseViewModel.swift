//
//  BaseViewModel.swift
//  Finals
//
//  Created by Tamara Milisa on 10/04/18.
//  Copyright © 2018 Tamara Milisa. All rights reserved.
//

import Foundation

protocol ModelType {
    var errors: Array<RequestError>? { get set}
}

protocol BaseViewModel {
	var navigationService: NavigationService! { get set }
	var networking: AlamofireNetworking! { get set }

	init()

    func extractError(response: HTTPURLResponse, data: ModelType?) -> Error?
}

extension BaseViewModel {
    
    func extractError(response: HTTPURLResponse, data: ModelType?) -> Error? {
        if response.statusCode != 200 {
            return response.statusCode as? Error
        }
        if data?.errors?.count != 0 {
            return data?.errors?.first
        }
        
        return nil
    }
    
}
