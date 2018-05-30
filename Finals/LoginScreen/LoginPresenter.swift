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
    
    struct LoginStatic {
        static var forgotPassTitle: String { get { return "Zaboravljena lozinka".localized() } }
        static var forgotPassMessage: String { get { return "Unesite email kako biste obnovili lozinku".localized() } }
        static var sendAction: String { get { return "Pošalji".localized() } }
        static var alertEmailPlaceholder: String { get { return "email@example.com".localized() } }
        static var cancelAction: String { get { return "Odustani".localized() } }
        static var login: String { get { return "Prijava".localized() } }
        static var registration: String { get { return "Registracija".localized() } }
        static var forgottenPass: String { get { return "Zaboravio si lozinku?".localized() } }
        static var register: String { get { return "Registriraj se".localized() } }
        static var nameError: String { get { return "Broj znakova mora biti veći od 2".localized() } }
        static var lastNameError: String { get { return "Broj znakova mora biti veći od 2".localized() } }
        static var emailError: String { get { return "Neispravan email".localized() } }
        static var passwordError: String { get { return "Broj znakova mora biti veći od 3".localized() } }
        static var emailSent: String { get { return "Email za potvrdu računa je uspješno poslan.".localized() } }
        static var recoveryMailSent: String { get { return "Email za obnovu lozinke je uspješno poslan.".localized() } }
    }
    
    required init() {}
    
    weak var baseViewController: BaseViewController!
    weak var viewController: LoginViewController! {
        return baseViewController as! LoginViewController
    }
    
    func setUp() {
    
        let screenWidth = UIScreen.main.bounds.width
        
        if viewController.registerAppearance == true {
            viewController.title = LoginStatic.registration
            
            viewController.leadingGreenUnderlineView.constant = screenWidth/2
            viewController.passwordButtonView.isHidden = true
            viewController.nameTextField.isHidden = false
            viewController.lastNameTextField.isHidden = false
            viewController.emptyLabel.isHidden = true
            
            changeSignInButtonTitle(toRegister: true)
        } else {
            viewController.title = LoginStatic.login
            
            viewController.passwordButtonView.isHidden = false
            viewController.nameTextField.isHidden = true
            viewController.lastNameTextField.isHidden = true

            changeSignInButtonTitle(toRegister: false)
            
        }
        
        viewController.loginButton.setTitle(LoginStatic.login, for: .normal)
        viewController.forgotPassButton.setTitle(LoginStatic.forgottenPass, for: .normal)
        viewController.registerButton.setTitle(LoginStatic.registration, for: .normal)
        
        addRightView(textField: viewController.nameTextField, text: LoginStatic.nameError)
        addRightView(textField: viewController.lastNameTextField, text: LoginStatic.lastNameError)
        addRightView(textField: viewController.emailTextField, text: LoginStatic.emailError)
        addRightView(textField: viewController.passwordTextField, text: LoginStatic.passwordError)
    }
    
    func changeSignInButtonTitle(toRegister register: Bool) {
        if register {
            viewController.signinButton.setTitle(LoginStatic.register.uppercased(), for: .normal)
        } else {
            viewController.signinButton.setTitle(LoginStatic.login.uppercased(), for: .normal)
        }
    }

    func addRightView(textField: LoginTextField, text: String) {
        textField.rightViewMode = UITextFieldViewMode.never
        let label = UILabel(frame: CGRect(x: 0, y: 10, width: 180, height: 30))
        label.textColor = UIColor.red
        label.text = text
        label.font = UIFont(name: "Helvetica", size: 10)
        label.textAlignment = NSTextAlignment.center
        textField.rightView = label
    }
    
}
