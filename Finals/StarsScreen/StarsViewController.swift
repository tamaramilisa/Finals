//
//  StarsViewController.swift
//  Finals
//
//  Created by tamara on 05/07/2018.
//  Copyright © 2018 tamara. All rights reserved.
//

import Foundation
import RxSwift
import SVProgressHUD
import RxDataSources
import EssentialPod

class StarsViewController: BaseViewController {
    
    var viewModel: StarsViewModel! {
        return baseViewModel as! StarsViewModel
    }
    var presenter: StarsPresenter! {
        return basePresenter as! StarsPresenter
    }
    let bag = DisposeBag()
    
    var noStars: Int = 0
    
    @IBOutlet weak var bravoLabel: UILabel!
    @IBOutlet weak var firstStarImageView: UIImageView!
    @IBOutlet weak var thirdStarImageView: UIImageView!
    @IBOutlet weak var secondStarImageView: UIImageView!
    @IBOutlet weak var bascButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.setUp()
        
        setupRx()
    }
    
    func setupRx() {
        
        bascButton.rx.tap.asDriver().drive(onNext: { [weak self] in
            guard let `self` = self else { return }
            
            UserStorage.shared.noStars = 0
            self.viewModel.navigationService.pushToMainScreen(navigationController: self.navigationController)
            }, onCompleted: nil, onDisposed: nil).disposed(by: bag)
    }

}
