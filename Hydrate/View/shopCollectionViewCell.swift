//
//  shopCollectionViewCell.swift
//  Hydrate
//
//  Created by user on 06/05/2020.
//  Copyright © 2021 swift tech. All rights reserved.
//

import UIKit

class shopCollectionViewCell: UICollectionViewCell {
    lazy var imageView: UIImageView = {
        let imageview = UIImageView()
        imageview.translatesAutoresizingMaskIntoConstraints = false
        return imageview
    }()
    lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.attributedText = NSAttributedString(string: "$", attributes: [.font: UIFont(name: "Arial", size: 14)])
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: " Your meal plan", attributes: [.font: UIFont(name: "Arial", size: 14)])
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var purposeLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: " lose weight", attributes: [.font: UIFont(name: "Arial", size: 14)])
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var nameOfChefLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.attributedText = NSAttributedString(string: " Chef Adrianna", attributes: [.font: UIFont(name: "Arial", size: 14)])
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var numberOfUsersLabel: UILabel = {
        let label = UILabel()
        label.text = "900089"
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var ratingLabel: UILabel = {
        let label = UILabel()
        label.text = "5star"
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    func setConstraints(){
        // MARK: -> initialization Section
        
        let leftStack = UIStackView()
        let rightStack = UIStackView()
        
        // MARK: -> adding subviews section
        
        leftStack.addSubview(nameLabel)
        leftStack.addSubview(purposeLabel)
        leftStack.addSubview(nameOfChefLabel)
        rightStack.addSubview(numberOfUsersLabel)
        rightStack.addSubview(ratingLabel)
        contentView.addSubview(leftStack)
        contentView.addSubview(rightStack)
        contentView.addSubview(imageView)
        contentView.addSubview(priceLabel)
        // MARK: -> other attributes Section

        leftStack.translatesAutoresizingMaskIntoConstraints = false
        rightStack.translatesAutoresizingMaskIntoConstraints = false
        let sizeOfstacks = (contentView.bounds.width-2)/2
        leftStack.backgroundColor = .blue
        rightStack.backgroundColor = .red
        imageView.backgroundColor = .black
        contentView.bringSubviewToFront(leftStack)
        contentView.bringSubviewToFront(rightStack)
        // MARK: -> contentenview constraints
        
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0(60)]-(2)-|", options: [], metrics: nil, views: ["v0":leftStack]))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0(60)]-(2)-|", options: [], metrics: nil, views: ["v0":rightStack]))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-(5)-[v0(50)]", options: [], metrics: nil, views: ["v0":priceLabel]))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[v0(50)]-(5)-|", options: [], metrics: nil, views: ["v0":priceLabel]))
        
        // MARK: -> leftStack constraints
        
        leftStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: [], metrics: nil, views: ["v0":nameLabel]))
        leftStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: [], metrics: nil, views: ["v0":purposeLabel]))
        leftStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: [], metrics: nil, views: ["v0":nameOfChefLabel]))
        leftStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0(20)][v1(20)][v2(20)]|", options: [], metrics: nil, views: ["v0":nameLabel,"v1":purposeLabel,"v2":nameOfChefLabel]))
        NSLayoutConstraint(item: leftStack, attribute: .leading, relatedBy: .equal, toItem: contentView, attribute: .leading, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: leftStack, attribute: .trailing, relatedBy: .equal, toItem: rightStack, attribute: .leading, multiplier: 1, constant: 2).isActive = true
        NSLayoutConstraint(item: leftStack, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: sizeOfstacks).isActive = true
        
        // MARK: -> rightStack constraints
        
        NSLayoutConstraint(item: rightStack, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: sizeOfstacks).isActive = true
        NSLayoutConstraint(item: rightStack, attribute: .trailing, relatedBy: .equal, toItem: contentView, attribute: .trailing, multiplier: 1, constant: 0).isActive = true
        rightStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: [], metrics: nil, views: ["v0":numberOfUsersLabel]))
        rightStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: [], metrics: nil, views: ["v0": ratingLabel]))
        rightStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v1(20)][v1(20)]|", options: [], metrics: nil, views: ["v0":numberOfUsersLabel,"v1":ratingLabel]))
        
        // MARK: -> imageView constraints
        
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: [], metrics: nil, views: ["v0":imageView]))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0": imageView]))
        

    }
}
