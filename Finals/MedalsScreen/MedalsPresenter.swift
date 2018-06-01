//
//  MedalsPresenter.swift
//  Finals
//
//  Created by tamara on 01/06/2018.
//  Copyright © 2018 tamara. All rights reserved.
//

import Foundation

class MedalsPresenter: BasePresenter {
    
    private struct MedalStatic {
        static var title: String { get { return "Medalje" } }
    }
    
    required init() { }
    
    weak var baseViewController: BaseViewController!
    weak var viewController: MedalsViewController! {
        return baseViewController as! MedalsViewController
    }
    
    func setUp() {
        
        viewController.navigationItem.title = MedalStatic.title.uppercased()
        
        //dohvai medalje i stavi alphu onima koje nema
        viewController.secondMedalImageView.alpha = 0.2
        viewController.fourthMedalImageView.alpha = 0.2
        viewController.sixthMedalImageView.alpha = 0.2
        
    }
}
