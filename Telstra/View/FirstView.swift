//
//  FirstView.swift
//  Telstra
//
//  Created by CobraAppleTV on 20/03/19.
//  Copyright © 2019 wipro. All rights reserved.
//

import UIKit

class FirstView: UIView {

    var collectionview: UICollectionView!
    var refressButton :UIButton!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Create an instance of UICollectionViewFlowLayout since you cant
        // Initialize UICollectionView without a layout
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionview = UICollectionView(frame: self.frame, collectionViewLayout: layout)
        collectionview.showsVerticalScrollIndicator = false
        self.addSubview(collectionview)
        
        // Refreh button
        refressButton = UIButton(type: .roundedRect) as UIButton
        refressButton.setTitle("Refresh", for: .normal)
        refressButton.setTitleColor(UIColor.white, for:.normal)
        refressButton.backgroundColor = UIColor.black
        self.addSubview(refressButton)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
