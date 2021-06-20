//
//  addingView.swift
//  Hydrate
//
//  Created by user on 06/05/2020.
//  Copyright © 2021 swift tech. All rights reserved.
//

import UIKit
import FSCalendar

class addingPlanView: UIView {
    let fonts = (UIApplication.shared.delegate as! AppDelegate).myAppfontAttributes16
    let buttoncolor = (UIApplication.shared.delegate as! AppDelegate).buttonColors
    lazy var calendar: FSCalendar = {
        let calendar = FSCalendar()
        calendar.translatesAutoresizingMaskIntoConstraints = false
        return calendar
    }()
    lazy var breakfastAddButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "plus.circle"), for: .normal)
        return button
    }()
    lazy var lunchAddButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "plus.circle"), for: .normal)
        return button
    }()
    lazy var dinnerAddButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "plus.circle"), for: .normal)
        return button
    }()
    lazy var othersAddButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "plus.circle"), for: .normal)
        return button
    }()
    lazy var breakFastDisplayButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "chevron.compact.down"), for: .normal)
        return button
    }()
   lazy var lunchDisplayButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 13.0, *) {
            button.setImage(UIImage(systemName: "chevron.compact.down"), for: .normal)
        } else {
            button.setImage(UIImage(named: "plus"), for: .normal)
        }
        return button
    }()
    lazy var dinnerDisplayButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 13.0, *) {
            button.setImage(UIImage(systemName: "chevron.compact.down"), for: .normal)
        } else {
            button.setImage(UIImage(named: "plus"), for: .normal)
        }
        return button
    }()
    lazy var othersDisplayButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 13.0, *) {
            button.setImage(UIImage(systemName: "chevron.compact.down"), for: .normal)
        } else {
            button.setImage(UIImage(named: "plus"), for: .normal)
        }
        return button
    }()
    lazy var parentStack: UIStackView = {
        let stackview = UIStackView()
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.backgroundColor = UIColor(named: "Ceramic white")
        return stackview
    }()
    lazy var scrollView: UIScrollView = {
        let scrollview = UIScrollView()
        scrollview.translatesAutoresizingMaskIntoConstraints = false
        return scrollview
    }()
    lazy var breakFastTableView: UITableView = {
        let tableview = UITableView()
        tableview.backgroundColor = UIColor(named: "Ceramic white")
        tableview.translatesAutoresizingMaskIntoConstraints = false
        return tableview
    }()
    lazy var lunchTableView: UITableView = {
        let tableview = UITableView()
        tableview.backgroundColor = UIColor(named: "Ceramic white")
        tableview.translatesAutoresizingMaskIntoConstraints = false
        return tableview
    }()
    lazy var dinnerTableView: UITableView = {
        let tableview = UITableView()
        tableview.backgroundColor = UIColor(named: "Ceramic white")
        tableview.translatesAutoresizingMaskIntoConstraints = false
        return tableview
    }()
    lazy var othersTableView: UITableView = {
        let tableview = UITableView()
        tableview.backgroundColor = UIColor(named: "Ceramic white")
        tableview.translatesAutoresizingMaskIntoConstraints = false
        return tableview
    }()
    lazy var saveButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Save plan", for: .normal)
        button.backgroundColor = buttoncolor
        button.layer.cornerRadius = 5
        return button
    }()
    func setConstraints(){
        //MARK: - > initialization section
        let breakFastView = UIView()
        let lunchView = UIView()
        let dinnerView = UIView()
        let othersView = UIView()
        let breakFastLabel = UILabel()
        let lunchLabel = UILabel()
        let dinnerLabel = UILabel()
        let othersLabel = UILabel()
        let othersLabelStack = UIStackView()
        let breakFastLabelStack = UIStackView()
        let lunchLabelStack = UIStackView()
        let dinnerLabelStack = UIStackView()
        
        //MARK: - > setting property section
    
        lunchView.translatesAutoresizingMaskIntoConstraints = false
        breakFastView.translatesAutoresizingMaskIntoConstraints = false
       dinnerView.translatesAutoresizingMaskIntoConstraints = false
        othersView.translatesAutoresizingMaskIntoConstraints = false
        breakFastLabel.translatesAutoresizingMaskIntoConstraints = false
        lunchLabel.translatesAutoresizingMaskIntoConstraints = false
        dinnerLabel.translatesAutoresizingMaskIntoConstraints = false
        othersLabel.translatesAutoresizingMaskIntoConstraints = false
        othersLabelStack.translatesAutoresizingMaskIntoConstraints = false
        breakFastLabelStack.translatesAutoresizingMaskIntoConstraints = false
        lunchLabelStack.translatesAutoresizingMaskIntoConstraints = false
        dinnerLabelStack.translatesAutoresizingMaskIntoConstraints = false
        
        //MARK: - > adding subviews section
        
        breakFastLabelStack.addSubview(breakFastLabel)
        breakFastLabelStack.addSubview(breakFastDisplayButton)
        breakFastLabel.addSubview(breakfastAddButton)
        lunchLabelStack.addSubview(lunchLabel)
        lunchLabelStack.addSubview(lunchDisplayButton)
        lunchLabelStack.addSubview(lunchAddButton)
        dinnerLabelStack.addSubview(dinnerLabel)
        dinnerLabelStack.addSubview(dinnerDisplayButton)
        dinnerLabelStack.addSubview(dinnerAddButton)
        othersLabelStack.addSubview(othersLabel)
        othersLabelStack.addSubview(othersDisplayButton)
        othersLabelStack.addSubview(othersAddButton)
        parentStack.addSubview(calendar)
        parentStack.addSubview(breakFastLabelStack)
        parentStack.addSubview(breakFastTableView)
        parentStack.addSubview(breakFastView)
        parentStack.addSubview(lunchLabelStack)
        parentStack.addSubview(lunchTableView)
        parentStack.addSubview(lunchView)
        parentStack.addSubview(dinnerLabelStack)
        parentStack.addSubview(dinnerTableView)
        parentStack.addSubview(dinnerView)
        parentStack.addSubview(othersLabelStack)
        parentStack.addSubview(othersTableView)
        parentStack.addSubview(othersView)
        parentStack.addSubview(saveButton)
        //mainView.addSubview(parentStack)
        scrollView.addSubview(parentStack)
        
        //MARK: - > parentStack Constraints
        
        NSLayoutConstraint(item: parentStack, attribute: .height, relatedBy: .equal, toItem: scrollView, attribute: .height, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: parentStack, attribute: .width, relatedBy: .equal, toItem: scrollView, attribute: .width, multiplier: 1, constant: 0).isActive = true
        parentStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-(5)-[v1(200)]-(5)-[v2(50)]-(2)-[v3(2)]-(2)-[v10(80)]-(10)-[v4(50)]-(2)-[v5(2)]-(2)-[v11(80)]-(10)-[v6(50)]-(2)-[v7(2)]-(2)-[v12(80)]-(10)-[v8(50)]-(10)-[v9(2)]-(2)-[v13(80)]-(5)-[v14(50)]-(10)-|", options: [], metrics: nil, views: ["v1":calendar,"v2":breakFastLabelStack,"v3":breakFastView,"v4":lunchLabelStack,"v5":lunchView,"v6":dinnerLabelStack,"v7":dinnerView,"v8":othersLabelStack,"v9":othersView,"v10":breakFastTableView,"v11":lunchTableView,"v12":dinnerTableView,"v13":othersTableView,"v14":saveButton]))
        parentStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(10)-[v0]-(10)-|", options: [], metrics: nil, views: ["v0":calendar]))
        parentStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(10)-[v0]-(10)-|", options: [], metrics: nil, views: ["v0":breakFastLabelStack]))
        parentStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(10)-[v0]-(10)-|", options: [], metrics: nil, views: ["v0":breakFastView]))
        parentStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(10)-[v0]-(10)-|", options: [], metrics: nil, views: ["v0":lunchLabelStack]))
        parentStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(10)-[v0]-(10)-|", options: [], metrics: nil, views: ["v0":lunchView]))
        parentStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(10)-[v0]-(10)-|", options: [], metrics: nil, views: ["v0":dinnerLabelStack]))
        parentStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(10)-[v0]-(10)-|", options: [], metrics: nil, views: ["v0":dinnerView]))
        parentStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(10)-[v0]-(10)-|", options: [], metrics: nil, views: ["v0":othersLabelStack]))
        parentStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(10)-[v0]-(10)-|", options: [], metrics: nil, views: ["v0":othersView]))
        parentStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(10)-[v0]-(10)-|", options: [], metrics: nil, views: ["v0":breakFastTableView]))
        parentStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(10)-[v0]-(10)-|", options: [], metrics: nil, views: ["v0":lunchTableView]))
        parentStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(10)-[v0]-(10)-|", options: [], metrics: nil, views: ["v0":dinnerTableView]))
        parentStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(10)-[v0]-(10)-|", options: [], metrics: nil, views: ["v0":othersTableView]))
        parentStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[v0(200)]", options: [], metrics: nil, views: ["v0":saveButton]))
        NSLayoutConstraint(item: saveButton, attribute: .centerXWithinMargins, relatedBy: .equal, toItem: parentStack, attribute: .centerXWithinMargins, multiplier: 1, constant: 0).isActive = true
        
        
        //MARK: - > breakfastLabel Constraints
        
        breakFastLabelStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(2)-[v0][v1(30)][v2(30)]-(10)-|", options: [], metrics: nil, views: ["v0":breakFastLabel,"v1":breakFastDisplayButton, "v2":breakfastAddButton]))
        breakFastLabelStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":breakFastLabel]))
        breakFastLabelStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":breakfastAddButton]))
        breakFastLabelStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":breakFastDisplayButton]))
        
        //MARK: - > lunchLabel Constraints
        lunchLabelStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(2)-[v0][v1(30)][v2(30)]-(10)-|", options: [], metrics: nil, views: ["v0":lunchLabel,"v1":lunchDisplayButton,"v2":lunchAddButton]))
        lunchLabelStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":lunchLabel]))
        lunchLabelStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":lunchAddButton]))
        lunchLabelStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":lunchDisplayButton]))
        
        //MARK: - > dinnerLabel Constraints
        dinnerLabelStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(2)-[v0][v1(30)][v2(30)]-(10)-|", options: [], metrics: nil, views: ["v0":dinnerLabel,"v1":dinnerDisplayButton,"v2":dinnerAddButton]))
        dinnerLabelStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":dinnerLabel]))
        dinnerLabelStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":dinnerAddButton]))
        dinnerLabelStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":dinnerDisplayButton]))
        
        
        //MARK: - > othersLabel Constraints
        
        othersLabelStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(2)-[v0][v1(30)][v2(30)]-(10)-|", options: [], metrics: nil, views: ["v0":othersLabel,"v1":othersDisplayButton,"v2":othersAddButton]))
        othersLabelStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":othersLabel]))
        othersLabelStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":othersAddButton]))
        othersLabelStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":othersDisplayButton]))
        
        
        //MARK: - > other attributes
        breakFastView.backgroundColor = .lightGray
        lunchView.backgroundColor = .lightGray
        dinnerView.backgroundColor = .lightGray
        othersView.backgroundColor = .lightGray
        parentStack.backgroundColor = UIColor(named: "Ceramic white")
        breakFastLabel.attributedText = NSAttributedString(string: "Breakfast", attributes: fonts)
        lunchLabel.attributedText = NSAttributedString(string: "Lunch", attributes: fonts)
        dinnerLabel.attributedText = NSAttributedString(string: "Dinner", attributes: fonts)
        othersLabel.attributedText = NSAttributedString(string: "Others", attributes: fonts)
    }
}
