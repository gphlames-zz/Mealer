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
    let fonts = fontData.arial16
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
        button.backgroundColor = UIColor(named: "firstshade")
        button.layer.cornerRadius = 5
        return button
    }()
    lazy var collectionview: UICollectionView = {
        let flowlayout = UICollectionViewFlowLayout()
        flowlayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
        flowlayout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: flowlayout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.isScrollEnabled = true
        collection.backgroundColor = .clear
        collection.showsHorizontalScrollIndicator = false
        return collection
    }()
    lazy var emptylabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "No mealant has been created yet", attributes: [.font:UIFont(name: "Arial Italic", size: 16)])
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    override func layoutSubviews() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .white
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
        translatemasks(views: [lunchView,breakFastView,dinnerView,othersView,breakFastLabel,lunchLabel,dinnerLabel,othersLabel,othersLabelStack,breakFastLabelStack,lunchLabelStack,dinnerLabelStack])
        
        //MARK: - > adding subviews section
        addsubviews(addingview: breakFastLabelStack, array: [breakFastLabel,breakFastDisplayButton,breakfastAddButton])
        addsubviews(addingview: lunchLabelStack, array: [lunchLabel,lunchDisplayButton,lunchAddButton])
        addsubviews(addingview: dinnerLabelStack, array: [dinnerLabel,dinnerDisplayButton,dinnerAddButton])
        addsubviews(addingview: othersLabelStack, array: [othersLabel,othersDisplayButton,othersAddButton])
        addsubviews(addingview: parentStack, array: [calendar,collectionview, breakFastLabelStack,breakFastTableView,breakFastView,lunchLabelStack,lunchTableView,lunchView,dinnerLabelStack,dinnerTableView,dinnerView,othersLabelStack,othersTableView,othersView,saveButton,emptylabel])
       addsubviews(addingview: scrollView, array: [parentStack])
        addSubview(scrollView)
        
        //MARK: - > parentStack Constraints
        NSLayoutConstraint(item: scrollView, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: scrollView, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1, constant: 0).isActive = true
        //MARK: - > parentStack Constraints
        
        NSLayoutConstraint(item: parentStack, attribute: .height, relatedBy: .equal, toItem: scrollView, attribute: .height, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: parentStack, attribute: .width, relatedBy: .equal, toItem: scrollView, attribute: .width, multiplier: 1, constant: 0).isActive = true
        parentStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-(5)-[v1(200)]-(5)-[v15(100)]-(5)-[v2(50)]-(2)-[v3(2)]-(2)-[v10(80)]-(10)-[v4(50)]-(2)-[v5(2)]-(2)-[v11(80)]-(10)-[v6(50)]-(2)-[v7(2)]-(2)-[v12(80)]-(10)-[v8(50)]-(10)-[v9(2)]-(2)-[v13(80)]-(5)-[v14(50)]-(10)-|", options: [], metrics: nil, views: ["v1":calendar,"v2":breakFastLabelStack,"v3":breakFastView,"v4":lunchLabelStack,"v5":lunchView,"v6":dinnerLabelStack,"v7":dinnerView,"v8":othersLabelStack,"v9":othersView,"v10":breakFastTableView,"v11":lunchTableView,"v12":dinnerTableView,"v13":othersTableView,"v14":saveButton,"v15":collectionview]))
        parentStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(10)-[v0]-(10)-|", options: [], metrics: nil, views: ["v0":calendar]))
        parentStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(10)-[v0]-(10)-|", options: [], metrics: nil, views: ["v0":collectionview]))
        parentStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(10)-[v0]-(10)-|", options: [], metrics: nil, views: ["v0":emptylabel]))
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
        NSLayoutConstraint(item: emptylabel, attribute: .top, relatedBy: .equal, toItem: calendar, attribute: .bottom, multiplier: 1, constant: 5).isActive = true
        NSLayoutConstraint(item: emptylabel, attribute: .bottom, relatedBy: .equal, toItem: breakFastLabelStack, attribute: .top, multiplier: 1, constant: 5).isActive = true
        NSLayoutConstraint(item: emptylabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 100).isActive = true
        
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
    func translatemasks(views: [UIView]){
        for view in views{
            view.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    func addsubviews(addingview: UIView, array:[UIView]){
        for i in array{
            addingview.addSubview(i)
        }
    }
}
