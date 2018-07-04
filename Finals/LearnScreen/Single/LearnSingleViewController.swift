//
//  LearnSingleViewController.swift
//  Finals
//
//  Created by tamara on 01/05/2018.
//  Copyright © 2018 tamara. All rights reserved.
//

import Foundation
import RxSwift
import SVProgressHUD
import RxDataSources
import EssentialPod

class LearnSingleViewController: BaseViewController {
    
    var viewModel: LearnSingleViewModel! {
        return baseViewModel as! LearnSingleViewModel
    }
    var presenter: LearnSinglePresenter! {
        return basePresenter as! LearnSinglePresenter
    }
    
    let bag = DisposeBag()
    var titlee: String?
    var desc: String?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.setUp()
    }
    
    func setupRx() {
        
    }
    
}
