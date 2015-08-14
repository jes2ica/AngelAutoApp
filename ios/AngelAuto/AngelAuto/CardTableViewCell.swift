//
//  CardTableViewCell.swift
//  AngelAuto
//
//  Created by Yijie Zhuang on 8/8/15.
//  Copyright (c) 2015 angel. All rights reserved.
//

import UIKit

class CardTableViewCell: UITableViewCell {
    
    
    @IBOutlet var cardView: UIView!
    @IBOutlet var profileImg: UIImageView!

    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    
    @IBOutlet var commentBtn: UIButton!
    @IBOutlet var likeBtn: UIButton!
    
    
    @IBOutlet var recipeImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    
    override func layoutSubviews() {
        self.cardSetup()
        self.imageSetup()
    }
    
    func cardSetup() {
        self.cardView.alpha = 1.0
        self.cardView.layer.masksToBounds = false
        self.cardView.layer.cornerRadius = 1
        self.cardView.layer.shadowOffset = CGSizeMake(-0.2, 0.2)
        self.cardView.layer.shadowRadius = 1
        
        var path:UIBezierPath = UIBezierPath(rect:self.cardView.bounds)
        self.cardView.layer.shadowPath = path.CGPath
        self.cardView.layer.shadowOpacity = 0.2
    }
    
    func imageSetup() {
        profileImg.layer.cornerRadius = profileImg.frame.size.width/2
        profileImg.clipsToBounds = true
        profileImg.backgroundColor = UIColor.whiteColor()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}
