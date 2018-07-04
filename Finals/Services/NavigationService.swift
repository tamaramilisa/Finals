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
    let medalsStoryboard = UIStoryboard(name: "Medals", bundle: nil)
    let topListStoryboard = UIStoryboard(name: "TopList", bundle: nil)
    let questionStoryboard = UIStoryboard(name: "Question", bundle: nil)
    
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
    
    func pushToLoginScreen(navigationController: UINavigationController?, registration: Bool, animated: Bool = true) {
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
        navigationController?.isNavigationBarHidden = false
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
    
    //dodaj u pozivu usera i spremi u varijablu u contr.
    func pushToMedalsScreen(navigationController: UINavigationController?) {
        let viewController: MedalsViewController = controllerFactory(ViewModelType: MedalsViewModel.self, PresenterType: MedalsPresenter.self, storyboard: medalsStoryboard)
        
        viewController.hidesBottomBarWhenPushed = true
        navigationController?.isNavigationBarHidden = false
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func pushToStatisticsScreen(navigationController: UINavigationController?) {
        let viewController: StatisticsViewController = controllerFactory(ViewModelType: StatisticsViewModel.self, PresenterType: StatisticsPresenter.self, storyboard: mainStroyboard)
        
        viewController.hidesBottomBarWhenPushed = true
        navigationController?.isNavigationBarHidden = false
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func pushToTopListScreen(navigationController: UINavigationController?) {
        let viewController: TopListViewController = controllerFactory(ViewModelType: TopListViewModel.self, PresenterType: TopListPresenter.self, storyboard: topListStoryboard)
        
        viewController.hidesBottomBarWhenPushed = true
        navigationController?.isNavigationBarHidden = false
        navigationController?.pushViewController(viewController, animated: true)
    }

    func pushToTopListSingleScreen(navigationController: UINavigationController?, topList: String) {
        let viewController: TopListSingleViewController = controllerFactory(ViewModelType: TopListSingleViewModel.self, PresenterType: TopListSinglePresenter.self, storyboard: topListStoryboard)
        
        viewController.name = topList
        
        viewController.hidesBottomBarWhenPushed = true
        navigationController?.isNavigationBarHidden = false
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    //prenesi cijelu kategoriju, za sad samo title
    func pushToLearnSingleScreen(navigationController: UINavigationController?, title: String, desc: String) {
        let viewController: LearnSingleViewController = controllerFactory(ViewModelType: LearnSingleViewModel.self, PresenterType: LearnSinglePresenter.self, storyboard: categoriesStoryboard)
        
        viewController.titlee = title
        viewController.desc = desc
        
        viewController.hidesBottomBarWhenPushed = true
        navigationController?.isNavigationBarHidden = false
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func pushToChallengeScreen(navigationController: UINavigationController?) {
        let viewController: ChallengeViewController = controllerFactory(ViewModelType: ChallengeViewModel.self, PresenterType: ChallengePresenter.self, storyboard: categoriesStoryboard)
        
        viewController.hidesBottomBarWhenPushed = true
        navigationController?.isNavigationBarHidden = false
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func pushToQuestionScreen(navigationController: UINavigationController?, question: RMQuestion) {
        let viewController: QuestionViewController = controllerFactory(ViewModelType: QuestionViewModel.self, PresenterType: QuestionPresenter.self, storyboard: questionStoryboard)
        
        viewController.question = question
        UserStorage.shared.questionId += 1
        
        viewController.hidesBottomBarWhenPushed = true
        navigationController?.isNavigationBarHidden = false
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
