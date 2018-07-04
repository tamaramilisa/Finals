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
import RxDataSources
import EssentialPod

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
    @IBOutlet weak var seventhMedalImageView: UIImageView!
    @IBOutlet weak var eightMedalImageView: UIImageView!
    
    let bag = DisposeBag()
    //    var user: RMUser?
    
    var fromWelcome: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.setUp()
        
        setupRx()
    }
    
    func setupRx() {
        
        addTapRecognizer(imageView: firstMedalImageView, medalNo: "1")
        addTapRecognizer(imageView: secondMedalImageView, medalNo: "2")
        addTapRecognizer(imageView: thirdMedalImageView, medalNo: "3")
        addTapRecognizer(imageView: fourthMedalImageView, medalNo: "4")
        addTapRecognizer(imageView: fifthMedalImageView, medalNo: "5")
        addTapRecognizer(imageView: sixthMedalImageView, medalNo: "6")
        
    }
    
    func addTapRecognizer(imageView: UIImageView, medalNo: String) {
        
        let tapRecognizer = UITapGestureRecognizer()
        imageView.addGestureRecognizer(tapRecognizer)
        tapRecognizer.rx.event.asDriver().drive(onNext: { [weak self] (sender) in
            guard let `self` = self else { return }
            
            self.showMedalPopover(sourceView: self.view, medalNo: medalNo)
            }, onCompleted: nil, onDisposed: nil).disposed(by: bag)
        
    }
    
    func showMedalPopover(sourceView: UIView, medalNo: String) {
        
        let vc : MedalsPopoverViewController = storyboard!.instantiateViewController()
        let screenWidth = Int(UIScreen.main.bounds.width)
        let height = 295
        vc.preferredContentSize = CGSize(width: screenWidth-80, height: height)
        vc.modalPresentationStyle = UIModalPresentationStyle.popover
        let popover: UIPopoverPresentationController = vc.popoverPresentationController!
        popover.sourceView = sourceView
        popover.sourceRect = sourceView.bounds
        popover.permittedArrowDirections = UIPopoverArrowDirection(rawValue: 0)
        popover.delegate = self
        
        vc.medalNo = medalNo
        
        present(vc, animated: true, completion: nil)
        
    }
    
}

extension MedalsViewController: UIPopoverPresentationControllerDelegate {
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
    
}
