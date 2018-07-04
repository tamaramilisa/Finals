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
        addAlphaAndSetUserInteraction(imageView: viewController.firstMedalImageView, has: true)
        addAlphaAndSetUserInteraction(imageView: viewController.secondMedalImageView, has: false)
        addAlphaAndSetUserInteraction(imageView: viewController.thirdMedalImageView, has: true)
        addAlphaAndSetUserInteraction(imageView: viewController.fourthMedalImageView, has: false)
        addAlphaAndSetUserInteraction(imageView: viewController.fifthMedalImageView, has: true)
        addAlphaAndSetUserInteraction(imageView: viewController.sixthMedalImageView, has: false)
        
    }
    
    func addAlphaAndSetUserInteraction(imageView: UIImageView, has: Bool) {
        if has {
            imageView.isUserInteractionEnabled = true
            imageView.alpha = 1.0
        } else {
            imageView.isUserInteractionEnabled = false
            imageView.alpha = 0.2
        }
    }
    
}
