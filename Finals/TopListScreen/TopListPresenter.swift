//
//  TopListPresenter.swift
//  Finals
//
//  Created by tamara on 06/06/2018.
//  Copyright © 2018 tamara. All rights reserved.
//

import Foundation

class TopListPresenter: BasePresenter {
    
    private struct TopListStatic {
        static var title: String { get { return "Top lista" } }
    }
    
    required init() { }
    
    weak var baseViewController: BaseViewController!
    weak var viewController: TopListViewController! {
        return baseViewController as! TopListViewController
    }
    
    func setUp() {
        
        viewController.navigationItem.title = TopListStatic.title
        
    }

}
