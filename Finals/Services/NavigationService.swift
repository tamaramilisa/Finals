//
//  NavigationService.swift
//  Finals
//
//  Created by Tamara Milisa on 10/04/18.
//  Copyright © 2018 Tamara Milisa. All rights reserved.
//

import Foundation
import UIKit
import EssentialPod

struct NavigationService {

	var networking = AlamofireNetworking()
	var rootStoryboard = UIStoryboard(name: "Main", bundle: nil)

	mutating func initWithScreen(window: UIWindow) {
//        let viewController: LoginViewController = controllerFactory(ViewModelType: LoginViewModel.self, PresenterType: LoginPresenter.self, storyboard: rootStoryboard)
        
//        rootNavigationController = RootNavigationController(rootViewController: viewController)
//        window.rootViewController = rootNavigationController
	}
    
    func pushToLoginScreen(navigationController: UINavigationController?, registration: Bool, fromWelcome: Bool, animated: Bool = true) {
//        let viewController: LoginViewController = controllerFactory(ViewModelType: LoginViewModel.self, PresenterType: LoginPresenter.self, storyboard: rootStoryboard)
//
//        if registration == true {
//            viewController.registerAppearance = true
//        }
//
//        if fromWelcome == true {
//            viewController.fromWelcome = true
//        }
//
//        viewController.hidesBottomBarWhenPushed = true
//        navigationController?.isNavigationBarHidden = false
//        navigationController?.pushViewController(viewController, animated: animated)
    }


}
