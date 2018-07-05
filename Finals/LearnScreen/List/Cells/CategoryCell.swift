//
//  CategoryCell.swift
//  Finals
//
//  Created by tamara on 01/06/2018.
//  Copyright © 2018 tamara. All rights reserved.
//

import UIKit
import RxSwift

class CategoryCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var learnButton: UIButton!
    @IBOutlet weak var challengeButton: UIButton!
    @IBOutlet weak var contentViewTop: NSLayoutConstraint!
    @IBOutlet weak var contentViewBottom: NSLayoutConstraint!
    @IBOutlet weak var stuffView: UIView!
    @IBOutlet weak var lockImageView: UIImageView!
    @IBOutlet weak var lockImageRight: NSLayoutConstraint!
    
    private(set) var bag = DisposeBag()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
        
        stuffView.layer.borderWidth = 1.0
        stuffView.layer.borderColor = UIColor(red: 0/255, green: 144/255, blue: 81/255, alpha: 1.0).cgColor
        
        contentViewTop.constant = 8
        contentViewBottom.constant = 8
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        bag = DisposeBag()
    }
    
}
