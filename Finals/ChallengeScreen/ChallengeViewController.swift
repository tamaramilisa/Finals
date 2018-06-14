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
        
        setupRx()
    }
    
    func setupRx() {
        tableView.registerWithNib(LevelCell.self)
        
        let dataSource = RxTableViewSectionedReloadDataSource<ChallengeSectionModel>(configureCell: { [weak self] (dataSrc, tv, idxPath, item) in
            guard let `self` = self else { return UITableViewCell() }
            
            let cell: LevelCell = tv.dequeueReusableCell()
            
            return self.presenter.configureLevelCell(cell: cell, item: item)
            
        })
        
        viewModel.challengeVariable.asObservable().bind(to: tableView.rx.items(dataSource: dataSource)).disposed(by: bag)
        
        tableView.rx.itemSelected.subscribe( onNext: { [weak self] (indexPath) in
            guard let `self` = self else { return }
            
            self.viewModel.navigationService.pushToQuestionScreen(navigationController: self.navigationController)
        }).disposed(by: bag)
        
    }
    
}
