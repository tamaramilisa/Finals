//
//  QuestionViewController.swift
//  Finals
//
//  Created by tamara on 14/06/2018.
//  Copyright © 2018 tamara. All rights reserved.
//

import Foundation
import RxSwift
import SVProgressHUD
import RxDataSources
import EssentialPod

class QuestionViewController: BaseViewController {
    
    var viewModel: QuestionViewModel! {
        return baseViewModel as! QuestionViewModel
    }
    var presenter: QuestionPresenter! {
        return basePresenter as! QuestionPresenter
    }
    
    let bag = DisposeBag()
    var question: RMQuestion?
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var answer1Lane: UILabel!
    @IBOutlet weak var answer2Label: UILabel!
    @IBOutlet weak var answer3Label: UILabel!
    @IBOutlet weak var answer4Label: UILabel!
    @IBOutlet weak var photoImageViewHeight: NSLayoutConstraint!
    @IBOutlet weak var photoImageViewBottom: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.setUp()
        
        setupRx()
    }
    
    func setupRx() {
        
        addTapRecognizer(label: answer1Lane, item: 1)
        addTapRecognizer(label: answer2Label, item: 2)
        addTapRecognizer(label: answer3Label, item: 3)
        addTapRecognizer(label: answer4Label, item: 4)
        
    }
    
    

func addTapRecognizer(label: UILabel, item: Int) {
    
    let tapRecognizer = UITapGestureRecognizer()
    label.addGestureRecognizer(tapRecognizer)
    tapRecognizer.rx.event.asDriver().drive(onNext: { [weak self] (sender) in
        guard let `self` = self else { return }
        
        if item == self.question?.correct {
            UserStorage.shared.noStars += 1
        }
        
        print(UserStorage.shared.counter)
        
        if UserStorage.shared.counter == 3 {
            UserStorage.shared.counter = 0
            UserStorage.shared.userQuestions += 1
            self.viewModel.navigationService.pushToStarsScreen(navigationController: self.navigationController)
        } else {
            if let type = self.question?.type {
                switch type {
                case 1:
                    if let question = self.viewModel.realmManager.getQuestionById(id: UserStorage.shared.questionId, type: 1).first
                    {
                        UserStorage.shared.counter += 1
                        UserStorage.shared.userQuestions += 1
                        self.viewModel.navigationService.pushToQuestionScreen(navigationController: self.navigationController, question: question)
                    }
                case 2:
                    if let question = self.viewModel.realmManager.getQuestionById(id: UserStorage.shared.question2Id, type: 2).first
                    {
                        UserStorage.shared.counter += 1
                        UserStorage.shared.userQuestions += 1
                        self.viewModel.navigationService.pushToQuestionScreen(navigationController: self.navigationController, question: question)
                    }
                case 3:
                    if let question = self.viewModel.realmManager.getQuestionById(id: UserStorage.shared.question3Id, type: 3).first
                    {
                        UserStorage.shared.counter += 1
                        UserStorage.shared.userQuestions += 1
                        self.viewModel.navigationService.pushToQuestionScreen(navigationController: self.navigationController, question: question)
                    }
                case 4:
                    if let question = self.viewModel.realmManager.getQuestionById(id: UserStorage.shared.question4Id, type: 4).first
                    {
                        UserStorage.shared.counter += 1
                        UserStorage.shared.userQuestions += 1
                        self.viewModel.navigationService.pushToQuestionScreen(navigationController: self.navigationController, question: question)
                    }
                default:
                    return
                }
            }
        }
        
        }, onCompleted: nil, onDisposed: nil).disposed(by: bag)
    
}
    
}
