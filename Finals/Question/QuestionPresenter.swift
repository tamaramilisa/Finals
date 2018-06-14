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
        
    }
    
}
