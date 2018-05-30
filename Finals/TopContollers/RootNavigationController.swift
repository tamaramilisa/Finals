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
        navigationBar.barStyle = UIBarStyle.blackOpaque
        navigationBar.barTintColor = UIColor(red: 0/255, green: 144/255, blue: 81/255, alpha: 1.0)
        
        navigationBar.shadowImage = UIImage()
        navigationBar.backIndicatorImage = UIImage()
        
    }
    
}
