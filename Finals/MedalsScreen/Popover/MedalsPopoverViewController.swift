//
//  MedalsPopoverViewController.swift
//  Finals
//
//  Created by tamara on 01/06/2018.
//  Copyright © 2018 tamara. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

class MedalsPopoverViewController: UIViewController {
    
    private struct MedalsPopoverSTatic {
        static var successfulLogin: String { get { return "Medalja za uspješnu prijavu" } }
        static var firstStar: String { get { return "Medalja za osvojenu prvu zvjezdicu" } }
        static var threeStars: String { get { return "Medalja za osvojene 3 zvjezdice" } }
        static var allQuestions: String { get { return "Medalja za tocno odgovrena sva pitanja na jednoj razini" } }
        static var oneLevelCleared: String { get { return "Medalja za uspješno rješenu jednu razinu" } }
        static var fiveStars: String { get { return "Medalja za osvojeih 5 zvjezdica" } }
        static var tenStars: String { get { return "Medalja za osvojeih 10 zvjezdica" } }
        static var twentyStars: String { get { return "Medalja za osvojeih 20 zvjezdica" } }
    }
    
    @IBOutlet weak var congratulationsLabel: UILabel!
    @IBOutlet weak var medalImageView: UIImageView!
    @IBOutlet weak var descMedalLabel: UILabel!
    @IBOutlet weak var okButton: UIButton!
    @IBOutlet weak var separatorViewHeight: NSLayoutConstraint!
    @IBOutlet weak var descLabelBottom: NSLayoutConstraint!
    
    var medalNo: String?
    let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        separatorViewHeight.constant = 0.5
        
        setupRx()
    }
    
    func setupRx() {
        
        switch medalNo {
        case "1"?:
            medalImageView.image = UIImage(named: "trophy-singIn")
            descMedalLabel.text = MedalsPopoverSTatic.successfulLogin
            descLabelBottom.constant = 32
        case "2"?:
            medalImageView.image = UIImage(named: "star")
            descMedalLabel.text = MedalsPopoverSTatic.firstStar
            descLabelBottom.constant = 16
        case "3"?:
            medalImageView.image = UIImage(named: "3-stars")
            descMedalLabel.text = MedalsPopoverSTatic.threeStars
            descLabelBottom.constant = 32
        case "4"?:
            medalImageView.image = UIImage(named: "Question-marks")
            descMedalLabel.text = MedalsPopoverSTatic.allQuestions
            descLabelBottom.constant = 16
        case "5"?:
            medalImageView.image = UIImage(named: "boxWithFireworks")
            descMedalLabel.text = MedalsPopoverSTatic.oneLevelCleared
            descLabelBottom.constant = 16
        case "6"?:
            medalImageView.image = UIImage(named: "5 stars")
            descMedalLabel.text = MedalsPopoverSTatic.fiveStars
            descLabelBottom.constant = 32
        default:
            return
        }
        
        okButton.rx.tap.subscribe(onNext: { [weak self] () in
            guard let `self` = self else { return }
            
            self.dismiss(animated: true, completion: nil)
            }, onError: nil, onCompleted: nil, onDisposed: nil).disposed(by: bag)
        
    }
    
}
