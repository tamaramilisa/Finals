//
//  MedalsPresenter.swift
//  Finals
//
//  Created by tamara on 01/06/2018.
//  Copyright © 2018 tamara. All rights reserved.
//

import Foundation

class MedalsPresenter: BasePresenter {
    required init() { }
    
    weak var baseViewController: BaseViewController!
    weak var viewController: MedalsViewController! {
        return baseViewController as! MedalsViewController
    }
    
    func setUp() {
        
    }
}
