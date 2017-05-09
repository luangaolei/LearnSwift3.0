//
//  ThirdTableViewCell.swift
//  SwiftButton
//
//  Created by xyqm on 16/10/17.
//  Copyright © 2016年 栾高垒. All rights reserved.
//

import UIKit

class ThirdTableViewCell: UITableViewCell {
    
    var headerImage = UIImageView()
    var titleLabel = UILabel()
    var clickButton = UIButton()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        if !self.isEqual(nil) {
            headerImage = UIImageView.init(frame: CGRect(x:10, y:10, width:80, height:80))
            headerImage.backgroundColor = UIColor.yellow
            headerImage.layer.masksToBounds = true
            headerImage.layer.cornerRadius = 40
            self.contentView.addSubview(headerImage)
            
            titleLabel = UILabel.init(frame: CGRect(x:headerImage.frame.maxX + 10, y:15, width:205, height:30))
            titleLabel.layer.borderColor = UIColor.black.cgColor
            titleLabel.layer.borderWidth = 1
            titleLabel.textColor = .magenta
            titleLabel.textAlignment = .center
            titleLabel.font = UIFont.systemFont(ofSize: 20.0)
            self.contentView.addSubview(titleLabel)

            clickButton = UIButton.init(frame: CGRect(x:titleLabel.frame.minX, y:titleLabel.frame.maxY + 10, width:100, height:30))
            clickButton.backgroundColor = UIColor.red
            clickButton.setTitleColor(UIColor.white, for: .normal)
            self.contentView.addSubview(clickButton)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() { 
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
