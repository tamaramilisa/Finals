//
//  BasePresenter.swift
//  Finals
//
//  Created by Filip Fajdetic on 10/04/18.
//  Copyright © 2018 Filip Fajdetic. All rights reserved.
//

import Foundation
protocol BasePresenter {

	init()

	weak var baseViewController: BaseViewController! { get set }
}