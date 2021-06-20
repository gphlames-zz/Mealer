//
//  HomeViewController.swift
//  Hydrate
//
//  Created by user on 06/05/2020.
//  Copyright © 2021 swift tech. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    let homeView = HomeView()
    override func viewDidLoad() {
        super.viewDidLoad()
        let menubutton = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        if #available(iOS 13.0, *) {
            let menuOptions = UIMenu(title: "Options", image: nil, identifier: nil, options: .displayInline, children: menuActions())
            if #available(iOS 14.0, *) {
                menubutton.menu = menuOptions
                menubutton.showsMenuAsPrimaryAction = true
            } else {
                
            }
        } else {
            
        }
        menubutton.translatesAutoresizingMaskIntoConstraints = false
        menubutton.setImage(UIImage(systemName: "circle.grid.3x3"), for: .normal)
        let menuButton = UIBarButtonItem(customView: menubutton)
        navigationItem.leftBarButtonItem = menuButton
        navigationItem.leftBarButtonItem?.tintColor = .white
        view.addSubview(homeView.mainView)
        view.backgroundColor = .white
        navigationController?.navigationBar.barTintColor = UIColor(named: "firstshade")
        navigationController?.navigationBar.tintColor = .white
        NSLayoutConstraint(item: homeView.mainView, attribute: .height, relatedBy: .equal, toItem: view, attribute: .height, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: homeView.mainView, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 1, constant: 0).isActive = true
        let guide = view.safeAreaLayoutGuide
        homeView.mainView.topAnchor.constraint(equalTo: guide.topAnchor, constant: 0).isActive = true
        navigationItem.rightBarButtonItem?.tintColor = .white
        let plusButton = UIButton()
        plusButton.translatesAutoresizingMaskIntoConstraints = false
        plusButton.setImage(UIImage(systemName: "plus"), for: .normal)
        plusButton.addTarget(self, action: #selector(addPlan), for: .touchUpInside)
        let addButton = UIBarButtonItem(customView: plusButton)
        navigationItem.rightBarButtonItem = addButton
            
        }
    override func viewWillAppear(_ animated: Bool) {
        homeView.setConstraints()
    }
    @objc func addPlan(){
        let nav = UINavigationController(rootViewController: addingViewController())
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: true, completion: nil)
    }
    @available(iOS 13.0, *)
    func menuActions()->[UIAction]{
        return [UIAction(title: "My Plans",handler: { _ in
            
        }),
        UIAction(title: "Contact Us",handler: {_ in
            
        }),
        UIAction(title: "About",handler: {_ in
            
        })]
        
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
