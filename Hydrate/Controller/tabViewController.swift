//
//  tabViewController.swift
//  Hydrate
//
//  Created by user on 06/05/2020.
//  Copyright © 2021 swift tech. All rights reserved.
//

import UIKit

extension UITabBarController{
    
    func setbarappearance() {
        if #available(iOS 15.0, *) {
            let navigationappearance = UITabBarAppearance()
            navigationappearance.configureWithOpaqueBackground()
            navigationappearance.backgroundColor = .black
            self.tabBar.standardAppearance = navigationappearance
            self.tabBar.scrollEdgeAppearance = self.tabBar.standardAppearance
        } else {
            self.tabBar.barTintColor = .black
        }
    }
    
}
class tabViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
       let tabbaricons = ["house","cart","book"]
        let tabcontroller = configureTabBar()
        guard let items = tabcontroller.tabBar.items else{return}
        for i in 0..<tabbaricons.count{
            if i == 2{
                items[i].image = UIImage(named: "rice bowl")
                items[i+1].image = UIImage(systemName: tabbaricons[i])
                continue
            }else{
                items[i].image = UIImage(systemName: tabbaricons[i])
            }
        }
        tabcontroller.setbarappearance()
        present(tabcontroller, animated: true)
    }
    
    func configureTabBar() -> UITabBarController {
        let tabcontroller = UITabBarController()
        let homeController = UINavigationController(rootViewController: HomeViewController())
        let shopController = UINavigationController(rootViewController: shopViewController())
        let learnMoreController = UINavigationController(rootViewController: howtouseViewController())
        let mealSearchController = UINavigationController(rootViewController: recipeSearchViewController())
        homeController.title = "Home"
        shopController.title = "Shop"
        learnMoreController.title = "Learn more"
        mealSearchController.title = "Foods"
        tabcontroller.setViewControllers([homeController,shopController,mealSearchController,learnMoreController], animated: false)
        tabcontroller.modalPresentationStyle = .fullScreen
        return tabcontroller
    }

}
