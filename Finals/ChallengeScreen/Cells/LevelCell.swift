//
//  LevelCell.swift
//  Finals
//
//  Created by tamara on 07/06/2018.
//  Copyright © 2018 tamara. All rights reserved.
//

import UIKit

class LevelCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var checkImageView: UIImageView!
    @IBOutlet weak var borderView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
        
        borderView.layer.borderWidth = 1.0
        borderView.layer.borderColor = UIColor(red: 0/255, green: 144/255, blue: 81/255, alpha: 1.0).cgColor
    }

}
