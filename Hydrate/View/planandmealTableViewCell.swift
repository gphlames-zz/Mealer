//
//  planandmealTableViewCell.swift
//  Hydrate
//
//  Created by user on 06/05/2020.
//  Copyright © 2021 swift tech. All rights reserved.
//

import UIKit

class planandmealTableViewCell: UITableViewCell {
    let fonts = (UIApplication.shared.delegate as! AppDelegate).myAppfontAttributesItalic16
   lazy var imageview: UIImageView = {
        let imageview = UIImageView()
        imageview.contentMode = .scaleAspectFit
        imageview.translatesAutoresizingMaskIntoConstraints = false
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
     func setConstraints(){
        contentView.addSubview(imageview)
        contentView.addSubview(nameLabel)
        contentView.addSubview(timeLabel)
        contentView.addSubview(emptylabel)
        
        // MARK: - imageview constraints
        
        NSLayoutConstraint(item: imageview, attribute: .bottom, relatedBy: .equal, toItem: contentView, attribute: .bottom, multiplier: 1, constant: 5).isActive = false
        NSLayoutConstraint(item: imageview, attribute: .top, relatedBy: .equal, toItem: contentView, attribute: .top, multiplier: 1, constant: 5).isActive = false
        NSLayoutConstraint(item: imageview, attribute: .leading, relatedBy: .equal, toItem: contentView, attribute: .leading, multiplier: 1, constant: 5).isActive = false
        NSLayoutConstraint(item: imageview, attribute: .trailing, relatedBy: .equal, toItem: nameLabel, attribute: .leading, multiplier: 1, constant: 5).isActive = false
        NSLayoutConstraint(item: imageview, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 80).isActive = false
        
        // MARK: - nameLabel constraints
        NSLayoutConstraint(item: nameLabel, attribute: .bottom, relatedBy: .equal, toItem: timeLabel, attribute: .top, multiplier: 1, constant: 0).isActive = false
        NSLayoutConstraint(item: nameLabel, attribute: .leading, relatedBy: .equal, toItem: imageview, attribute: .trailing, multiplier: 1, constant: 0).isActive = false
        NSLayoutConstraint(item: nameLabel, attribute: .trailing, relatedBy: .equal, toItem: contentView, attribute: .trailing, multiplier: 1, constant: 5).isActive = false
        NSLayoutConstraint(item: nameLabel, attribute: .top, relatedBy: .equal, toItem: contentView, attribute: .top, multiplier: 1, constant: 5).isActive = false
        
        // MARK: - timelabel constraints
        
        NSLayoutConstraint(item: timeLabel, attribute: .leading, relatedBy: .equal, toItem: imageview, attribute: .trailing, multiplier: 1, constant: 0).isActive = false
        NSLayoutConstraint(item: timeLabel, attribute: .bottom, relatedBy: .equal, toItem: contentView, attribute: .bottom, multiplier: 1, constant: 5).isActive = false
        NSLayoutConstraint(item: timeLabel, attribute: .trailing, relatedBy: .equal, toItem: contentView, attribute: .trailing, multiplier: 1, constant: 5).isActive = false
        NSLayoutConstraint(item: timeLabel, attribute: .top, relatedBy: .equal, toItem: contentView, attribute: .top, multiplier: 1, constant: 5).isActive = false
        
        
        // MARK: - emptyLabel constraints
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":emptylabel]))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: [], metrics: nil, views: ["v0":emptylabel]))
        
    }
}
