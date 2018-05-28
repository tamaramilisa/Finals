//
//  MainViewController.swift
//  Finals
//
//  Created by tamara on 01/05/2018.
//  Copyright © 2018 tamara. All rights reserved.
//

import Foundation
import RxSwift
import NVActivityIndicatorView

class MainViewController: BaseViewController {
    
    var viewModel: MainViewModel! {
        return baseViewModel as! MainViewModel
    }
    var presenter: MainPresenter! {
        return basePresenter as! MainPresenter
    }
    
    let bag = DisposeBag()
    var registerAppearance: Bool = false
    var nfc = NotificationCenter.default
    
    var fromWelcome: Bool = false
//    var activityView: ActivityIndicatorInitializer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
