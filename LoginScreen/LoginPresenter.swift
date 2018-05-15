//
//  LoginPresenter.swift
//  Finals
//
//  Created by tamara on 01/05/2018.
//  Copyright © 2018 tamara. All rights reserved.
//

import Foundation
import UIKit
//import NVActivityIndicator

class LoginPresenter: BasePresenter {
    
    required init() { }
    
    weak var baseViewController: BaseViewController!
    weak var viewController: LoginViewController! {
        return baseViewController as! LoginViewController
    }
    
    func setUp() {
        
        let screenWidth = UIScreen.main.bounds.width
        
//        addBorderToTextField(textField: viewController.nameTextField, corners: [UIRectCorner.topLeft, UIRectCorner.topRight], radius: 5)
//        addBorderToTextField(textField: viewController.passwordTextField, corners: [UIRectCorner.bottomLeft, UIRectCorner.bottomRight], radius: 5)
        
        if viewController.registerAppearance == true {
//            viewController.title = LoginStatic.registration
            
//            viewController.leadingGreenUnderview.constant = screenWidth/2
            viewController.passwordButtonView.isHidden = true
            viewController.nameTextField.isHidden = false
            viewController.surnameTextField.isHidden = false
            viewController.emptyLabel.isHidden = true
            
//            addBorderToTextField(textField: viewController.lastNameTextField, corners: UIRectCorner.allCorners, radius: 0)
//            addBorderToTextField(textField: viewController.emailTextField, corners: UIRectCorner.allCorners, radius: 0)
//            changeSignInButtonTitle(toRegister: true)
            
        } else {
//            viewController.title = LoginStatic.login
            
            viewController.passwordButtonView.isHidden = false
            viewController.nameTextField.isHidden = true
            viewController.surnameTextField.isHidden = true
            
//            addBorderToTextField(textField: viewController.emailTextField, corners: [UIRectCorner.topLeft, UIRectCorner.topRight], radius: 5)
//            changeSignInButtonTitle(toRegister: false)
            
        }
        
//        viewController.forgotPassButton.setTitle(LoginStatic.forgottenPass, for: UIControlState.normal)
//        viewController.loginButton.setTitle(LoginStatic.login, for: .normal)
//        viewController.registerButton.setTitle(LoginStatic.registration, for: .normal)
//        viewController.orLoginWithLabel.text = LoginStatic.orSignUp.localized()
        
//        addRightView(textField: viewController.nameTextField, text: LoginStatic.nameError)
//        addRightView(textField: viewController.lastNameTextField, text: LoginStatic.lastNameError)
//        addRightView(textField: viewController.emailTextField, text: LoginStatic.emailError)
//        addRightView(textField: viewController.passwordTextField, text: LoginStatic.passwordError)
    }
}
