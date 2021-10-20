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
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.backgroundColor = .clear
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
        self.backgroundColor = UIColor(named: "Ceramic white")
        stackview.axis = .vertical
        addsubviews(addingview: stackview, array: [imageview,timelabel,label])
        stackview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0(100)]-(5)-[v1(30)]|", options: [], metrics: nil, views: ["v0":imageview,"v1":label]))
        stackview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: [], metrics: nil, views: ["v0":imageview]))
        stackview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: [], metrics: nil, views: ["v0":label]))
        stackview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: [], metrics: nil, views: ["v0":timelabel]))
        stackview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0(30)]-(35)-|", options: [], metrics: nil, views: ["v0":timelabel]))
        stackview.bringSubviewToFront(timelabel)
        stackview.bringSubviewToFront(label)
        addSubview(stackview)
        NSLayoutConstraint(item: stackview, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: stackview, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 1, constant: 0).isActive = true
//        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":stackview]))
//        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: [], metrics: nil, views: ["v0":stackview]))
    }
    func addsubviews(addingview: UIView, array:[UIView]){
        for i in array{
            addingview.addSubview(i)
        }
    }
}
