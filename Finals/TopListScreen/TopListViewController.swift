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
        
        setupRx()
    }
    
    func setupRx() {
        
        tableView.registerWithNib(TopListCell.self)
        
        let dataSource = RxTableViewSectionedReloadDataSource<TopListSectionModel>(configureCell: { [weak self] (dataSrc, tv, idxPath, item) in
            guard let `self` = self else { return UITableViewCell() }
            
            let cell: TopListCell = tv.dequeueReusableCell()
            
            return self.presenter.configureTopListCell(cell: cell, item: item)

        })
        
        viewModel.topListVariable.asObservable().bind(to: tableView.rx.items(dataSource: dataSource)).disposed(by: bag)

        tableView.rx.itemSelected.subscribe(onNext: { [weak self] (indexPath) in
            guard let `self` = self else { return }
            self.tableView.deselectRow(at: indexPath, animated: true)
            if indexPath.section == 0 {
                if dataSource[indexPath] == Lists.basic {
                    self.viewModel.navigationService.pushToTopListSingleScreen(navigationController: self.navigationController, topList: dataSource[indexPath])
                }
                if dataSource[indexPath] == Lists.flags {
                    self.viewModel.navigationService.pushToTopListSingleScreen(navigationController: self.navigationController, topList: dataSource[indexPath])
                }
                if dataSource[indexPath] == Lists.europe {
                    self.viewModel.navigationService.pushToTopListSingleScreen(navigationController: self.navigationController, topList: dataSource[indexPath])
                }
                if dataSource[indexPath] == Lists.cro {
                    self.viewModel.navigationService.pushToTopListSingleScreen(navigationController: self.navigationController, topList: dataSource[indexPath])
                }
                if dataSource[indexPath] == Lists.all {
                    self.viewModel.navigationService.pushToTopListSingleScreen(navigationController: self.navigationController, topList: dataSource[indexPath])
                }
            }

            }, onError: nil, onCompleted: nil, onDisposed: nil).disposed(by: bag)
        
    }
        
}
