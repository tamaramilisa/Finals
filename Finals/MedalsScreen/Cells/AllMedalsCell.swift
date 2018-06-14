//
//  AllMedalsCell.swift
//  Finals
//
//  Created by tamara on 14/06/2018.
//  Copyright © 2018 tamara. All rights reserved.
//

import UIKit

class AllMedalsCell: UITableViewCell {

    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var secondImageView: UIImageView!
    @IBOutlet weak var thirdImageView: UIImageView!
    @IBOutlet weak var fourthImageView: UIImageView!
    @IBOutlet weak var fifthImageView: UIImageView!
    @IBOutlet weak var sixthImageView: UIImageView!
    @IBOutlet weak var imageViewBottom: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
        imageViewBottom.constant = 24
        
    }
    
}
