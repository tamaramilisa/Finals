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
    var type: String?
    
    
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
            print(self.viewModel.realmManager.getQuestionById(id: 1, type: 1).first)
            print(self.viewModel.realmManager.getQuestionById(id: 1, type: 2).first)
            
            switch self.type {
            case "Opće znanje":
                print(self.viewModel.realmManager.getQuestionById(id: UserStorage.shared.questionId, type: 1).first)
                print(UserStorage.shared.questionId)
                if let question = self.viewModel.realmManager.getQuestionById(id: UserStorage.shared.questionId, type: 1).first
                {
                    self.viewModel.navigationService.pushToQuestionScreen(navigationController: self.navigationController, question: question)
                }
            case "Zastave":
                if let question = self.viewModel.realmManager.getQuestionById(id: UserStorage.shared.question2Id, type: 2).first
                {
                    self.viewModel.navigationService.pushToQuestionScreen(navigationController: self.navigationController, question: question)
                }
            case "Europa":
                if let question = self.viewModel.realmManager.getQuestionById(id: UserStorage.shared.question3Id, type: 3).first
                {
                    self.viewModel.navigationService.pushToQuestionScreen(navigationController: self.navigationController, question: question)
                }
            case "Hrvatska":
                if let question = self.viewModel.realmManager.getQuestionById(id: UserStorage.shared.question4Id, type: 4).first
                {
                    self.viewModel.navigationService.pushToQuestionScreen(navigationController: self.navigationController, question: question)
                }
            default:
                return
            }
        }).disposed(by: bag)
        
    }
    
    func addQuestions() {
        
        let question1 = RMQuestion(id: 1, text: "Što znači gea?", answer1: "More", answer2: "Kuća", answer3: "Zemlja", answer4: "Dom", correct: 3, type: 1, prKey: 1, photoName: "")
        let question2 = RMQuestion(id: 2, text: "Koji je drugi naziv na zemljopis?", answer1: "Biologija", answer2: "Geografija", answer3: "Fizika", answer4: "Matematika", correct: 2, type: 1, prKey: 2, photoName: "")
        let question3 = RMQuestion(id: 3, text: "Što proučava geografija?", answer1: "Međuovisnost utjecaja prirodnih i društvenih procesa", answer2: "Računalne sustave", answer3: "Eroziju tla", answer4: "Biljni i životinjski svijet", correct: 1, type: 1, prKey: 3, photoName: "")
        let question4 = RMQuestion(id: 4, text: "Tko je prvi koristio riječ geografija?", answer1: "Aristotel", answer2: "Eratosten", answer3: "Pitagora", answer4: "Platon", correct: 2, type: 1, prKey: 4, photoName: "")
        let question5 = RMQuestion(id: 5, text: "", answer1: "", answer2: "", answer3: "", answer4: "", correct: 2, type: 1, prKey: 5, photoName: "")
        let question6 = RMQuestion(id: 6, text: "", answer1: "", answer2: "", answer3: "", answer4: "", correct: 3, type: 1, prKey: 6, photoName: "")
        let question7 = RMQuestion(id: 7, text: "", answer1: "", answer2: "", answer3: "", answer4: "", correct: 3, type: 1, prKey: 7, photoName: "")
        let question8 = RMQuestion(id: 8, text: "", answer1: "", answer2: "", answer3: "", answer4: "", correct: 3, type: 1, prKey: 8, photoName: "")
        let question9 = RMQuestion(id: 9, text: "", answer1: "", answer2: "", answer3: "", answer4: "", correct: 3, type: 1, prKey: 9, photoName: "")
        let question10 = RMQuestion(id: 10, text: "", answer1: "", answer2: "", answer3: "", answer4: "", correct: 3, type: 1, prKey: 10, photoName: "")
        let question11 = RMQuestion(id: 11, text: "", answer1: "", answer2: "", answer3: "", answer4: "", correct: 3, type: 1, prKey: 11, photoName: "")
        let question12 = RMQuestion(id: 12, text: "", answer1: "", answer2: "", answer3: "", answer4: "", correct: 3, type: 1, prKey: 12, photoName: "")
        
        let question13 = RMQuestion(id: 13, text: "Oces radit?", answer1: "HA?", answer2: "a?", answer3: "I?", answer4: "Pit", correct: 3, type: 2, prKey: 1, photoName: "")
        let question14 = RMQuestion(id: 14, text: "Oces radit?", answer1: "HA?", answer2: "a?", answer3: "I?", answer4: "Pit", correct: 3, type: 2, prKey: 2, photoName: "")
        let question15 = RMQuestion(id: 15, text: "Oces radit?", answer1: "HA?", answer2: "a?", answer3: "I?", answer4: "Pit", correct: 3, type: 2, prKey: 3, photoName: "")
        let question16 = RMQuestion(id: 16, text: "Oces radit?", answer1: "HA?", answer2: "a?", answer3: "I?", answer4: "Pit", correct: 3, type: 2, prKey: 4, photoName: "")
        let question17 = RMQuestion(id: 17, text: "Oces radit?", answer1: "HA?", answer2: "a?", answer3: "I?", answer4: "Pit", correct: 3, type: 2, prKey: 1, photoName: "")
        let question18 = RMQuestion(id: 18, text: "Oces radit?", answer1: "HA?", answer2: "a?", answer3: "I?", answer4: "Pit", correct: 3, type: 2, prKey: 2, photoName: "")
        let question19 = RMQuestion(id: 19, text: "Oces radit?", answer1: "HA?", answer2: "a?", answer3: "I?", answer4: "Pit", correct: 3, type: 2, prKey: 3, photoName: "")
        let question20 = RMQuestion(id: 20, text: "Oces radit?", answer1: "HA?", answer2: "a?", answer3: "I?", answer4: "Pit", correct: 3, type: 2, prKey: 4, photoName: "")
        
        self.viewModel.realmManager.saveQuestion(question: question1)
        self.viewModel.realmManager.saveQuestion(question: question2)
        self.viewModel.realmManager.saveQuestion(question: question3)
        self.viewModel.realmManager.saveQuestion(question: question4)
        self.viewModel.realmManager.saveQuestion(question: question5)
        self.viewModel.realmManager.saveQuestion(question: question6)
        self.viewModel.realmManager.saveQuestion(question: question7)
        self.viewModel.realmManager.saveQuestion(question: question8)
        self.viewModel.realmManager.saveQuestion(question: question9)
        self.viewModel.realmManager.saveQuestion(question: question10)
        self.viewModel.realmManager.saveQuestion(question: question11)
        self.viewModel.realmManager.saveQuestion(question: question12)
        self.viewModel.realmManager.saveQuestion(question: question13)
        self.viewModel.realmManager.saveQuestion(question: question14)
        self.viewModel.realmManager.saveQuestion(question: question15)
        self.viewModel.realmManager.saveQuestion(question: question16)
        self.viewModel.realmManager.saveQuestion(question: question17)
        self.viewModel.realmManager.saveQuestion(question: question18)
        self.viewModel.realmManager.saveQuestion(question: question19)
        self.viewModel.realmManager.saveQuestion(question: question20)
        
    }
    
}
