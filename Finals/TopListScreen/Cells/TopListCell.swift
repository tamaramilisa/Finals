//
//  TopListCell.swift
//  Finals
//
//  Created by tamara on 07/06/2018.
//  Copyright © 2018 tamara. All rights reserved.
//

import UIKit

class TopListCell: UITableViewCell {

    @IBOutlet weak var view: UIView!
    @IBOutlet weak var titleLabel: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        view.layer.borderWidth = 1.0
        view.layer.borderColor = UIColor(red: 0/255, green: 144/255, blue: 81/255, alpha: 1.0).cgColor
    }
}
