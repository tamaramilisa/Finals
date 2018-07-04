//
//  QuestionPresenter.swift
//  Finals
//
//  Created by tamara on 14/06/2018.
//  Copyright © 2018 tamara. All rights reserved.
//

import Foundation

class QuestionPresenter: BasePresenter {
    
    private struct QuestionStatic {
        static var title: String { get { return "Učenje" } }
    }
    
    required init() { }
    
    weak var baseViewController: BaseViewController!
    weak var viewController: QuestionViewController! {
        return baseViewController as! QuestionViewController
    }
    
    func setUp() {
        if let question = viewController.question {
            if let photo = question.photoName {
                viewController.photoImageView.image = UIImage(named: photo)
                viewController.photoImageView.isHidden = false
                viewController.photoImageViewHeight.constant = 150
                viewController.photoImageViewBottom.constant = 40
            } else {
                viewController.photoImageView.isHidden = true
                viewController.photoImageViewHeight.constant = 0
                viewController.photoImageViewBottom.constant = 0
            }
            viewController.titleLabel.text = question.text
            viewController.answer1Lane.text = question.answer1
            viewController.answer2Label.text = question.answer2
            viewController.answer3Label.text = question.answer3
            viewController.answer4Label.text = question.answer4
        }
    }
    
}
