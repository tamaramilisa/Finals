//
//  StarsPresenter.swift
//  Finals
//
//  Created by tamara on 05/07/2018.
//  Copyright © 2018 tamara. All rights reserved.
//

import Foundation

class StarsPresenter: BasePresenter {
    
    private struct StarsStatic {
        static var title: String { get { return "Bravo!" } }
    }
    
    required init() { }
    
    weak var baseViewController: BaseViewController!
    weak var viewController: StarsViewController! {
        return baseViewController as! StarsViewController
    }
    
    func setUp() {
        
//        viewController.navigationItem.title = StarsStatic.title
        viewController.bravoLabel.text = "Bravo!"
        
        if viewController.noStars == 4 {
            viewController.firstStarImageView.image = UIImage(named: "yellow star")
            viewController.secondStarImageView.image = UIImage(named: "yellow star")
            viewController.thirdStarImageView.image = UIImage(named: "yellow star")
        } else if viewController.noStars == 3 {
            viewController.firstStarImageView.image = UIImage(named: "yellow star")
            viewController.secondStarImageView.image = UIImage(named: "yellow star")
            viewController.thirdStarImageView.image = UIImage(named: "gray star")
        } else if viewController.noStars == 2 {
            viewController.firstStarImageView.image = UIImage(named: "yellow star")
            viewController.secondStarImageView.image = UIImage(named: "gray star")
            viewController.thirdStarImageView.image = UIImage(named: "gray star")
        } else {
            viewController.firstStarImageView.image = UIImage(named: "gray star")
            viewController.secondStarImageView.image = UIImage(named: "gray star")
            viewController.thirdStarImageView.image = UIImage(named: "gray star")
        }
        
        viewController.bascButton.setTitle("Povratak", for: .normal)
    }
    
}
