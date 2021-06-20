//
//  tabViewController.swift
//  Hydrate
//
//  Created by user on 06/05/2020.
//  Copyright © 2021 swift tech. All rights reserved.
//

import UIKit

class tabViewController: UIViewController {
    private var tab: UITabBarController?
    override func viewDidLoad() {
        super.viewDidLoad()
       let tabbaricons = ["house","cart","book"]
        let tabb = UITabBarController()
        let home = UINavigationController(rootViewController: HomeViewController())
        let shop = UINavigationController(rootViewController: shopViewController())
        let learn_more = UINavigationController(rootViewController: howtouseViewController())
        home.title = "Home"
        shop.title = "Shop"
        learn_more.title = "Learn more"

        tabb.setViewControllers([home,shop,learn_more], animated: false)
        tabb.modalPresentationStyle = .fullScreen
        guard let items = tabb.tabBar.items else{return}
        for i in 0..<tabbaricons.count{
            if #available(iOS 13.0, *) {
                items[i].image = UIImage(systemName: tabbaricons[i])
            } else {
                // Fallback on earlier versions
            }
        }
        tabb.tabBar.barTintColor = .black
        tab = tabb
        present(tabb, animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
