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
        if title == "Opće znanje"{
            cell.lockImageView.isHidden = true
            cell.isUserInteractionEnabled = true
            cell.lockImageRight.constant = 75
            cell.progressBar.setProgress(Float(UserStorage.shared.noStarsGeneral)/9, animated: true)
        } else if title == "Zastave" {
            cell.lockImageView.isHidden = true
            cell.isUserInteractionEnabled = true
            cell.lockImageRight.constant = 100
            cell.progressBar.setProgress(Float(UserStorage.shared.noStarsFlags)/9, animated: true)
        } else {
            cell.lockImageView.isHidden = false
            cell.lockImageRight.constant = 100
            cell.progressBar.setProgress(0, animated: true)
            cell.isUserInteractionEnabled = false
        }
        
        cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, 2000)
        
        return cell
    }
}
