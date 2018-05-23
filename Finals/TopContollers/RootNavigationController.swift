//
//  RootNavigationController.swift
//  Finals
//
//  Created by tamara on 23/04/2018.
//  Copyright © 2018 tamara. All rights reserved.
//

import Foundation
import UIKit


class RootNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.tintColor = UIColor.white
        navigationBar.isTranslucent = true
        navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white, NSAttributedStringKey.font: UIFont.systemFont(ofSize: 18, weight: .semibold)]
        navigationBar.barStyle = UIBarStyle.black
        
        if #available(iOS 11.0, *) {
            navigationBar.prefersLargeTitles = true
            navigationBar.largeTitleTextAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white, NSAttributedStringKey.font:UIFont.systemFont(ofSize: 34, weight: .bold)]
        }
        
        navigationBar.shadowImage = UIImage()
        navigationBar.backIndicatorImage = UIImage()
        
    }
    
}
