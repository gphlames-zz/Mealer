//
//  HomeView.swift
//  Hydrate
//
//  Created by user on 06/05/2020.
//  Copyright © 2021 swift tech. All rights reserved.
//

import UIKit

class HomeView: UIView {
    var emptyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        let bodyAttributes: [NSAttributedString.Key: Any]=[
            .foregroundColor: UIColor.lightGray,
            .font: UIFont.systemFont(ofSize: CGFloat(20)),
        ]
        label.attributedText = NSAttributedString(string: "No active plan yet, click the add button to create one or select from your plans if you have any", attributes: bodyAttributes)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    var mainView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    func setConstraints(){
        mainView.addSubview(emptyLabel)
        mainView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0(100)]", options: [], metrics: nil, views: ["v0":emptyLabel]))
        mainView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: [], metrics: nil, views: ["v0":emptyLabel]))
        NSLayoutConstraint(item: emptyLabel, attribute: .centerYWithinMargins, relatedBy: .equal, toItem: mainView, attribute: .centerYWithinMargins, multiplier: 1, constant: 0).isActive = true
        mainView.bringSubviewToFront(emptyLabel)
    }
}
