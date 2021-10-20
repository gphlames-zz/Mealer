//
//  dailyplanCollectionViewCell.swift
//  Hydrate
//
//  Created by user on 06/05/2020.
//  Copyright © 2021 swift tech. All rights reserved.
//

import UIKit

class dailymealantCollectionViewCell: UICollectionViewCell {
    lazy var imageview: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont(name: "Arial Bold", size: 16)
        return label
    }()
    lazy var timelabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont(name: "Arial Bold", size: 16)
        return label
    }()
    
    override func layoutSubviews() {
        let stackview = UIStackView()
        stackview.translatesAutoresizingMaskIntoConstraints = false
        self.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .vertical
        addsubviews(addingview: stackview, array: [imageview,timelabel,label])
        stackview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0(100)]-(5)-[v1(30)]|", options: [], metrics: nil, views: ["v0":imageview,"v1":label]))
        stackview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: [], metrics: nil, views: ["v0":imageview]))
        stackview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: [], metrics: nil, views: ["v0":label]))
        stackview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: [], metrics: nil, views: ["v0":timelabel]))
        NSLayoutConstraint(item: timelabel, attribute: .bottom, relatedBy: .equal, toItem: label, attribute: .top, multiplier: 1, constant: 5).isActive = true
        NSLayoutConstraint(item: timelabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 30).isActive = true
        stackview.bringSubviewToFront(timelabel)
        addSubview(stackview)
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":stackview]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: [], metrics: nil, views: ["v0":stackview]))
    }
    func addsubviews(addingview: UIView, array:[UIView]){
        for i in array{
            addingview.addSubview(i)
        }
    }
}
