//
//  shopView.swift
//  Hydrate
//
//  Created by user on 06/05/2020.
//  Copyright © 2021 swift tech. All rights reserved.
//

import UIKit

class shopView: UIView {
    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.placeholder = "Search for plans"
        return searchBar
    }()
    lazy var collectionView: UICollectionView = {
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
        collection.backgroundColor = .clear
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    lazy var filterButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "line.horizontal.3.decrease"), for: .normal)
        button.tintColor = UIColor(named: "firstshade")
        return button
    }()
    lazy var mainView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    func setUpConstraints(){
        let searchBarStack = UIStackView()
        mainView.addSubview(searchBarStack)
        mainView.addSubview(collectionView)
        searchBarStack.translatesAutoresizingMaskIntoConstraints = false
        searchBarStack.addSubview(searchBar)
        searchBarStack.addSubview(filterButton)
        mainView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-(10)-[v0(50)]-(10)-[v1]|", options: [], metrics: nil, views: ["v0":searchBarStack,"v1":collectionView]))
        mainView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(10)-[v0]-(10)-|", options: [], metrics: nil, views: ["v0":searchBarStack]))
        mainView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(10)-[v0]-(10)-|", options: [], metrics: nil, views: ["v0":collectionView]))
        searchBarStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0][v1(30)]-(5)-|", options: [], metrics: nil, views: ["v0":searchBar,"v1":filterButton]))
        searchBarStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":searchBar]))
        searchBarStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0]", options: [], metrics: nil, views: ["v0":filterButton]))
        NSLayoutConstraint(item: filterButton, attribute: .centerYWithinMargins, relatedBy: .equal, toItem: searchBarStack, attribute: .centerYWithinMargins, multiplier: 1, constant: 0).isActive = true
        
    }
}
