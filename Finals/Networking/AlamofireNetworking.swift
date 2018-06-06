//
//  AlamofireNetworking.swift
//  Finals
//
//  Created by Tamara Milisa on 10/04/18.
//  Copyright © 2018 Tamara Milisa. All rights reserved.
//

import Foundation
import Alamofire
import RxAlamofire
import RxSwift

struct AlamofireNetworking {

	func request(router : AlamofireRouter) -> Observable<(HTTPURLResponse, Any)> {
		return RxAlamofire.requestJSON(router.method, router.url, parameters: router.params, encoding: router.encoding, headers: router.headers).observeOn(MainScheduler.instance)
	}
}
