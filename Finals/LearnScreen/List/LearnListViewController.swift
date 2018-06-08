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
import UIKit
import RxDataSources
import EssentialPod
import RxRealm
import RealmSwift

class LearnListViewController: BaseViewController {
    
    var viewModel: LearnListViewModel! {
        return baseViewModel as! LearnListViewModel
    }
    var presenter: LearnListPresenter! {
        return basePresenter as! LearnListPresenter
    }
    
    @IBOutlet weak var tableView: UITableView!
    let bag = DisposeBag()
    
    var dataSource: RxTableViewSectionedAnimatedDataSource<CategoriesSectionModel>!
    var fromWelcome: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.setUp()
        
        setupRx()
    }
    
    func setupRx() {
        tableView.registerWithNib(CategoryCell.self)
        
        dataSource = RxTableViewSectionedAnimatedDataSource<CategoriesSectionModel>(configureCell: { [weak self] (dataSrc, tv, idxPath, item) in
            guard let `self` = self else { return UITableViewCell() }
            
            let cell: CategoryCell = tv.dequeueReusableCell()
            
            self.listenToCellTaps(cell: cell)
            return self.presenter.configureCategoryCell(cell: cell, title: item.name!)
        })
        
        dataSource.animationConfiguration = AnimationConfiguration(insertAnimation: .fade, reloadAnimation: .fade, deleteAnimation: .fade)
        
        viewModel.categoriesVariable.asObservable().bind(to: tableView.rx.items(dataSource: dataSource)).disposed(by: bag)
        
//        tableView.rx.itemSelected.subscribe(onNext: { [weak self] (indexPath) in
//            guard let `self` = self else { return }
//
//            self.tableView.deselectRow(at: indexPath, animated: true)
//            let item = self.dataSource[indexPath]
//
////            self.viewModel.navigationService.pushToFeedSingleScreen(navigationController: self.navigationController, news: item)
//
//            }, onError: nil, onCompleted: nil, onDisposed: nil).disposed(by: bag)
        
    }
    
    func listenToCellTaps(cell: CategoryCell) {
        
        cell.learnButton.rx.tap.subscribe(onNext: { [weak self] () in
            guard let `self` = self else { return }
            
            self.viewModel.navigationService.pushToLearnSingleScreen(navigationController: self.navigationController, title: "Naslov")
            },onError: nil, onCompleted: nil, onDisposed: nil).disposed(by: cell.bag)
        
        cell.challengeButton.rx.tap.subscribe(onNext: { [weak self] () in
            guard let `self` = self else { return }
            
            self.viewModel.navigationService.pushToChallengeScreen(navigationController: self.navigationController)
            },onError: nil, onCompleted: nil, onDisposed: nil).disposed(by: cell.bag)
    }
    
    
}
