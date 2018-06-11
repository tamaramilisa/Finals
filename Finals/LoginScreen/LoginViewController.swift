//
//  LoginViewController.swift
//  Finals
//
//  Created by tamara on 01/05/2018.
//  Copyright © 2018 tamara. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import NVActivityIndicatorView
import SVProgressHUD

class LoginViewController: BaseViewController , UITextFieldDelegate {

    var viewModel: LoginViewModel! {
        return baseViewModel as! LoginViewModel
    }
    var presenter: LoginPresenter! {
        return basePresenter as! LoginPresenter
    }
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var underlineView: UIView!
    @IBOutlet weak var greenUnderlineView: UIView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var nameTextField: LoginTextField!
    @IBOutlet weak var lastNameTextField: LoginTextField!
    @IBOutlet weak var emailTextField: LoginTextField!
    @IBOutlet weak var passwordTextField: LoginTextField!
    @IBOutlet weak var passwordButtonView: UIView!
    @IBOutlet weak var forgotPassButton: UIButton!
    @IBOutlet weak var emptyLabel: UILabel!
    @IBOutlet weak var signinButton: UIButton!
    @IBOutlet weak var stackViewHeight: NSLayoutConstraint!
    @IBOutlet weak var scrollViewTopPadding: NSLayoutConstraint!
    @IBOutlet weak var leadingGreenUnderlineView: NSLayoutConstraint!
    
    let bag = DisposeBag()
    var registerAppearance: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.setUp()
        
        nameTextField.delegate = self
        lastNameTextField.delegate = self
        passwordTextField.delegate = self
        emailTextField.delegate = self
        
        setupRx()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter.setUp()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    
    func setupRx() {
        let screenWidth = UIScreen.main.bounds.width
        
        loginButton.rx.tap.subscribe(onNext: { [weak self] () in
            guard let `self` = self else { return }
            
            self.title = LoginPresenter.LoginStatic.login
            self.view.endEditing(true)
            self.leadingGreenUnderlineView.constant = 0
            self.animateUnderline()
            self.passwordButtonView.isHidden = false
            self.nameTextField.isHidden = true
            self.lastNameTextField.isHidden = true
            self.emptyLabel.isHidden = false
            self.presenter.changeSignInButtonTitle(toRegister: false)
            self.clearAllTextFields()
        }, onError: nil, onCompleted: nil, onDisposed: nil).disposed(by: bag)
        
        registerButton.rx.tap.subscribe(onNext: { [weak self] () in
            guard let `self` = self else { return }

            self.title = LoginPresenter.LoginStatic.registration
            self.emailTextField.resignFirstResponder()
            self.passwordTextField.resignFirstResponder()
            self.leadingGreenUnderlineView.constant = screenWidth/2
            self.animateUnderline()
            self.passwordButtonView.isHidden = true
            self.nameTextField.isHidden = false
            self.lastNameTextField.isHidden = false
            self.emptyLabel.isHidden = true
            self.presenter.changeSignInButtonTitle(toRegister: true)
            self.clearAllTextFields()
            }, onError: nil, onCompleted: nil, onDisposed: nil).disposed(by: bag)
        
        forgotPassButton.rx.tap.subscribe(onNext: { [weak self] () in
//            self?.showAlertController()
            }, onError: nil, onCompleted: nil, onDisposed: nil).disposed(by: bag)
        
        signinButton.rx.tap.subscribe(onNext: { [weak self] () in
            guard let `self` = self else { return }
            
            if self.textFieldsValid() {
                if self.nameTextField.isHidden == true {

                } else {
                    self.register()
                }
            }
//            self.viewModel.navigationService.pushToMainScreen(navigationController: self.navigationController)
        }, onError: nil, onCompleted: nil, onDisposed: nil).disposed(by: bag)
    }
    
    func animateUnderline() {
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations:{ [weak self] in
            self?.underlineView.layoutIfNeeded()
            }, completion: nil)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        textField.rightViewMode = UITextFieldViewMode.never
        
        guard let text = textField.text else { return true }
        if string == "" { return true }
        
        switch textField {
        case nameTextField:
            if text.count == 30 {
                return false
            }
        case lastNameTextField:
            if text.count == 30 {
                return false
            }
        case emailTextField:
            if text.count == 50 {
                return false
            }
        case passwordTextField:
            if text.count == 25 {
                return false
            }
        default:
            return true
        }
        
        return true
    }
    
    
    func clearAllTextFields() {
        emailTextField.rightViewMode = .never
        passwordTextField.rightViewMode = .never
        nameTextField.rightViewMode = .never
        lastNameTextField.rightViewMode = .never
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.rightViewMode = UITextFieldViewMode.never
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if textField == emailTextField {
            passwordTextField.becomeFirstResponder()
        }
        if textField == nameTextField {
            lastNameTextField.becomeFirstResponder()
        }
        if textField == lastNameTextField {
            emailTextField.becomeFirstResponder()
        }
        
        return false
    }
    
    
    func textFieldsValid() -> Bool {
        var validated = true
        
        if let text = emailTextField.text {
            if !text.isValidEmailFormat() {
                validated = invalidateTextField(textField: emailTextField)
            }
        } else {
            validated = invalidateTextField(textField: emailTextField)
        }
        if let length = passwordTextField.text?.count {
            if length < 4 {
                validated = invalidateTextField(textField: passwordTextField)
            }
        } else {
            validated = invalidateTextField(textField: passwordTextField)
        }
        
        if leadingGreenUnderlineView.constant != 0 {
            if let length = nameTextField.text?.count {
                if length < 2 {
                    validated = invalidateTextField(textField: nameTextField)
                }
            } else {
                validated = invalidateTextField(textField: nameTextField)
            }
            if let length = lastNameTextField.text?.count {
                if length < 2 {
                    validated = invalidateTextField(textField: lastNameTextField)
                }
            } else {
                validated = invalidateTextField(textField: lastNameTextField)
            }
        }
        
        return validated
    }
    
    
    func invalidateTextField(textField: LoginTextField) -> Bool {
        textField.rightViewMode = UITextFieldViewMode.always
        textField.resignFirstResponder()
        textField.setNeedsDisplay()
        
        return false
    }
    
    func register() {
        nameTextField.resignFirstResponder()
        lastNameTextField.resignFirstResponder()
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        
        SVProgressHUD.show()
        
        viewModel.createUser(firstName: nameTextField.text!, lastName: lastNameTextField.text!, email: emailTextField.text!, password: passwordTextField.text!).subscribe(onNext: { [weak self] (result) in
            guard let `self` = self else { return }
            
            SVProgressHUD.dismiss()
            
            switch result {
            case .success(_):
                self.viewModel.navigationService.pushToMainScreen(navigationController: self.navigationController)
            case .failure(let error):
                if let requestError = error as? RequestError {
                    self.announceError(error: requestError.message)
                }
            }
            }, onError: { [weak self] (error) in
                SVProgressHUD.dismiss()
                self?.announceError(error: error.localizedDescription)
        }, onCompleted: nil).disposed(by: bag)
        
        
    }
    
    
}

