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
        self.contentView.addSubview(showCaseImage)
        let showCaseImage_x = NSLayoutConstraint(item: showCaseImage, attribute:.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute:.top, multiplier: 1, constant: 0)
        let showCaseImage_y = NSLayoutConstraint(item: showCaseImage, attribute:.left, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute:.left, multiplier: 1, constant: 0)
        self.addConstraints([showCaseImage_x, showCaseImage_y])
        self.showCaseImage = showCaseImage
        
        let nameLabel = UILabel(frame: .zero)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.textColor = UIColor.black
        self.contentView.addSubview(nameLabel)
        let nameLabel_x = NSLayoutConstraint(item: nameLabel, attribute:.right, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute:.right, multiplier: 1, constant: 5 )
        let nameLabel_y = NSLayoutConstraint(item: nameLabel, attribute:.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute:.top, multiplier: 1, constant: 5)
        let nameLabel_width = NSLayoutConstraint(item: nameLabel, attribute:.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute:.width, multiplier: 0.5, constant: 0)
        let nameLabel_height = NSLayoutConstraint(item: nameLabel, attribute:.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute:.height, multiplier: 0.3, constant: 0)
        self.addConstraints([nameLabel_x,nameLabel_y,nameLabel_width,nameLabel_height])
        self.nameLabel = nameLabel
        
        
        let description = UILabel(frame: .zero)
        description.translatesAutoresizingMaskIntoConstraints = false
        description.textColor = UIColor.black
        self.contentView.addSubview(description)
        let description_x = NSLayoutConstraint(item: description, attribute:.right, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute:.right, multiplier: 1, constant: 5 )
        let description_y = NSLayoutConstraint(item: description, attribute:.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nameLabel, attribute:.bottom, multiplier: 1, constant: 10)
        let description_width = NSLayoutConstraint(item: description, attribute:.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute:.width, multiplier: 0.5, constant: 0)
        let description_height = NSLayoutConstraint(item: description, attribute:.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute:.height, multiplier: 0.3, constant: 0)
        self.addConstraints([description_x,description_y,description_width,description_height])
        self.descri = description
        


    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
