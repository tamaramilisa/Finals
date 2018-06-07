//
//  TopListPresenter.swift
//  Finals
//
//  Created by tamara on 06/06/2018.
//  Copyright © 2018 tamara. All rights reserved.
//

import Foundation

class TopListPresenter: BasePresenter {
    
    private struct TopListStatic {
        static var title: String { get { return "Top liste" } }
    }
    
    required init() { }
    
    weak var baseViewController: BaseViewController!
    weak var viewController: TopListViewController! {
        return baseViewController as! TopListViewController
    }
    
    func setUp() {
        
        viewController.navigationItem.title = TopListStatic.title
        
    }

    func configureTopListCell(cell: TopListCell, item: String) -> TopListCell {
        
        cell.titleLabel.setTitle(item, for: .normal)
    
        cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, 2000)
        
        return cell
    }
}
