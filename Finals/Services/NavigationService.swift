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
    var realmManager = RealmManager()
	let rootStoryboard = UIStoryboard(name: "Main", bundle: nil)
    let mainStroyboard = UIStoryboard(name: "MainScreen", bundle: nil)
    let categoriesStoryboard = UIStoryboard(name: "Categories", bundle: nil)
    
    var rootNavigationController: RootNavigationController!

	mutating func initWithScreen(window: UIWindow) {
        let viewController: LoginViewController = controllerFactory(ViewModelType: LoginViewModel.self, PresenterType: LoginPresenter.self, storyboard: rootStoryboard)
        
        rootNavigationController = RootNavigationController(rootViewController: viewController)
        window.rootViewController = rootNavigationController
	}
    
    mutating func initWithOnboardingTutorial(window: UIWindow) {
        let viewController: OnboardingViewController = controllerFactory(ViewModelType: OnboardingViewModel.self, PresenterType: OnboardingPresenter.self, storyboard: rootStoryboard)
        
        rootNavigationController = RootNavigationController(rootViewController: viewController)
        window.rootViewController = rootNavigationController    }
    
    func pushToLoginScreen(navigationController: UINavigationController?, registration: Bool, fromWelcome: Bool, animated: Bool = true) {
        let viewController: LoginViewController = controllerFactory(ViewModelType: LoginViewModel.self, PresenterType: LoginPresenter.self, storyboard: rootStoryboard)

        if registration == true {
            viewController.registerAppearance = true
        }

        viewController.hidesBottomBarWhenPushed = true
        navigationController?.isNavigationBarHidden = false
        navigationController?.pushViewController(viewController, animated: animated)
    }
    
    func pushToMainScreen(navigationController: UINavigationController?) {
        let viewController: MainViewController = controllerFactory(ViewModelType: MainViewModel.self, PresenterType: MainPresenter.self, storyboard: mainStroyboard)
        
        viewController.hidesBottomBarWhenPushed = true
        navigationController?.isNavigationBarHidden = true
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func pushToLearnListScreen(navigationController: UINavigationController?) {
        let viewController: LearnListViewController = controllerFactory(ViewModelType: LearnListViewModel.self, PresenterType: LearnListPresenter.self, storyboard: categoriesStoryboard)
        
        viewController.hidesBottomBarWhenPushed = true
        navigationController?.isNavigationBarHidden = false
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func pushToProfileScreen(navigationController: UINavigationController?) {
        let viewController: ProfileViewController = controllerFactory(ViewModelType: ProfileViewModel.self, PresenterType: ProfilePresenter.self, storyboard: mainStroyboard)
        
        viewController.hidesBottomBarWhenPushed = true
        navigationController?.isNavigationBarHidden = false
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func pushToSettingsScreen(navigationController: UINavigationController?) {
        let viewController: SettingsViewController = controllerFactory(ViewModelType: SettingsViewModel.self, PresenterType: SettingsPresenter.self, storyboard: mainStroyboard)
        
        viewController.hidesBottomBarWhenPushed = true
        navigationController?.isNavigationBarHidden = true
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func popController(navigationController: UINavigationController?) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    
    func controllerFactory<T: BaseViewController, V: BaseViewModel, P: BasePresenter>(ViewModelType: V.Type, PresenterType: P.Type, storyboard: UIStoryboard) -> T {
        
        var viewModel = ViewModelType.init()
        viewModel.navigationService = self
        viewModel.networking = networking
        
        
        var presenter = PresenterType.init()
        let viewController: T = storyboard.instantiateViewController()
        viewController.baseViewModel = viewModel
        viewController.basePresenter = presenter
        presenter.baseViewController = viewController
        
        return viewController
    }


}
