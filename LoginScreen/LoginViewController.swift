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
//import NVActivityIndicatorView
//import firebase

class LoginViewController: BaseViewController {

    @IBOutlet weak var myNavigationItem: UINavigationItem!
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var underlineView: UIView!
    @IBOutlet weak var greenUnderlineView: UIView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordButtonView: UIView!
    @IBOutlet weak var forgotPassButton: UIButton!
    @IBOutlet weak var emptyLabel: UILabel!
    @IBOutlet weak var signinButton: UIButton!
    @IBOutlet weak var stackViewHeight: NSLayoutConstraint!
    @IBOutlet weak var scrollViewTopPadding: NSLayoutConstraint!
    
    var viewModel: LoginViewModel! {
        return baseViewModel as! LoginViewModel
    }
    
    var presenter: LoginPresenter! {
        return basePresenter as! LoginPresenter
    }
    
    let bag = DisposeBag()
    var registerAppearance: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        presenter.setup()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        presenter.setup()
    }
    
    //ovo mi mozda ne treba
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
    }
    
}

