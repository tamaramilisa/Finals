//
//  BasePresenter.swift
//  Finals
//
//  Created by Tamara Milisa on 10/04/18.
//  Copyright © 2018 Tamara Milisa. All rights reserved.
//

import Foundation
protocol BasePresenter {

	init()

	weak var baseViewController: BaseViewController! { get set }
}
