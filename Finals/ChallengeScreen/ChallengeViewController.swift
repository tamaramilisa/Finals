//
//  ChallengeViewController.swift
//  Finals
//
//  Created by tamara on 07/06/2018.
//  Copyright © 2018 tamara. All rights reserved.
//

import Foundation
import RxSwift
import SVProgressHUD
import RxDataSources
import EssentialPod

class ChallengeViewController: BaseViewController {
    
    var viewModel: ChallengeViewModel! {
        return baseViewModel as! ChallengeViewModel
    }
    var presenter: ChallengePresenter! {
        return basePresenter as! ChallengePresenter
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    let bag = DisposeBag()
    var titlee: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.setUp()
    }
    
    func setupRx() {
        
    }
    
}
