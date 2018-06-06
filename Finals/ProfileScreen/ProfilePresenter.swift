//
//  ProfilePresenter.swift
//  Finals
//
//  Created by tamara on 30/05/2018.
//  Copyright © 2018 tamara. All rights reserved.
//

import Foundation

class ProfilePresenter: BasePresenter {
    
    required init() { }
    
    weak var baseViewController: BaseViewController!
    weak var viewController: ProfileViewController! {
        return baseViewController as! ProfileViewController
    }
    
    func setUp() {
        
        viewController.navigationItem.title = "Profil"
        addBorder(button: viewController.firstButton)
        addBorder(button: viewController.settingsButton)
//        addBorder(button: viewController.statisticsButton)
        
    }
    
    func addBorder(button: UIButton) {
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor(red: 0/255, green: 144/255, blue: 81/255, alpha: 1.0).cgColor
    }
    
    
    func configureHeader(image: UIImage? = nil, url: URL? = nil) {
        if let img = image {
            viewController.profileImageView.image = img
            return
        }
//        viewController.profileImageView.associatedUrl = url
    }
}
