//
//  MainPresenter.swift
//  Finals
//
//  Created by tamara on 01/05/2018.
//  Copyright © 2018 tamara. All rights reserved.
//

import Foundation

class MainPresenter: BasePresenter {
    
    required init() { }
    
    weak var baseViewController: BaseViewController!
    weak var viewController: MainViewController! {
        return baseViewController as! MainViewController
    }
    
    func setUp() {
        
    }
}
