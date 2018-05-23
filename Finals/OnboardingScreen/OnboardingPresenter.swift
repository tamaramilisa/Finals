//
//  OnboardingPresenter.swift
//  Finals
//
//  Created by tamara on 21/05/2018.
//  Copyright © 2018 tamara. All rights reserved.
//

import Foundation
import UIKit

class OnboardingPresenter: BasePresenter {
    
    struct OnboardingStatic {
        static var title: String { get { return "Aplikacija za pomoć pri učenju zemljopisa. Nauči zemljopis na zabavan način!".localized() } }
        static var go: String { get { return "Kreni!".localized() } }
    }
    
    weak var baseViewController: BaseViewController!
    weak var viewController: OnboardingViewController! {
        return baseViewController as! OnboardingViewController
    }
    
    required init() {}
    
    func setup() {
        viewController.titleLabel.text = OnboardingStatic.title
        viewController.goButton.setTitle(OnboardingStatic.go.uppercased(), for: .normal)
    }

}
