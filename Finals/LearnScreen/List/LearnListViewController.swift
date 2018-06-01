//
//  LearnListViewController.swift
//  Finals
//
//  Created by tamara on 01/05/2018.
//  Copyright © 2018 tamara. All rights reserved.
//

import Foundation
import RxSwift
import SVProgressHUD

class LearnListViewController: BaseViewController {
    
    var viewModel: LearnListViewModel! {
        return baseViewModel as! LearnListViewModel
    }
    var presenter: LearnListPresenter! {
        return basePresenter as! LearnListPresenter
    }
    
    let bag = DisposeBag()
    
    var fromWelcome: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
}
