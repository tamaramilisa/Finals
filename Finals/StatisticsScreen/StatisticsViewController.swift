//
//  StatisticsViewController.swift
//  Finals
//
//  Created by tamara on 06/06/2018.
//  Copyright © 2018 tamara. All rights reserved.
//

import Foundation
import RxSwift
import SVProgressHUD
import RxDataSources
import EssentialPod

class StatisticsViewController: BaseViewController {
    
    var viewModel: StatisticsViewModel! {
        return baseViewModel as! StatisticsViewModel
    }
    var presenter: StatisticsPresenter! {
        return basePresenter as! StatisticsPresenter
    }
    let bag = DisposeBag()
   
    @IBOutlet weak var noAnsweredQuestionsLabel: UILabel!
    @IBOutlet weak var questionsProgressView: UIProgressView!
    @IBOutlet weak var noDoneCategoriesLabel: UILabel!
    @IBOutlet weak var categoriesProgressView: UIProgressView!
    @IBOutlet weak var noWonMedalsLabel: UILabel!
    @IBOutlet weak var medalsProgressView: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.setUp()
    }
    
    func setupRx() {
        
    }
    
}
