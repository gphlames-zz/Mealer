//
//  addingTableViewCell.swift
//  Hydrate
//
//  Created by user on 06/05/2020.
//  Copyright © 2021 swift tech. All rights reserved.
//

import UIKit

class addingPlanView2: UIView {

    lazy var datepicker: UIDatePicker = { 
        let datepicka = UIDatePicker()
        datepicka.translatesAutoresizingMaskIntoConstraints = false
        datepicka.datePickerMode = .time
        return datepicka
    }()
    lazy var imageView: UIImageView = {
        let imageview = UIImageView()
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.isUserInteractionEnabled = true
        imageview.contentMode = .scaleAspectFit
        return imageview
    }()
    lazy var ingredientsAddButton: UIButton =  {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = UIColor(named: "firstshade")
        return button
    }()
    lazy var cookwareAddButton: UIButton =  {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.setTitleColor(UIColor(named: "firstshade"), for: .normal)
        return button
    }()
    lazy var stepsAddButton: UIButton =  {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = UIColor(named: "firstshade")
        return button
    }()
    lazy var ingredientsTableView: UITableView = {
        let tableview = UITableView()
        tableview.translatesAutoresizingMaskIntoConstraints = false
        return tableview
    }()
    lazy var cookwareTableView: UITableView = {
        let tableview = UITableView()
        tableview.translatesAutoresizingMaskIntoConstraints = false
        return tableview
    }()
    lazy var stepsTableView: UITableView = {
        let tableview = UITableView()
        tableview.translatesAutoresizingMaskIntoConstraints = false
        return tableview
    }()
   lazy var caloriesTextField: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.placeholder = "Enter caloric value here"
        textfield.backgroundColor = .white
        textfield.isUserInteractionEnabled = true
        return textfield
    }()
    lazy var mainview: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "Ceramic white")
        return view
    }()
    lazy var scrollView: UIScrollView = {
        let scrollview = UIScrollView()
        scrollview.translatesAutoresizingMaskIntoConstraints = false
        return scrollview
    }()
    override func layoutSubviews() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor(named: "Ceramic white")
        // MARK: -> initilization section
            
            let ingredientsIDLabel = UILabel()
            let cookwareIDLabel = UILabel()
            let stepsIDLabel = UILabel()
            let ingredientsUnderView = UIView()
            let cookwareUnderView = UIView()
            let stepsUnderView = UIView()
            let ingredientsStack = UIStackView()
            let cookwareStack = UIStackView()
            let stepsStack = UIStackView()
            
            
        translatemasks(views: [ingredientsIDLabel,cookwareIDLabel,stepsIDLabel,ingredientsUnderView,cookwareUnderView,stepsUnderView,ingredientsStack,cookwareStack,stepsStack])
            // MARK: -> adding subviews section
            addsubviews(addingview: ingredientsStack, array: [ingredientsIDLabel,ingredientsAddButton])
            addsubviews(addingview: cookwareStack, array: [cookwareIDLabel,cookwareAddButton])
            addsubviews(addingview: stepsStack, array: [stepsIDLabel,stepsAddButton])
            addsubviews(addingview: mainview, array: [imageView,ingredientsStack,ingredientsUnderView,ingredientsTableView,cookwareStack,cookwareUnderView,cookwareTableView,stepsStack,stepsUnderView,stepsTableView,caloriesTextField])
            addsubviews(addingview: scrollView, array: [mainview])
            addSubview(scrollView)
            // MARK: - view constraints
        NSLayoutConstraint(item: scrollView, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: scrollView, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1, constant: 0).isActive = true
        // MARK: - scrollviewview constraints
        NSLayoutConstraint(item: mainview, attribute: .height, relatedBy: .equal, toItem: scrollView, attribute: .height, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: mainview, attribute: .width, relatedBy: .equal, toItem: scrollView, attribute: .width, multiplier: 1, constant: 0).isActive = true
            // MARK: - mainview constraints
        mainview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-(10)-[v1(250)]-(10)-[v2(50)]-(2)-[v3(2)]-(5)-[v4(50)]-(10)-[v5(50)]-(2)-[v6(2)]-(5)-[v7(50)]-(10)-[v8(50)]-(2)-[v9(2)]-(5)-[v10(50)]-(10)-[v11(40)]-(20)-|", options: [], metrics: nil, views: ["v1":imageView,"v2":ingredientsStack,"v3":ingredientsUnderView,"v4":ingredientsTableView,"v5":cookwareStack,"v6":cookwareUnderView,"v7":cookwareTableView,"v8":stepsStack,"v9":stepsUnderView,"v10":stepsTableView,"v11":caloriesTextField]))
            mainview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: [], metrics: nil, views: ["v0":imageView]))
            mainview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(5)-[v0]-(5)-|", options: [], metrics: nil, views: ["v0":ingredientsStack]))
            mainview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(5)-[v0]-(5)-|", options: [], metrics: nil, views: ["v0":ingredientsUnderView]))
            mainview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(5)-[v0]-(5)-|", options: [], metrics: nil, views: ["v0":ingredientsTableView]))
            mainview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(5)-[v0]-(5)-|", options: [], metrics: nil, views: ["v0":cookwareStack]))
            mainview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(5)-[v0]-(5)-|", options: [], metrics: nil, views: ["v0":cookwareUnderView]))
            mainview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(5)-[v0]-(5)-|", options: [], metrics: nil, views: ["v0":cookwareTableView]))
            mainview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(5)-[v0]-(5)-|", options: [], metrics: nil, views: ["v0":stepsStack]))
            mainview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(5)-[v0]-(5)-|", options: [], metrics: nil, views: ["v0":stepsUnderView]))
            mainview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(5)-[v0]-(5)-|", options: [], metrics: nil, views: ["v0":stepsTableView]))
            mainview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(5)-[v0(200)]", options: [], metrics: nil, views: ["v0":caloriesTextField]))
       
            // MARK: - ingredientsStack constraints
            ingredientsStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(2)-[v0][v1(50)]|", options: [], metrics: nil, views: ["v0":ingredientsIDLabel,"v1":ingredientsAddButton]))
            ingredientsStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":ingredientsIDLabel]))
            ingredientsStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":ingredientsAddButton]))
            
            // MARK: - cookwareStack constraints
            cookwareStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(2)-[v0][v1(50)]|", options: [], metrics: nil, views: ["v0":cookwareIDLabel,"v1":cookwareAddButton]))
            cookwareStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":cookwareIDLabel]))
            cookwareStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":cookwareAddButton]))
            
            // MARK: - stepsStack constraints
            
            stepsStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(2)-[v0][v1(50)]|", options: [], metrics: nil, views: ["v0":stepsIDLabel,"v1":stepsAddButton]))
            stepsStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":stepsIDLabel]))
            stepsStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":stepsAddButton]))
        
            // MARK: - other section
        ingredientsIDLabel.attributedText = NSAttributedString(string: "Ingredients", attributes: [.font:UIFont(name: "Arial Bold", size: 18)])
        cookwareIDLabel.attributedText = NSAttributedString(string: "Cookware", attributes: [.font:UIFont(name: "Arial Bold", size: 18)])
        stepsIDLabel.attributedText = NSAttributedString(string: "Steps", attributes: [.font:UIFont(name: "Arial Bold", size: 18)])
//        nameLabel.text = ""
        ingredientsUnderView.backgroundColor = .lightGray
        cookwareUnderView.backgroundColor = .lightGray
        stepsUnderView.backgroundColor = .lightGray
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
