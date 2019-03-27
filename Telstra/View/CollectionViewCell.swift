//
//  CollectionViewCell.swift
//  Telstra
//
//  Created by CobraAppleTV on 20/03/19.
//  Copyright © 2019 wipro. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    static var identifier: String = "Cell"
    
    weak var showCaseImage:UIImageView!
    weak var nameLabel: UILabel!
    weak var descri: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        
        let showCaseImage = UIImageView(frame: .zero)
        showCaseImage.translatesAutoresizingMaskIntoConstraints = false
        showCaseImage.backgroundColor = UIColor.black
        showCaseImage.contentMode = .scaleToFill
        self.contentView.addSubview(showCaseImage)
        let showCaseImage_x = NSLayoutConstraint(item: showCaseImage, attribute:.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute:.top, multiplier: 1, constant: 0)
        let showCaseImage_y = NSLayoutConstraint(item: showCaseImage, attribute:.left, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute:.left, multiplier: 1, constant: 0)
        let showCaseImage_width = NSLayoutConstraint(item: showCaseImage, attribute:.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute:.width, multiplier: 0.4, constant: 0)
        let showCaseImage_height = NSLayoutConstraint(item: showCaseImage, attribute:.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute:.height, multiplier: 1, constant: 0)
        self.addConstraints([showCaseImage_x, showCaseImage_y,showCaseImage_width,showCaseImage_height])
        self.showCaseImage = showCaseImage
        
        let nameLabel = UILabel(frame: .zero)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.textColor = UIColor.black
        nameLabel.sizeToFit()
        nameLabel.numberOfLines = 0
        nameLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        nameLabel.font = UIFont.boldSystemFont(ofSize: 17)
        self.contentView.addSubview(nameLabel)
        let nameLabel_x = NSLayoutConstraint(item: nameLabel, attribute:.left, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.showCaseImage, attribute:.right, multiplier: 1, constant: 2 )
        let nameLabel_y = NSLayoutConstraint(item: nameLabel, attribute:.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute:.top, multiplier: 1, constant: 5)
        let nameLabel_width = NSLayoutConstraint(item: nameLabel, attribute:.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute:.width, multiplier: 0.6, constant: 0)
        let nameLabel_height = NSLayoutConstraint(item: nameLabel, attribute:.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute:.height, multiplier: 0.1, constant: 0)
        self.addConstraints([nameLabel_x,nameLabel_y,nameLabel_width,nameLabel_height])
        self.nameLabel = nameLabel
        
        
        let description = UILabel(frame: .zero)
        description.translatesAutoresizingMaskIntoConstraints = false
        description.textColor = UIColor.black
        description.sizeToFit()
        description.numberOfLines = 0
        description.lineBreakMode = NSLineBreakMode.byWordWrapping
        description.font = UIFont.systemFont(ofSize: 13)
        self.contentView.addSubview(description)
        let description_x = NSLayoutConstraint(item: description, attribute:.left, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.showCaseImage, attribute:.right, multiplier: 1, constant: 2 )
        let description_y = NSLayoutConstraint(item: description, attribute:.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nameLabel, attribute:.bottom, multiplier: 1, constant: 2)
        let description_width = NSLayoutConstraint(item: description, attribute:.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute:.width, multiplier: 0.5, constant: 0)
        let description_height = NSLayoutConstraint(item: description, attribute:.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute:.height, multiplier: 0.3, constant: 0)
        self.addConstraints([description_x,description_y,description_width,description_height])
        self.descri = description
        


    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
