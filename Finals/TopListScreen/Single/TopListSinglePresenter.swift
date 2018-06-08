//
//  TopListSinglePresenter.swift
//  Finals
//
//  Created by tamara on 08/06/2018.
//  Copyright © 2018 tamara. All rights reserved.
//

import Foundation

class TopListSinglePresenter: BasePresenter {
    
    private struct TopListSingleStatic {
        static var title: String { get { return "Title" } }
    }
    
    required init() { }
    
    weak var baseViewController: BaseViewController!
    weak var viewController: TopListSingleViewController! {
        return baseViewController as! TopListSingleViewController
    }
    
    func setUp() {
        
        viewController.navigationItem.title = viewController.name
        
        
    }
    
    func configureTopListSingleCell(cell: UITableViewCell, item: String) -> UITableViewCell {
        cell.textLabel?.text = item
        
        return cell
    }
    
}
