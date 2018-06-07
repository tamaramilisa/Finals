//
//  ChallengePresenter.swift
//  Finals
//
//  Created by tamara on 07/06/2018.
//  Copyright © 2018 tamara. All rights reserved.
//

import Foundation

class ChallengePresenter: BasePresenter {
    
    private struct ChallengeStatic {
        static var title: String { get { return "Izazov" } }
    }
    
    required init() { }
    
    weak var baseViewController: BaseViewController!
    weak var viewController: ChallengeViewController! {
        return baseViewController as! ChallengeViewController
    }
    
    func setUp() {
        
        viewController.navigationItem.title = ChallengeStatic.title
        
        
    }
    
}
