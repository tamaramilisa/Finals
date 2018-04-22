//
//  BaseViewModel.swift
//  Finals
//
//  Created by Tamara Milisa on 10/04/18.
//  Copyright © 2018 Tamara Milisa. All rights reserved.
//

import Foundation


protocol BaseViewModel {
	var navigationService: NavigationService! { get set }
	var networking: AlamofireNetworking! { get set }

	init()

}

