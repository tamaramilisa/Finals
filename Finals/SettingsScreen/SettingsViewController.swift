//
//  SettingsViewController.swift
//  Finals
//
//  Created by tamara on 30/05/2018.
//  Copyright © 2018 tamara. All rights reserved.
//

import Foundation
import RxSwift
import NVActivityIndicatorView

class SettingsViewController: BaseViewController {
    
    var viewModel: SettingsViewModel! {
        return baseViewModel as! SettingsViewModel
    }
    var presenter: SettingsPresenter! {
        return basePresenter as! SettingsPresenter
    }
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var changeImageLabel: UILabel!
    
    let bag = DisposeBag()
    
    var fromWelcome: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupRx()
    }
    
    func setupRx() {
        
    }
    
}
