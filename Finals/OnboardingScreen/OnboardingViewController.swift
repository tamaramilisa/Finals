//
//  OnboardingViewController.swift
//  Finals
//
//  Created by tamara on 21/05/2018.
//  Copyright © 2018 tamara. All rights reserved.
//

import Foundation
import RxSwift
import UIKit
import RxCocoa

class OnboardingViewController: BaseViewController {
    
    var viewModel: OnboardingViewModel! {
        return baseViewModel as! OnboardingViewModel
    }
    var presenter: OnboardingPresenter! {
        return basePresenter as! OnboardingPresenter
    }
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var goButton: UIButton!
    
    let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func goToWelcomeScreen(_ sender: Any) {
        viewModel.navigationService.pushToLoginScreen(navigationController: navigationController, registration: true)
    }
    
    
}
