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
        
        addQuestions()
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
            print(self.viewModel.realmManager.getQuestionById(id: 1).first)
            
            if let question = self.viewModel.realmManager.getQuestionById(id: 1).first
            {
                self.viewModel.navigationService.pushToQuestionScreen(navigationController: self.navigationController, question: question)
            }
        }).disposed(by: bag)
        
    }
    
    func addQuestions() {
        
        let question1 = RMQuestion(id: 1, text: "Što znači gea?", answer1: "More", answer2: "Kuća", answer3: "Zemlja", answer4: "Dom", correct: 3)
        let question2 = RMQuestion(id: 2, text: "Koji je drugi naziv na zemljopis?", answer1: "Biologija", answer2: "Geografija", answer3: "Fizika", answer4: "Matematika", correct: 2)
        let question3 = RMQuestion(id: 3, text: "Što proučava geografija?", answer1: "Međuovisnost utjecaja prirodnih i društvenih procesa", answer2: "Računalne sustave", answer3: "Eroziju tla", answer4: "Biljni i životinjski svijet", correct: 1)
        let question4 = RMQuestion(id: 4, text: "Tko je prvi koristio riječ geografija?", answer1: "Aristotel", answer2: "Eratosten", answer3: "Pitagora", answer4: "Platon", correct: 2)
        
        self.viewModel.realmManager.saveQuestion(question: question1)
        self.viewModel.realmManager.saveQuestion(question: question2)
        self.viewModel.realmManager.saveQuestion(question: question3)
        self.viewModel.realmManager.saveQuestion(question: question4)
    }
    
}
