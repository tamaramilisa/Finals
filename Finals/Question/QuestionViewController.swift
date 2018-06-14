//
//  QuestionViewController.swift
//  Finals
//
//  Created by tamara on 14/06/2018.
//  Copyright © 2018 tamara. All rights reserved.
//

import Foundation
import RxSwift
import SVProgressHUD
import RxDataSources
import EssentialPod

class QuestionViewController: BaseViewController {
    
    var viewModel: QuestionViewModel! {
        return baseViewModel as! QuestionViewModel
    }
    var presenter: QuestionPresenter! {
        return basePresenter as! QuestionPresenter
    }
    
    let bag = DisposeBag()
    var titlee: String?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.setUp()
    }
    
    func setupRx() {
        
    }
    
}
