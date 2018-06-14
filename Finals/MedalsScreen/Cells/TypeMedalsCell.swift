//
//  TypeMedalsCell.swift
//  Finals
//
//  Created by tamara on 14/06/2018.
//  Copyright © 2018 tamara. All rights reserved.
//

import UIKit

class TypeMedalsCell: UITableViewCell {

    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var secondImageView: UIImageView!
    @IBOutlet weak var thirdImageView: UIImageView!
    @IBOutlet weak var imageViewBottom: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageViewBottom.constant = 24
         selectionStyle = .none
        
    }

}
