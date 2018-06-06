//
//  TopListViewController.swift
//  Finals
//
//  Created by tamara on 06/06/2018.
//  Copyright © 2018 tamara. All rights reserved.
//

import Foundation
import RxSwift
import SVProgressHUD
import RxDataSources
import EssentialPod

class TopListViewController: BaseViewController {
    
    var viewModel: TopListViewModel! {
        return baseViewModel as! TopListViewModel
    }
    var presenter: TopListPresenter! {
        return basePresenter as! TopListPresenter
    }
    let bag = DisposeBag()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.setUp()
    }
    
    func setupRx() {
        
    }
        
}
