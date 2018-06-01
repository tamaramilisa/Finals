//
//  LearnListPresenter.swift
//  Finals
//
//  Created by tamara on 01/05/2018.
//  Copyright © 2018 tamara. All rights reserved.
//

import Foundation

class LearnListPresenter: BasePresenter {
    
    private struct LearnListStatic {
        static var title: String { get { return "Kategorije" } }
    }
    
    required init() { }
    
    weak var baseViewController: BaseViewController!
    weak var viewController: LearnListViewController! {
        return baseViewController as! LearnListViewController
    }
    
    func setUp() {
        
        viewController.navigationItem.title = LearnListStatic.title.uppercased()
    }
    
    func configureCategoryCell(cell: CategoryCell, title: String) -> CategoryCell {
        cell.titleLabel.text = title
        cell.progressBar.setProgress(0.2, animated: true)
        
        return cell
    }
}
