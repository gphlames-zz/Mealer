//
//  CollectionViewCell.swift
//  Hydrate
//
//  Created by user on 06/05/2020.
//  Copyright © 2021 swift tech. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    var imageview: UIImageView = UIImageView()
    var label: UILabel = UILabel()
    
    func setUpviews(){
        let imageViewStack: UIStackView = UIStackView()
        label.textAlignment = .center
        label.numberOfLines = 0
        imageViewStack.axis = .horizontal
        imageViewStack.addSubview(imageview)
        contentView.addSubview(imageViewStack)
        contentView.addSubview(label)
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageViewStack.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: imageview, attribute: .centerXWithinMargins, relatedBy: .equal, toItem: imageViewStack, attribute: .centerXWithinMargins, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: imageview, attribute: .height, relatedBy: .equal, toItem: imageViewStack, attribute: .height, multiplier: 1, constant: 0).isActive = true
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-(5)-[v0(35)]-(5)-[v1(30)]-(5)-|", options: [], metrics: nil, views: ["v0":imageViewStack,"v1": label]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: [], metrics: nil, views: ["v0":imageViewStack]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: [], metrics: nil, views: ["v0":label]))
    }
}
