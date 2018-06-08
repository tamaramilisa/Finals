//
//  TopListSingleViewController.swift
//  Finals
//
//  Created by tamara on 08/06/2018.
//  Copyright © 2018 tamara. All rights reserved.
//

import Foundation
import RxSwift
import SVProgressHUD
import RxDataSources
import EssentialPod

class TopListSingleViewController: BaseViewController {
    
    var viewModel: TopListSingleViewModel! {
        return baseViewModel as! TopListSingleViewModel
    }
    var presenter: TopListSinglePresenter! {
        return basePresenter as! TopListSinglePresenter
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    let bag = DisposeBag()
    var name: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.setUp()
        
        setupRx()
    }
    
    func setupRx() {
        
        let dataSource = RxTableViewSectionedReloadDataSource<TopListSingleSectionModel>(configureCell: { [weak self] (dataSrc, tv, idxPath, item) in
            guard let `self` = self else { return UITableViewCell() }
            
            let cell = tv.dequeueReusableCell(withIdentifier: "TopListSingleCell")!
            
            return self.presenter.configureTopListSingleCell(cell: cell, item: item)
            
        })
        
        viewModel.topListSingleVariable.asObservable().bind(to: tableView.rx.items(dataSource: dataSource)).disposed(by: bag)
    }
    
}
