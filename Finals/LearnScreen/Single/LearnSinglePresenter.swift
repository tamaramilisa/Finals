//
//  LearnSinglePresenter.swift
//  Finals
//
//  Created by tamara on 01/05/2018.
//  Copyright © 2018 tamara. All rights reserved.
//

import Foundation

class LearnSinglePresenter: BasePresenter {
    
    private struct LearnSingleStatic {
        static var title: String { get { return "Učenje" } }
    }
    
    required init() { }
    
    weak var baseViewController: BaseViewController!
    weak var viewController: LearnSingleViewController! {
        return baseViewController as! LearnSingleViewController
    }
    
    func setUp() {
        
        viewController.navigationItem.title = LearnSingleStatic.title
        
        viewController.titleLabel.text = viewController.titlee
        
    }
    
}
