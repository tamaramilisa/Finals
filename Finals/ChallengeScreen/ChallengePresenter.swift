//
//  ChallengePresenter.swift
//  Finals
//
//  Created by tamara on 07/06/2018.
//  Copyright © 2018 tamara. All rights reserved.
//

import Foundation

class ChallengePresenter: BasePresenter {
    
    private struct ChallengeStatic {
        static var title: String { get { return "Izazov" } }
    }
    
    required init() { }
    
    weak var baseViewController: BaseViewController!
    weak var viewController: ChallengeViewController! {
        return baseViewController as! ChallengeViewController
    }
    
    func setUp() {
        
        viewController.navigationItem.title = ChallengeStatic.title
        
        
    }
    
    func configureLevelCell(cell: LevelCell, item: String) -> LevelCell {
        cell.titleLabel.text = item
        
        cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, 2000)
        
        return cell
    }
    
}
