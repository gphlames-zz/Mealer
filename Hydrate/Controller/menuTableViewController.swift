//
//  menuTableViewController.swift
//  Hydrate
//
//  Created by user on 06/05/2020.
//  Copyright © 2021 swift tech. All rights reserved.
//

import UIKit
protocol selected {
    func didselect(_ string: String)
}
class menuTableViewController: UITableViewController {
    let menu = ["Home", "Profile","My plans","Purchase Premium","Tips", "Settings"]
    var delegate:selected?
    override func viewDidLoad() {
        super.viewDidLoad()
        title = NSAttributedString(string: "Menu", attributes: [.font:UIFont(name: "Arial Bold", size: 24)]).string
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cells")
        tableView.backgroundColor = UIColor(named: "firstshade")
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = .white
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menu.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cells")
        cell?.textLabel?.attributedText = NSAttributedString(string: menu[indexPath.row], attributes: [.font:UIFont(name: "Arial", size: 14)])
        cell?.textLabel?.textColor = .white
        cell?.textLabel?.textAlignment = .left
        cell?.backgroundColor = UIColor(named: "firstshade")
        return cell!
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        delegate?.didselect(menu[indexPath.row])
    }
  
   
}
