//
//  MainViewController.swift
//  Finals
//
//  Created by tamara on 01/05/2018.
//  Copyright © 2018 tamara. All rights reserved.
//

import Foundation
import RxSwift
import NVActivityIndicatorView

class MainViewController: BaseViewController {
    
    var viewModel: MainViewModel! {
        return baseViewModel as! MainViewModel
    }
    var presenter: MainPresenter! {
        return basePresenter as! MainPresenter
    }
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var medalsButton: UIButton!
    @IBOutlet weak var categoriesButton: UIButton!
    
    let bag = DisposeBag()
    
    var fromWelcome: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        setupRx()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    func setupRx() {
        
        let tapRecognizer = UITapGestureRecognizer()
        profileImageView.addGestureRecognizer(tapRecognizer)
        tapRecognizer.rx.event.asDriver().drive(onNext: { [weak self] (sender) in
            guard let `self` = self else { return }
            
            self.viewModel.navigationService.pushToProfileScreen(navigationController: self.navigationController)
        }, onCompleted: nil, onDisposed: nil).disposed(by: bag)
        
        categoriesButton.rx.tap.asDriver().drive(onNext: { [weak self] in
            guard let `self` = self else { return }
        
            self.viewModel.navigationService.pushToLearnListScreen(navigationController: self.navigationController)
        }, onCompleted: nil, onDisposed: nil).disposed(by: bag)
        
        medalsButton.rx.tap.asDriver().drive(onNext: { [weak self] in
            guard let `self` = self else { return }
            
            self.viewModel.navigationService.pushToMedalsScreen(navigationController: self.navigationController)
        }, onCompleted: nil, onDisposed: nil).disposed(by: bag)
        
    }
    
}
