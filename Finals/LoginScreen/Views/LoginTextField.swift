//
//  LoginTextField.swift
//  Finals
//
//  Created by tamara on 16/05/2018.
//  Copyright © 2018 tamara. All rights reserved.
//

import Foundation
import UIKit


class LoginTextField: UITextField {
    
    let padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        if self.rightViewMode == .always {
            let rightPadding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 200)
            return UIEdgeInsetsInsetRect(bounds, rightPadding)
        }
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
}
