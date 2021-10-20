//
//  recipedetailsViewController.swift
//  Hydrate
//
//  Created by user on 06/05/2020.
//  Copyright © 2021 swift tech. All rights reserved.
//

import UIKit
import FloatingPanel

class recipeparentdetailsViewController: UIViewController,FloatingPanelControllerDelegate {
    var fpc: FloatingPanelController!
    var image: UIImage?
    var productid: UInt?
    override func viewDidLoad() {
        super.viewDidLoad()
        let parentview = recipedetailsview()
        view.addSubview(parentview)
        parentview.frame =  CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height/2)
        parentview.imageview.image = image
        parentview.backbutton.addTarget(self, action: #selector(dissmissview), for: .touchUpInside)
        view.backgroundColor = UIColor(named: "Ceramic white")
       fpc = FloatingPanelController()
        let contentVC = recipeViewController(productid!)
        fpc.set(contentViewController: contentVC)
        fpc.delegate = self
        fpc.addPanel(toParent: self)
    }
    
    @objc func dissmissview(){
        dismiss(animated: true, completion: nil)
    }

}
