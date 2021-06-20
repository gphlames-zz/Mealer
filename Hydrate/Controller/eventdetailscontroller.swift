////
////  eventdetailscontroller.swift
////  Hydrate
////
////  Created by user on 06/05/2020.
////  Copyright © 2021 swift tech. All rights reserved.
////
//
//import UIKit
//
//class eventdetailscontroller: UIViewController {
//    var event: String = ""
//    var time: String = ""
//    let eventStack = UIStackView()
//    let eventLabel = UILabel()
//    let eventdetailsLabel = UILabel()
//    let timeStack = UIStackView()
//    let timeLabel = UILabel()
//    let timedetailslabel = UILabel()
//    override func viewDidLoad() {
//        super.viewDidLoad()
////        let inview = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height))
////        if traitCollection.userInterfaceStyle == .dark{
////            inview.backgroundColor = .black
////            eventLabel.textColor = .white
////            eventdetailsLabel.textColor = .white
////            eventdetailsLabel.textAlignment = .left
////            timeLabel.textColor = .white
////            timedetailslabel.textColor = .white
////            if #available(iOS 13.0, *) {
////                eventdetailsLabel.layer.borderColor = CGColor(red: 1, green: 1, blue: 1, alpha: 1.0)
////            } else {
////                // Fallback on earlier versions
////            }
////        }else{
////            inview.backgroundColor = UIColor(named: "chlorineblue")
////            eventLabel.textColor = .white
////            eventdetailsLabel.textColor = .white
////            eventdetailsLabel.textAlignment = .left
////            timeLabel.textColor = .white
////            timedetailslabel.textColor = .white
////            if #available(iOS 13.0, *) {
////                eventdetailsLabel.layer.borderColor = CGColor(red: 1, green: 1, blue: 1, alpha: 1.0)
////            } else {
////                // Fallback on earlier versions
////            }
////        }
////        eventStack.translatesAutoresizingMaskIntoConstraints = false
////        eventLabel.translatesAutoresizingMaskIntoConstraints = false
////        eventdetailsLabel.translatesAutoresizingMaskIntoConstraints = false
////        timeStack.translatesAutoresizingMaskIntoConstraints = false
////        timeLabel.translatesAutoresizingMaskIntoConstraints = false
////        timedetailslabel.translatesAutoresizingMaskIntoConstraints = false
////        eventdetailsLabel.layer.borderWidth = 2
////
////        eventStack.axis = .horizontal
////        eventStack.addSubview(eventLabel)
////        eventStack.addSubview(eventdetailsLabel)
////        timeStack.axis = .horizontal
////        timeStack.addSubview(timeLabel)
////        timeStack.addSubview(timedetailslabel)
////        inview.addSubview(eventStack)
////        inview.addSubview(timeStack)
////        view.addSubview(inview)
////       // MARK:-> add constrainsts
////        inview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-(5)-[v0(200)]-(5)-[v1(30)]", options: [], metrics: nil, views: ["v0":eventStack,"v1":timeStack]))
////        inview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(5)-[v0]-(5)-|", options: [], metrics: nil, views: ["v0":eventStack]))
////        inview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(5)-[v0]-(5)-|", options: [], metrics: nil, views: ["v0":timeStack]))
////        eventStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0(70)]-(10)-[v1]|", options: [], metrics: nil, views: ["v0":eventLabel,"v1":eventdetailsLabel]))
////        eventStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0(30)]|", options: [], metrics: nil, views: ["v0":eventLabel]))
////        eventStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":eventdetailsLabel]))
////        timeStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0(70)]-(10)-[v1]|", options: [], metrics: nil, views: ["v0":timeLabel,"v1":timedetailslabel]))
////       timeStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":timeLabel]))
////       timeStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":timedetailslabel]))
////        eventLabel.text = "Event:"
////        timeLabel.text = "Time:"
////        eventdetailsLabel.text = event
////        eventdetailsLabel.numberOfLines = 0
////        timedetailslabel.text = time
//    }
//}
