//
//  CategoryCell.swift
//  Finals
//
//  Created by tamara on 01/06/2018.
//  Copyright © 2018 tamara. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var learnButton: UIButton!
    @IBOutlet weak var challengeButton: UIButton!
    @IBOutlet weak var challengeButtonBottom: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        challengeButtonBottom.constant = 0
    }
    
}
