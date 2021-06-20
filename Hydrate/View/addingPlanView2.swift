//
//  addingTableViewCell.swift
//  Hydrate
//
//  Created by user on 06/05/2020.
//  Copyright © 2021 swift tech. All rights reserved.
//

import UIKit

class addingPlanView2: UIView {
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Arial", size: 16)
        label.isUserInteractionEnabled = true
        return label
    }()
    lazy var hourPicker: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    lazy var minutePicker: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    lazy var ampmPicker: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    lazy var nameTextField: UITextField = {
        let textfield = UITextField()
        textfield.font = UIFont(name: "Arial", size: 16)
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
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
        button.tintColor = UIColor(named: "firstshade")
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
    var stepsTableView: UITableView = {
        let tableview = UITableView()
        tableview.translatesAutoresizingMaskIntoConstraints = false
        return tableview
    }()
    var caloriesTextField: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()
    var doneButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setAttributedTitle(NSAttributedString(string: "Done", attributes: (UIApplication.shared.delegate as! AppDelegate).myAppfontAttributes16), for: .normal)
        return button
    }()
    var mainview: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    var scrollView: UIScrollView = {
        let scrollview = UIScrollView()
        scrollview.translatesAutoresizingMaskIntoConstraints = false
        return scrollview
    }()
    func setConstraints(){
        
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
        let pickerStack = UIStackView()
        let pickerLabel = UILabel()
        
        // MARK: -> adding subviews section
        ingredientsStack.addSubview(ingredientsIDLabel)
        ingredientsStack.addSubview(ingredientsAddButton)
        cookwareStack.addSubview(cookwareIDLabel)
        cookwareStack.addSubview(cookwareAddButton)
        stepsStack.addSubview(stepsIDLabel)
        stepsStack.addSubview(stepsAddButton)
        pickerStack.addSubview(nameLabel)
        pickerStack.addSubview(nameTextField)
        pickerStack.addSubview(pickerLabel)
        pickerStack.addSubview(minutePicker)
        pickerStack.addSubview(hourPicker)
        mainview.addSubview(pickerStack)
        mainview.addSubview(ingredientsStack)
        mainview.addSubview(ingredientsUnderView)
        mainview.addSubview(ingredientsTableView)
        mainview.addSubview(cookwareStack)
        mainview.addSubview(cookwareUnderView)
        mainview.addSubview(cookwareTableView)
        mainview.addSubview(stepsStack)
        mainview.addSubview(stepsUnderView)
        mainview.addSubview(stepsTableView)
        mainview.addSubview(caloriesTextField)
        mainview.addSubview(doneButton)
        scrollView.addSubview(mainview)
        
        // MARK: - other sections
        
        ingredientsIDLabel.translatesAutoresizingMaskIntoConstraints = false
        cookwareIDLabel.translatesAutoresizingMaskIntoConstraints = false
        stepsIDLabel.translatesAutoresizingMaskIntoConstraints = false
        ingredientsUnderView.translatesAutoresizingMaskIntoConstraints = false
        cookwareUnderView.translatesAutoresizingMaskIntoConstraints = false
        stepsUnderView.translatesAutoresizingMaskIntoConstraints = false
        ingredientsStack.translatesAutoresizingMaskIntoConstraints = false
        cookwareStack.translatesAutoresizingMaskIntoConstraints = false
        stepsStack.translatesAutoresizingMaskIntoConstraints = false
        pickerLabel.translatesAutoresizingMaskIntoConstraints = false
        pickerStack.translatesAutoresizingMaskIntoConstraints = false
    
        // MARK: - scrollview constraints
        scrollView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: [], metrics: nil, views: ["v0":mainview]))
        scrollView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]", options: [], metrics: nil, views: ["v0":mainview]))
        // MARK: - mainview constraints
        mainview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-(5)-[v0(40)]-(10)-[v1(250)]-(10)-[v2(50)]-(2)-[v3(2)]-(5)-[v4(50)]-(10)-[v5(50)]-(2)-[v6(2)]-(5)-[v7(50)]-(10)-[v8(50)]-(2)-[v9(2)]-(5)-[v10(50)]-(10)-[v11(40)]-(20)-[v12(70)]", options: [], metrics: nil, views: ["v0":pickerStack,"v1":imageView,"v2":ingredientsStack,"v3":ingredientsUnderView,"v4":ingredientsTableView,"v5":cookwareStack,"v6":cookwareUnderView,"v7":cookwareTableView,"V8":stepsStack,"v9":stepsUnderView,"v10":stepsTableView,"v11":caloriesTextField,"v12":doneButton]))
        mainview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(10)-[v0]-(10)-|", options: [], metrics: nil, views: ["v0":pickerStack]))
        mainview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: [], metrics: nil, views: ["v0":imageView]))
        mainview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(10)-[v0]-(10)-|", options: [], metrics: nil, views: ["v0":ingredientsStack]))
        mainview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(10)-[v0]-(10)-|", options: [], metrics: nil, views: ["v0":ingredientsUnderView]))
        mainview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(10)-[v0]-(10)-|", options: [], metrics: nil, views: ["v0":ingredientsTableView]))
        mainview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(10)-[v0]-(10)-|", options: [], metrics: nil, views: ["v0":cookwareStack]))
        mainview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(10)-[v0]-(10)-|", options: [], metrics: nil, views: ["v0":cookwareUnderView]))
        mainview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(10)-[v0]-(10)-|", options: [], metrics: nil, views: ["v0":cookwareTableView]))
        mainview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(10)-[v0]-(10)-|", options: [], metrics: nil, views: ["v0":stepsStack]))
        mainview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(10)-[v0]-(10)-|", options: [], metrics: nil, views: ["v0":stepsUnderView]))
        mainview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(10)-[v0]-(10)-|", options: [], metrics: nil, views: ["v0":stepsTableView]))
        mainview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(10)-[v0(100)]", options: [], metrics: nil, views: ["v0":caloriesTextField]))
        mainview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[v0(200)]", options: [], metrics: nil, views: ["v0":doneButton]))
        NSLayoutConstraint(item: doneButton, attribute: .centerXWithinMargins, relatedBy: .equal, toItem: mainview, attribute: .centerXWithinMargins, multiplier: 1, constant: 0).isActive = true
        
        // MARK: - ingredientsStack constraints
        
        pickerStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(2)-[v0][v1(50)][v2(30)][v3(30)][v4(30)]-(2)-|", options: [], metrics: nil, views: ["v0": nameTextField,"v1":pickerLabel,"v2":hourPicker,"v3":minutePicker,"v4":ampmPicker]))
        pickerStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":nameTextField]))
        pickerStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":nameLabel]))
        pickerStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":pickerLabel]))
        pickerStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":hourPicker]))
        pickerStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":minutePicker]))
        pickerStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":ampmPicker]))
        NSLayoutConstraint(item: nameLabel, attribute: .leading, relatedBy: .equal, toItem: pickerStack, attribute: .leading, multiplier: 1, constant: 2).isActive = true
        NSLayoutConstraint(item: nameLabel, attribute: .trailing, relatedBy: .equal, toItem: pickerLabel, attribute: .leading, multiplier: 1, constant: 0).isActive = true
        // MARK: - ingredientsStack constraints
        ingredientsStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(2)-[v0][v1(50)]|", options: [], metrics: nil, views: ["v0":ingredientsIDLabel,"v1":ingredientsAddButton]))
        ingredientsStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: [], metrics: nil, views: ["v0":ingredientsIDLabel]))
        ingredientsStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: [], metrics: nil, views: ["v0":ingredientsAddButton]))
        
        // MARK: - cookwareStack constraints
        cookwareStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(2)-[v0][v1(50)]|", options: [], metrics: nil, views: ["v0":cookwareIDLabel,"v1":cookwareAddButton]))
        cookwareStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: [], metrics: nil, views: ["v0":cookwareIDLabel]))
        cookwareStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: [], metrics: nil, views: ["v0":cookwareAddButton]))
        
        // MARK: - stepsStack constraints
        
        stepsStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(2)-[v0][v1(50)]|", options: [], metrics: nil, views: ["v0":stepsIDLabel,"v1":stepsAddButton]))
        stepsStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: [], metrics: nil, views: ["v0":stepsIDLabel]))
        stepsStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: [], metrics: nil, views: ["v0":stepsAddButton]))
        
        // MARK: - super imposition of nameTextField
        NSLayoutConstraint(item: nameTextField, attribute: .top, relatedBy: .equal, toItem: mainview, attribute: .top, multiplier: 1, constant: 5).isActive = true
    }
}
