//
//  ProfileViewController.swift
//  Finals
//
//  Created by tamara on 30/05/2018.
//  Copyright © 2018 tamara. All rights reserved.
//

import Foundation
import RxSwift
import NVActivityIndicatorView

class ProfileViewController: BaseViewController {
    
    var viewModel: ProfileViewModel! {
        return baseViewModel as! ProfileViewModel
    }
    var presenter: ProfilePresenter! {
        return basePresenter as! ProfilePresenter
    }
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var settingsButton: UIButton!
    @IBOutlet weak var logoutButton: UIButton!
    
    let bag = DisposeBag()
    var registerAppearance: Bool = false
    var nfc = NotificationCenter.default
    
    var fromWelcome: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupRx()
    }
    
    func setupRx() {
        
        settingsButton.rx.tap.asDriver().drive(onNext: { [weak self] in
            guard let `self` = self else { return }
            
            self.viewModel.navigationService.pushToSettingsScreen(navigationController: self.navigationController)
        }, onCompleted: nil, onDisposed: nil).disposed(by: bag)
        
    }
    
}
