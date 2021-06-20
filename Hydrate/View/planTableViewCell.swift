//
//  planTableViewCell.swift
//  Hydrate
//
//  Created by user on 06/05/2020.
//  Copyright © 2021 swift tech. All rights reserved.
//

import UIKit

class planTableViewCell: UITableViewCell {
    lazy var imageview: UIImageView = {
        let imageview = UIImageView()
        imageview.contentMode = .scaleAspectFit
        imageview.translatesAutoresizingMaskIntoConstraints = false
        return imageview
    }()
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        return label
    }()
    lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        return label
    }()
    override func awakeFromNib() {
        super.awakeFromNib()
       isUserInteractionEnabled = true
        contentView.addSubview(imageview)
        contentView.addSubview(nameLabel)
        contentView.addSubview(timeLabel)
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-(2)-[v0]-(2)-|", options: [], metrics: nil, views: ["v0":imageview]))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(2)-[v0(50))]", options: [], metrics: nil, views: ["v0":imageview]))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-(2)-[v0(30)]", options: [], metrics: nil, views: ["v0":nameLabel]))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0(20)]-(2)-|", options: [], metrics: nil, views: ["v0":timeLabel]))
        NSLayoutConstraint(item: nameLabel, attribute: .bottom, relatedBy: .equal, toItem: timeLabel, attribute: .top, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: nameLabel, attribute: .leading, relatedBy: .equal, toItem: imageview, attribute: .trailing, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: nameLabel, attribute: .trailing, relatedBy: .equal, toItem: contentView, attribute: .trailing, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: timeLabel, attribute: .leading, relatedBy: .equal, toItem: imageview, attribute: .trailing, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: timeLabel, attribute: .trailing, relatedBy: .equal, toItem: contentView, attribute: .trailing, multiplier: 1, constant: 0).isActive = true
    }

   

}
