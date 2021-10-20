//
//  recipesearchview.swift
//  Hydrate
//
//  Created by user on 06/05/2020.
//  Copyright © 2021 swift tech. All rights reserved.
//

import UIKit

class recipesearchview: UIView {

    lazy var tableView: UITableView = {
        let tableview = UITableView()
        tableview.translatesAutoresizingMaskIntoConstraints = false
        return tableview
    }()
    lazy var searchbar: UISearchBar = {
        let search = UISearchBar()
        search.placeholder = " Search for meal here"
        search.translatesAutoresizingMaskIntoConstraints = false
        search.layer.cornerRadius = 8
        search.layer.borderWidth = 0.3
        return search
    }()
    override func layoutSubviews() {
        addSubview(searchbar)
        addSubview(tableView)
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-(5)-[v0(25)]-(10)-[v1]|", options: [], metrics: nil, views: ["v0":searchbar,"v1":tableView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: [], metrics: nil, views: ["v0":tableView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(10)-[v0]-(10)-|", options: [], metrics: nil, views: ["v0":searchbar]))
        NSLayoutConstraint(item: tableView, attribute: .top, relatedBy: .equal, toItem: searchbar, attribute: .bottom, multiplier: 1, constant: 10).isActive = true
    }
}
