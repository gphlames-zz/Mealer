//
//  menuitemsTableViewCell.swift
//  Hydrate
//
//  Created by user on 06/05/2020.
//  Copyright © 2021 swift tech. All rights reserved.
//

import UIKit

class menuitemsTableViewCell: UITableViewCell {

    lazy var imageview: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    lazy var title: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Arial Bold", size: 16)
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .clear
        return label
    }()
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    override func layoutSubviews() {
        addSubview(imageview)
        addSubview(title)
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":imageview]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: [], metrics: nil, views: ["v0":imageview]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: [], metrics: nil, views: ["v0":title]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0(40)]|", options: [], metrics: nil, views: ["v0":title]))
        bringSubviewToFront(title)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
