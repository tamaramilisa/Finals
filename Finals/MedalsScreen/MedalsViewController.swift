//
//  MedalsViewController.swift
//  Finals
//
//  Created by tamara on 01/06/2018.
//  Copyright © 2018 tamara. All rights reserved.
//

import Foundation
import RxSwift
import SVProgressHUD

class MedalsViewController: BaseViewController {
    
    var viewModel: MedalsViewModel! {
        return baseViewModel as! MedalsViewModel
    }
    var presenter: MedalsPresenter! {
        return basePresenter as! MedalsPresenter
    }
    
    @IBOutlet weak var firstMedalImageView: UIImageView!
    @IBOutlet weak var secondMedalImageView: UIImageView!
    @IBOutlet weak var thirdMedalImageView: UIImageView!
    @IBOutlet weak var fourthMedalImageView: UIImageView!
    @IBOutlet weak var fifthMedalImageView: UIImageView!
    @IBOutlet weak var sixthMedalImageView: UIImageView!
    
    let bag = DisposeBag()
//    var user: RMUser?
    
    var fromWelcome: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setupRx() {
        
        
        
    }
    
    
}
