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
        
        viewController.noAnsweredQuestionsLabel.text = "\(StatisticsStatic.questions) 3/10"
        viewController.questionsProgressView.setProgress(3/10, animated: true)
        viewController.noDoneCategoriesLabel.text = "\(StatisticsStatic.categories) 1/5"
        viewController.categoriesProgressView.setProgress(1/5, animated: true)
        viewController.noWonMedalsLabel.text = "\(StatisticsStatic.medals) 3/6"
        viewController.medalsProgressView.setProgress(3/6, animated: true)
        
    }
    
}
