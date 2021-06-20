//
//  howtouseViewController.swift
//  Hydrate
//
//  Created by user on 06/05/2020.
//  Copyright © 2020 swift tech. All rights reserved.
//

import UIKit

class howtouseViewController: UIViewController {

     var howtouselabel: UILabel = UILabel()
     //var scrollview: UIScrollView = UIScrollView()
    override func viewDidLoad() {
        super.viewDidLoad()
//        if #available(iOS 13.0, *) {
//            backbutton.image = UIImage(systemName: "chevron.backward")
//            backbutton.target = self
//            backbutton.action = #selector(closescreen)
//        } else {
//            backbutton.title = "Back"
//            backbutton.target = self
//            backbutton.action = #selector(closescreen)
//        }
        if traitCollection.userInterfaceStyle == .dark{
            navigationController?.navigationBar.tintColor = .white
            view.backgroundColor = .black
            //navigationItem.leftBarButtonItem?.tintColor = .white
        }else{
            navigationController?.navigationBar.tintColor = .white
            view.backgroundColor = .white
           // navigationItem.leftBarButtonItem?.tintColor = .white
        }
        let subheaderAttributes: [NSAttributedString.Key: Any]=[
            .foregroundColor: traitCollection.userInterfaceStyle == .dark ? UIColor.white:UIColor.black,
            .underlineStyle: NSUnderlineStyle.thick,
            .font: UIFont.boldSystemFont(ofSize: 24)
        ]
        let bodyAttributes: [NSAttributedString.Key: Any]=[
            .foregroundColor: UIColor.gray,
            .font: UIFont.systemFont(ofSize: CGFloat(20))
        ]
        let createplanheader = "Create Plans\n"
        let createplan = "a) From home screen,click the add plan button\nb) Click customize plan at the top right\nc) Tap the plus icon at the right of each day to input events/foods and select time to be notified weekly\nd) Click minus icon at each cell to remove event/foods\ne) Click Save\nf) Drag left newly created plan to make primary plan\n\n"
        let createplanattributedheader = NSAttributedString(string: createplanheader, attributes: subheaderAttributes)
        let createplanattributedbody = NSAttributedString(string: createplan, attributes: bodyAttributes)
        let editplanheader = "Edit Plans\n"
        let editplan = "a) From home screen,click the add plan/change plan button\nb) Click plan you wish to edit\nc) Click the edit button on the top right corner of the screen\nd) Tap the plus icon at the right of each day to add events/foods and select time to be notified weekly or the minus icon in each cell to remove event\ne) When done click Save\n\n"
        let editplanattributedheader = NSAttributedString(string: editplanheader, attributes: subheaderAttributes)
        let editplanattributedbody = NSAttributedString(string: editplan, attributes: bodyAttributes)
        let result = NSMutableAttributedString()
        result.append(createplanattributedheader)
        result.append(createplanattributedbody)
        result.append(editplanattributedheader)
        result.append(editplanattributedbody)
        howtouselabel.attributedText = result
        let  titleAttributes: [NSAttributedString.Key: Any]=[
            .foregroundColor: traitCollection.userInterfaceStyle == .dark ? UIColor.white:UIColor.white,
            .font: UIFont.boldSystemFont(ofSize: 24)
        ]
        navigationController?.navigationBar.titleTextAttributes = titleAttributes
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.barTintColor = traitCollection.userInterfaceStyle == .dark ? UIColor.white : UIColor.white
    }
    @objc func closescreen(){
        dismiss(animated: true, completion: nil)
    }

}
