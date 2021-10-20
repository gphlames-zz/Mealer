//
//  planandmealTableViewCell.swift
//  Hydrate
//
//  Created by user on 06/05/2020.
//  Copyright © 2021 swift tech. All rights reserved.
//

import UIKit

class planandmealTableViewCell: UITableViewCell {
    let fonts = fontData.arial14
   lazy var imageview: UIImageView = {
        let imageview = UIImageView()
        imageview.contentMode = .scaleAspectFit
        imageview.translatesAutoresizingMaskIntoConstraints = false
    imageview.layer.borderWidth = 0.5
    imageview.layer.borderColor = UIColor.black.cgColor
        return imageview
    }()
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var emptylabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.attributedText = NSAttributedString(string: "Section is empty please cick the plus button of this section to add a meal", attributes: fonts)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    lazy var stackview: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    override func layoutSubviews() {
        stackview.addSubview(timeLabel)
        stackview.addSubview(nameLabel)
        contentView.addSubview(imageview)
        contentView.addSubview(stackview)
        contentView.addSubview(emptylabel)
        
        
       
        // MARK: - imageview constraints
        
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(5)-[v0(60)]-(5)-[v1]-(5)-|", options: [], metrics: nil, views: ["v0":imageview,"v1":stackview]))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-(5)-[v0(60)]-(5)-|", options: [], metrics: nil, views: ["v0":imageview]))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-(5)-[v0(60)]-(5)-|", options: [], metrics: nil, views: ["v0":stackview]))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: [], metrics: nil, views: ["v0":emptylabel]))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":emptylabel]))
        // MARK: - nameLabel constraints
        stackview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: [], metrics: nil, views: ["v0":nameLabel]))
        stackview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: [], metrics: nil, views: ["v0":timeLabel]))
        stackview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0(30)][v1(30)]|", options: [], metrics: nil, views: ["v0":nameLabel,"v1":timeLabel]))
    }
}
