//
//  HomeView.swift
//  Hydrate
//
//  Created by user on 06/05/2020.
//  Copyright © 2021 swift tech. All rights reserved.
//

import UIKit

class HomeView: UIView {
   lazy var emptyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.attributedText = NSAttributedString(string: "No active plan yet, click the add button to create one or select from your plans if you have any", attributes: [
            .foregroundColor: UIColor.lightGray,
            .font: UIFont(name: "Arial", size: 20),
        ])
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    override func layoutSubviews() {
        self.translatesAutoresizingMaskIntoConstraints = false
        addSubview(emptyLabel)
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0(100)]", options: [], metrics: nil, views: ["v0":emptyLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: [], metrics: nil, views: ["v0":emptyLabel]))
        NSLayoutConstraint(item: emptyLabel, attribute: .centerYWithinMargins, relatedBy: .equal, toItem: self, attribute: .centerYWithinMargins, multiplier: 1, constant: 0).isActive = true
    }
}
