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
        
        mockUsers()
        
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
    
    func mockUsers() {
        let user1 = RMUser(id: 1, firstName: "Tamara", lastName: "Miliša", points: 40)
        let user2 = RMUser(id: 2, firstName: "Ana", lastName: "Visković", points: 45)
        let user3 = RMUser(id: 3, firstName: "Toma", lastName: "Majić", points: 60)
        let user4 = RMUser(id: 4, firstName: "Filip", lastName: "Fajdetić", points: 15)
        
        self.viewModel.realmManager.saveUser(user: user1)
        self.viewModel.realmManager.saveUser(user: user2)
        self.viewModel.realmManager.saveUser(user: user3)
        self.viewModel.realmManager.saveUser(user: user4)
    }
        
}
