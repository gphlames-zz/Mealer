//
//  HomeViewController.swift
//  Hydrate
//
//  Created by user on 06/05/2020.
//  Copyright © 2021 swift tech. All rights reserved.
//

import UIKit
import SideMenu

class HomeViewController: UIViewController {
    let homeView = HomeView()
    var table: menuTableViewController?
    lazy var sidemenu:SideMenuNavigationController = {
        let side = SideMenuNavigationController(rootViewController: table!)
        side.leftSide = true
        side.dismissOnPush = true
        side.enableSwipeToDismissGesture = true
        side.menuWidth = 250
        side.presentationStyle = .menuSlideIn
        side.navigationBar.barTintColor = UIColor(named: "firstshade")
        side.title = NSAttributedString(string: "Menu", attributes: [.font:UIFont(name: "Arial Bold", size: 16),.foregroundColor:UIColor.white]).string
        side.navigationBar.tintColor = .white
        return side
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        table = menuTableViewController()
        let leftMenuButton = UIBarButtonItem(customView: createleftmenubutton())
        navigationItem.leftBarButtonItem = leftMenuButton
        let addButton = UIBarButtonItem(customView: createrightmenubutton())
        navigationItem.rightBarButtonItem = addButton
        view.addSubview(homeView)
        view.backgroundColor = .white
        
        if #available(iOS 15.0, *) {
            let navigationappearance = UINavigationBarAppearance()
            navigationappearance.configureWithOpaqueBackground()
            navigationappearance.backgroundColor = UIColor(named: "firstshade")
            navigationController?.navigationBar.standardAppearance = navigationappearance
            navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
            navigationController?.navigationBar.tintColor = .white
        }
        else{
            navigationController?.navigationBar.barTintColor = UIColor(named: "firstshade")
            navigationController?.navigationBar.tintColor = .white
        }
    
        table?.delegate = self
        addchildrenController()
    }
    
    func setexternalviewproperties(){
        homeView.frame = view.frame
        let guide = view.safeAreaLayoutGuide
        homeView.topAnchor.constraint(equalTo: guide.topAnchor, constant: 0).isActive = true
        homeView.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: 0).isActive = true
    }
    
    func createrightmenubutton() -> UIButton {
        let button  = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.addTarget(self, action: #selector(addPlan), for: .touchUpInside)
        return button
    }
    
    func createleftmenubutton() -> UIButton {
        let button  = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "line.horizontal.3.circle"), for: .normal)
        button.addTarget(self, action: #selector(menuActions), for: .touchUpInside)
        return button
    }
    
    func addchildrenController(){
        let profile = profileViewController()
        let settings = settingsViewController()
        self.addChild(profile)
        self.addChild(settings)
        profile.didMove(toParent: self)
        settings.didMove(toParent: self)
        profile.view.frame = view.bounds
        settings.view.frame = view.bounds
        view.addSubview(profile.view)
        view.addSubview(settings.view)
        profile.view.isHidden = true
        settings.view.isHidden = true
    }
    @objc func addPlan() {
        navigationController?.show(addingViewController(), sender: nil)
    }
    @objc func menuActions() {
        present(sidemenu, animated: true, completion: nil)
    }
}
extension HomeViewController:selected {
    func didselect(_ string: String) {
        if string == "Profile"{
            sidemenu.dismiss(animated: true) {
                for i in self.children {
                    if i is profileViewController {
                        i.view.isHidden = false
                    }
                    else {
                        i.view.isHidden = true
                    }
                }
            }
        }
        else if string == "Settings" {
            for i in self.children {
                if i is settingsViewController {
                    i.view.isHidden = false
                }
                else {
                    i.view.isHidden = true
                }
            }
        }
    }
    
    
}
