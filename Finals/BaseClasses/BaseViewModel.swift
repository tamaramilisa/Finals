//
//  BaseViewModel.swift
//  Finals
//
//  Created by Filip Fajdetic on 10/04/18.
//  Copyright © 2018 Filip Fajdetic. All rights reserved.
//

import Foundation


protocol BaseViewModel {
	var navigationService: NavigationService! { get set }
	var networking: AlamofireNetworking! { get set }

	init()

}

