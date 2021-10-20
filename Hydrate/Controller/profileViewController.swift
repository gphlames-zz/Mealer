//
//  profileViewController.swift
//  Hydrate
//
//  Created by user on 06/05/2020.
//  Copyright © 2021 swift tech. All rights reserved.
//

import UIKit

class profileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = NSAttributedString(string: "Profile", attributes: [.font:UIFont(name: "Arial Bold", size: 16)]).string
        view.backgroundColor = .red
    }

}
