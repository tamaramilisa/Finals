//
//  StatisticsPresenter.swift
//  Finals
//
//  Created by tamara on 06/06/2018.
//  Copyright © 2018 tamara. All rights reserved.
//

import Foundation

class StatisticsPresenter: BasePresenter {
    
    private struct StatisticsStatic {
        static var title: String { get { return "Statistika" } }
        static var questions: String { get { return "Broj odgovorenih pitanja:" } }
        static var categories: String { get { return "Broj rješenih kategorija:" } }
        static var medals: String { get { return "Broj osvojenih medalja:" } }
    }
    
    required init() { }
    
    weak var baseViewController: BaseViewController!
    weak var viewController: StatisticsViewController! {
        return baseViewController as! StatisticsViewController
    }
    
    func setUp() {
        
        viewController.navigationItem.title = StatisticsStatic.title
        
        viewController.noAnsweredQuestionsLabel.text = "\(StatisticsStatic.questions) \(UserStorage.shared.userQuestions)/20"
        viewController.questionsProgressView.setProgress(Float(UserStorage.shared.userQuestions)/20, animated: true)
        viewController.noDoneCategoriesLabel.text = "\(StatisticsStatic.categories) \(UserStorage.shared.userCategories)/4"
        viewController.categoriesProgressView.setProgress(Float(UserStorage.shared.userCategories)/4, animated: true)
        viewController.noWonMedalsLabel.text = "\(StatisticsStatic.medals) \(UserStorage.shared.userMedals)/6"
        viewController.medalsProgressView.setProgress(Float(UserStorage.shared.userMedals)/6, animated: true)
        
    }
    
}
