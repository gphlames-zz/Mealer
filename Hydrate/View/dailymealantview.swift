//
//  dailymealantview.swift
//  Hydrate
//
//  Created by user on 06/05/2020.
//  Copyright © 2021 swift tech. All rights reserved.
//

import UIKit

class dailymealantview: UIView {
    lazy var collectionview: UICollectionView = {
        let flowlayout = UICollectionViewFlowLayout()
        flowlayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: flowlayout)
        collection.register(dailymealantCollectionViewCell.self, forCellWithReuseIdentifier: "dailymealantcollectionviewcell")
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = UIColor(named: "Ceramic white")
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    override func layoutSubviews() {
        addSubview(collectionview)
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0": collectionview]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: [], metrics: nil, views: ["v0": collectionview]))
    }
}
