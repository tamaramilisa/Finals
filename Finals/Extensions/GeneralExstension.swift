//
//  GeneralExstension.swift
//  Finals
//
//  Created by tamara on 16/05/2018.
//  Copyright © 2018 tamara. All rights reserved.
//

import Foundation
import UIKit
import Whisper
import CoreLocation
import MapKit
import RxSwift


extension UIViewController {
    
    func announceError(error: String?) {
        if let errorMsg = error {
            let message = Announcement(title: errorMsg, subtitle: "", image: UIImage(named: "alert"), duration: 3, action: nil)
            Whisper.show(shout: message, to: self)
        }
    }
    
    
    func announceSuccess(success: String?) {
        if let successMsg = success {
            let message = Announcement(title: successMsg, subtitle: "", image: UIImage(named: "success-icon"), duration: 3, action: nil)
            Whisper.show(shout: message, to: self)
        }
    }
    
}
