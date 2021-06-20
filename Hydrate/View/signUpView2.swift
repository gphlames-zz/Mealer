//
//  signUpViewController2.swift
//  Hydrate
//
//  Created by user on 06/05/2020.
//  Copyright © 2021 swift tech. All rights reserved.
//

import UIKit
import CountryPickerView

class signUpView2: UIView{
    
   lazy var presentpoundLabel: UILabel = {
        let label = UILabel()
        let attributes: [NSAttributedString.Key: Any] = [.font:UIFont.boldSystemFont(ofSize: 14)]
        label.attributedText = NSAttributedString(string: "lb", attributes: [.font: UIFont(name: "Arial", size: 14)])
        label.isUserInteractionEnabled = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.layer.cornerRadius = 5
        label.isUserInteractionEnabled = true
        return label
    }()
    lazy var futurepoundLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "lb", attributes: [.font: UIFont(name: "Arial", size: 14)])
        label.isUserInteractionEnabled = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.layer.cornerRadius = 5
        label.isUserInteractionEnabled = true
        return label
    }()
    lazy var maleLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "M", attributes: [.font: UIFont(name: "Arial", size: 14)])
        label.isUserInteractionEnabled = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.layer.cornerRadius = 5
        return label
    }()
    lazy var femaleLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "F", attributes: [.font: UIFont(name: "Arial", size: 14)])
        label.isUserInteractionEnabled = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.layer.cornerRadius = 5
        return label
    }()
    lazy var presentkilogramLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "kg", attributes: [.font: UIFont(name: "Arial", size: 14)])
        label.isUserInteractionEnabled = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.layer.cornerRadius = 5
        return label
    }()
    lazy var futurekilogramLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "kg", attributes: [.font: UIFont(name: "Arial", size: 14)])
        label.isUserInteractionEnabled = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.layer.cornerRadius = 5
        return label
    }()
    lazy var backButton: UIButton = {
        let button = UIButton()
        if #available(iOS 13.0, *) {
            button.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        } else {
            button.setTitle("Back", for: .normal)
        }
        button.translatesAutoresizingMaskIntoConstraints = false
        button.superview?.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(10)-[v0(50)]", options: [], metrics: nil, views: ["v0":button]))
        return button
    }()
    lazy var logo: UIStackView = {
       let imageview = UIImageView(image: UIImage(named:"logo"))
        imageview.contentMode = .scaleAspectFit
        imageview.translatesAutoresizingMaskIntoConstraints = false
        let stackview = UIStackView()
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.addSubview(imageview)
        stackview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":imageview]))
        stackview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[v0(50)]", options: [], metrics: nil, views: ["v0":imageview]))
        NSLayoutConstraint(item: imageview, attribute: .centerXWithinMargins, relatedBy: .equal, toItem: stackview, attribute: .centerXWithinMargins, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: imageview, attribute: .centerYWithinMargins, relatedBy: .equal, toItem: stackview, attribute: .centerYWithinMargins, multiplier: 1, constant: 0).isActive = true
        return stackview
    }()
    lazy var feetPicker: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    lazy var inchesPicker: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
   lazy var feetLabel: UILabel = {
        let feetlabel = UILabel()
        feetlabel.attributedText = NSAttributedString(string: "ft", attributes: [.font: UIFont(name: "Arial", size: 14)])
        feetlabel.textAlignment = .center
        feetlabel.translatesAutoresizingMaskIntoConstraints = false
        feetlabel.isUserInteractionEnabled = true
        return feetlabel
    }()
    lazy var cmLabel: UILabel = {
        let cmlabel = UILabel()
        cmlabel.attributedText = NSAttributedString(string: "cm", attributes: [.font: UIFont(name: "Arial", size: 14)])
        cmlabel.textAlignment = .center
        cmlabel.translatesAutoresizingMaskIntoConstraints = false
        cmlabel.isUserInteractionEnabled = true
        return cmlabel
    }()
    lazy var cmTextField: UITextField = {
       let textfield = UITextField()
        textfield.font = UIFont(name: "Arial", size: 16)
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.placeholder = "0.0"
        textfield.backgroundColor = .white
        return textfield
    }()
    lazy var ageTextField: UITextField = {
        let textfeild = UITextField()
        textfeild.font = UIFont(name: "Arial", size: 16)
        textfeild.placeholder = "Enter your age"
        textfeild.placeholder = "0"
        textfeild.translatesAutoresizingMaskIntoConstraints = false
        textfeild.backgroundColor = .white
        return textfeild
    }()
    lazy var dayTextfield: UITextField = {
        let textfield = UITextField()
        textfield.font = UIFont(name: "Arial", size: 16)
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.placeholder = "00"
        textfield.backgroundColor = .white
        return textfield
    }()
     lazy var monthTextfield: UITextField = {
        let textfield = UITextField()
        textfield.font = UIFont(name: "Arial", size: 16)
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.placeholder = "00"
        textfield.backgroundColor = .white
        return textfield
    }()
    lazy var feet_Label: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "ft:", attributes: [.font: UIFont(name: "Arial", size: 14)])
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var inches_Label: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "in:", attributes: [.font: UIFont(name: "Arial", size: 14)])
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
     lazy var continueButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "firstshade")
        button.setAttributedTitle(NSAttributedString(string: "Continue", attributes: [.font: UIFont(name: "Arial", size: 16)]), for: .normal)
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    lazy var countryPicker: CountryPickerView = {
        let picker = CountryPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    lazy var allergiesTextField: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.placeholder = "Enter your allergies seperated by commas"
        textfield.font = UIFont(name: "Arial", size: 16)
        return textfield
    }()
    var mainview: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "Ceramic white")
        return view
    }()
    func setConstraints(){
        // MARK: - initialization section
        
        let presentweighttextfield = UITextField()
        let futureweighttextfield = UITextField()
        let sexLabel = UILabel()
        let presentweightlabelstack = UIStackView()
        let futureweightlabelstack =  UIStackView()
        let sexlabelstack = UIStackView()
        let sexStack = UIStackView()
        let presentweightStack = UIStackView()
        let futureweightStack = UIStackView()
        let parentStack = UIStackView()
        let heightStack = UIStackView()
        let heightLabel = UILabel()
        let heightLabelStack = UIStackView()
        let ageStack = UIStackView()
        let birthdayLabel = UILabel()
        let birthdayDayLabel = UILabel()
        let birthdayMonthLabel = UILabel()
        let birthdayStack = UIStackView()
        let birthdayLabelStack = UIStackView()
        let countryLabel = UILabel()
        let countryLabelStack = UIStackView()
        let sexCountryStack = UIStackView()
        // MARK: - adding autoresizingmaskintocontraints to views
        
        parentStack.translatesAutoresizingMaskIntoConstraints = false
        presentweighttextfield.translatesAutoresizingMaskIntoConstraints = false
        futureweighttextfield.translatesAutoresizingMaskIntoConstraints = false
        presentweightlabelstack.translatesAutoresizingMaskIntoConstraints = false
        futureweightlabelstack.translatesAutoresizingMaskIntoConstraints = false
        sexlabelstack.translatesAutoresizingMaskIntoConstraints = false
        sexLabel.translatesAutoresizingMaskIntoConstraints = false
        sexStack.translatesAutoresizingMaskIntoConstraints = false
        presentweightStack.translatesAutoresizingMaskIntoConstraints = false
        futureweightStack.translatesAutoresizingMaskIntoConstraints = false
        heightStack.translatesAutoresizingMaskIntoConstraints = false
        heightLabel.translatesAutoresizingMaskIntoConstraints = false
        heightLabelStack.translatesAutoresizingMaskIntoConstraints = false
        ageStack.translatesAutoresizingMaskIntoConstraints = false
        birthdayLabel.translatesAutoresizingMaskIntoConstraints = false
        birthdayStack.translatesAutoresizingMaskIntoConstraints = false
        birthdayLabelStack.translatesAutoresizingMaskIntoConstraints = false
        birthdayDayLabel.translatesAutoresizingMaskIntoConstraints = false
        birthdayMonthLabel.translatesAutoresizingMaskIntoConstraints = false
        countryLabel.translatesAutoresizingMaskIntoConstraints = false
        countryLabelStack.translatesAutoresizingMaskIntoConstraints = false
        sexCountryStack.translatesAutoresizingMaskIntoConstraints = false
        
        // MARK: - adding subviews
        
        presentweightlabelstack.addSubview(presentpoundLabel)
        presentweightlabelstack.addSubview(presentkilogramLabel)
        futureweightlabelstack.addSubview(futurepoundLabel)
        futureweightlabelstack.addSubview(futurekilogramLabel)
        presentweightStack.addSubview(presentweighttextfield)
        presentweightStack.addSubview(presentweightlabelstack)
        futureweightStack.addSubview(futureweighttextfield)
        futureweightStack.addSubview(futureweightlabelstack)
        sexlabelstack.addSubview(maleLabel)
        sexlabelstack.addSubview(femaleLabel)
        sexStack.addSubview(sexLabel)
        sexStack.addSubview(sexlabelstack)
        sexlabelstack.addSubview(maleLabel)
        sexlabelstack.addSubview(femaleLabel)
        countryLabelStack.addSubview(countryLabel)
        countryLabelStack.addSubview(countryPicker)
        heightLabelStack.addSubview(feetPicker)
        heightLabelStack.addSubview(inchesPicker)
        heightLabelStack.addSubview(feetLabel)
        heightLabelStack.addSubview(cmLabel)
        heightLabelStack.addSubview(cmTextField)
        heightLabelStack.addSubview(feet_Label)
        heightLabelStack.addSubview(inches_Label)
        heightStack.addSubview(heightLabel)
        heightStack.addSubview(heightLabelStack)
        ageStack.addSubview(ageTextField)
        birthdayLabelStack.addSubview(birthdayMonthLabel)
        birthdayLabelStack.addSubview(monthTextfield)
        birthdayLabelStack.addSubview(birthdayDayLabel)
        birthdayLabelStack.addSubview(dayTextfield)
        birthdayStack.addSubview(birthdayLabel)
        birthdayStack.addSubview(birthdayLabelStack)
        parentStack.addSubview(backButton)
        parentStack.addSubview(logo)
        parentStack.addSubview(presentweightStack)
        parentStack.addSubview(futureweightStack)
        parentStack.addSubview(sexStack)
        parentStack.addSubview(heightStack)
        parentStack.addSubview(ageStack)
        parentStack.addSubview(birthdayStack)
        parentStack.addSubview(countryLabelStack)
        parentStack.addSubview(allergiesTextField)
        parentStack.addSubview(continueButton)
        mainview.addSubview(parentStack)
        
        // MARK: - adding constraints to parent stack
        
        NSLayoutConstraint(item: parentStack, attribute: .top, relatedBy: .equal, toItem: mainview, attribute: .top, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: parentStack, attribute: .leading, relatedBy: .equal, toItem: mainview, attribute: .leading, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: parentStack, attribute: .trailing, relatedBy: .equal, toItem: mainview, attribute: .trailing, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: parentStack, attribute: .bottom, relatedBy: .equal, toItem: mainview, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
        parentStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0(50)]-(5)-[v1(50)]-(10)-[v2(50)]-(10)-[v3(50)]-(10)-[v4(50)]-(10)-[v5(50)]-(10)-[v6(50)]-(10)-[v7(50)]-(10)-[v9(50)]-(10)-[v10(50)]-(10)-[v8(50)]", options: [], metrics: nil, views: ["v0":backButton, "v1":logo,"v2":presentweightStack,"v3":futureweightStack,"v4":sexStack,"v5":heightStack,"v6":ageStack,"v7":birthdayStack,"v9":countryLabelStack,"v8":continueButton,"v10":allergiesTextField]))
        parentStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(10)-[v0]-(10)-|", options: [], metrics: nil, views: ["v0":logo]))
        parentStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(10)-[v0]-(10)-|", options: [], metrics: nil, views: ["v0":presentweightStack]))
        parentStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(10)-[v0]-(10)-|", options: [], metrics: nil, views: ["v0":futureweightStack]))
        parentStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(10)-[v0]-(10)-|", options: [], metrics: nil, views: ["v0":sexStack]))
        parentStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(10)-[v0]-(10)-|", options: [], metrics: nil, views: ["v0":countryLabelStack]))
        parentStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(10)-[v0]-(10)-|", options: [], metrics: nil, views: ["v0":heightStack]))
        parentStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(10)-[v0]-(10)-|", options: [], metrics: nil, views: ["v0":ageStack]))
        parentStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(10)-[v0]-(10)-|", options: [], metrics: nil, views: ["v0":birthdayStack]))
        parentStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(10)-[v0]-(10)-|", options: [], metrics: nil, views: ["v0":allergiesTextField]))
        parentStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[v0(200)]", options: [], metrics: nil, views: ["v0":continueButton]))
        NSLayoutConstraint(item:continueButton , attribute: .centerXWithinMargins, relatedBy: .equal, toItem: presentweightStack, attribute: .centerXWithinMargins, multiplier: 1, constant: 0).isActive = true
        // MARK: - presentweightstack constraints
        
        presentweightStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(2)-[v0]-(5)-[v1(80)]-(5)-|", options: [], metrics: nil, views: ["v0":presentweighttextfield,"v1":presentweightlabelstack]))
        presentweightStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":presentweighttextfield]))
        presentweightStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0(25)]", options: [], metrics: nil, views: ["v0":presentweightlabelstack]))
        NSLayoutConstraint(item:presentweightlabelstack , attribute: .centerYWithinMargins, relatedBy: .equal, toItem: presentweightStack, attribute: .centerYWithinMargins, multiplier: 1, constant: 0).isActive = true
        
        // MARK: - futureweightstack constraints
        futureweightStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(2)-[v0]-(5)-[v1(80)]-(5)-|", options: [], metrics: nil, views: ["v0":futureweighttextfield,"v1":futureweightlabelstack]))
        futureweightStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":futureweighttextfield]))
        futureweightStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0(25)]", options: [], metrics: nil, views: ["v0":futureweightlabelstack]))
        NSLayoutConstraint(item:futureweightlabelstack , attribute: .centerYWithinMargins, relatedBy: .equal, toItem: futureweightStack, attribute: .centerYWithinMargins, multiplier: 1, constant: 0).isActive = true
        
        // MARK: - presentweightlabelstack constraints
        presentweightlabelstack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":presentkilogramLabel]))
        presentweightlabelstack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":presentpoundLabel]))
        presentweightlabelstack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0(40)][v1(40)]|", options: [], metrics: nil, views: ["v0":presentpoundLabel,"v1":presentkilogramLabel]))
        
        // MARK: - futureweightlabelstack constraints
        futureweightlabelstack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0(40)][v1(40)]|", options: [], metrics: nil, views: ["v0":futurepoundLabel,"v1":futurekilogramLabel]))
        futureweightlabelstack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":futurepoundLabel]))
        futureweightlabelstack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":futurekilogramLabel]))
        
                // MARK: - sexStack constraints
        
        sexStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":sexLabel]))
        sexStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0(25)]", options: [], metrics: nil, views: ["v0":sexlabelstack]))
        sexStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(2)-[v0][v1(60)]-(5)-|", options: [], metrics: nil, views: ["v0":sexLabel,"v1":sexlabelstack]))
        
        // MARK: - sexlabelstack constraints
        
        sexlabelstack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0(30)][v1(30)]|", options: [], metrics: nil, views: ["v0":maleLabel,"v1":femaleLabel]))
        sexlabelstack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":maleLabel]))
        sexlabelstack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":femaleLabel]))
        NSLayoutConstraint(item: sexlabelstack, attribute: .centerYWithinMargins, relatedBy: .equal, toItem: sexStack, attribute: .centerYWithinMargins, multiplier: 1, constant: 0).isActive = true
        
        // MARK: - countryLabelStack constraints
        
        countryLabelStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0(70)][v1]|", options: [], metrics: nil, views: ["v0":countryLabel,"v1":countryPicker]))
        countryLabelStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":countryLabel]))
        countryLabelStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0(50)]", options: [], metrics: nil, views: ["v0":countryPicker]))
        NSLayoutConstraint(item: countryPicker, attribute: .centerYWithinMargins, relatedBy: .equal, toItem: countryLabelStack, attribute: .centerYWithinMargins, multiplier: 1, constant: 0).isActive = true
        
        // MARK: - heightStack constraints
        
        heightStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(2)-[v0]-(5)-[v2(155)]-(5)-|", options: [], metrics: nil, views: ["v0":heightLabel,"v2":heightLabelStack]))
        heightStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":heightLabel]))
        heightStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0(40)]", options: [], metrics: nil, views: ["v0":heightLabelStack]))
        
        // MARK: - heightLabelStack constraints
        
        heightLabelStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v4(20)][v0(30)][v5(20)][v1(35)][v2(25)][v3(25)]|", options: [], metrics: nil, views: ["v0":feetPicker,"v1":inchesPicker,"v2":feetLabel,"v3":cmLabel,"v4":feet_Label,"v5":inches_Label]))
        heightLabelStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":feetPicker]))
        heightLabelStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0(25)]", options: [], metrics: nil, views: ["v0":feetLabel]))
        heightLabelStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":inchesPicker]))
        heightLabelStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0(25)]", options: [], metrics: nil, views: ["v0":cmLabel]))
        heightLabelStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":cmTextField]))
        heightLabelStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":feet_Label]))
        heightLabelStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":inches_Label]))
        NSLayoutConstraint(item: heightLabelStack, attribute: .centerYWithinMargins, relatedBy: .equal, toItem: heightStack, attribute: .centerYWithinMargins, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: cmLabel, attribute: .centerYWithinMargins, relatedBy: .equal, toItem: heightLabelStack, attribute: .centerYWithinMargins, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: feetLabel, attribute: .centerYWithinMargins, relatedBy: .equal, toItem: heightLabelStack, attribute: .centerYWithinMargins, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: cmTextField, attribute: .leading, relatedBy: .equal, toItem: heightLabelStack, attribute: .leading, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: cmTextField, attribute: .trailing, relatedBy: .equal, toItem: feetLabel, attribute: .leading, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: cmTextField, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1, constant: 50).isActive = true
        
        // MARK: - ageStack constraints
        
        ageStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[v0]|", options: [], metrics: nil, views: ["v0":ageTextField]))
        ageStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":ageTextField]))
        
        // MARK: - birthdayStack constraints
        
        birthdayStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(2)-[v0][v2(162)]|", options: [], metrics: nil, views: ["v0":birthdayLabel,"v2":birthdayLabelStack]))
        birthdayStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":birthdayLabel]))
        birthdayStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0(30)]", options: [], metrics: nil, views: ["v0":birthdayLabelStack]))
        NSLayoutConstraint(item: birthdayLabelStack, attribute: .centerYWithinMargins, relatedBy: .equal, toItem: birthdayStack, attribute: .centerYWithinMargins, multiplier: 1, constant: 0).isActive = true
        
        // MARK: - birthdayLabelStack constraints
        
        birthdayLabelStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(2)-[v0(40)][v1(40)][v2(30)][v3(40)]-(10)-|", options: [], metrics: nil, views: ["v0":birthdayMonthLabel,"v1":monthTextfield,"v2":birthdayDayLabel,"v3":dayTextfield]))
        birthdayLabelStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":birthdayMonthLabel]))
        birthdayLabelStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":monthTextfield]))
        birthdayLabelStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":birthdayDayLabel]))
        birthdayLabelStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":dayTextfield]))
        
        // MARK: - giving attributes to views
        if #available(iOS 13.0, *) {
            sexCountryStack.layer.borderColor = CGColor(red: 0.047, green: 0.686, blue: 1.000, alpha: 1.0)
            presentweightStack.layer.borderColor = CGColor(red: 0.047, green: 0.686, blue: 1.000, alpha: 1.0)
            futureweightStack.layer.borderColor = CGColor(red: 0.047, green: 0.686, blue: 1.000, alpha: 1.0)
            heightStack.layer.borderColor = CGColor(red: 0.047, green: 0.686, blue: 1.000, alpha: 1.0)
            ageStack.layer.borderColor = CGColor(red: 0.047, green: 0.686, blue: 1.000, alpha: 1.0)
            birthdayStack.layer.borderColor = CGColor(red: 0.047, green: 0.686, blue: 1.000, alpha: 1.0)
            sexStack.layer.borderColor = CGColor(red: 0.047, green: 0.686, blue: 1.000, alpha: 1.0)
            countryLabelStack.layer.borderColor = CGColor(red: 0.047, green: 0.686, blue: 1.000, alpha: 1.0)
            allergiesTextField.layer.borderColor = CGColor(red: 0.047, green: 0.686, blue: 1.000, alpha: 1.0)
        } else {
            // Fallback on earlier versions
        }
        presentweighttextfield.placeholder = " Enter current weight"
        futureweighttextfield.placeholder = " Enter desired weight"
        presentweightlabelstack.layer.cornerRadius = 5
        futureweightlabelstack.layer.cornerRadius = 5
        presentweightStack.layer.cornerRadius = 5
        presentweightStack.layer.borderWidth = 0.5
        futureweightStack.layer.cornerRadius = 5
        futureweightStack.layer.borderWidth = 0.5
        sexStack.layer.cornerRadius = 5
        sexStack.layer.borderWidth = 0.5
        countryLabelStack.layer.cornerRadius = 5
        countryLabelStack.layer.borderWidth = 0.5
        heightStack.layer.cornerRadius = 5
        heightStack.layer.borderWidth = 0.5
        ageStack.layer.cornerRadius = 5
        ageStack.layer.borderWidth = 0.5
        birthdayStack.layer.cornerRadius = 5
        birthdayStack.layer.borderWidth = 0.5
        allergiesTextField.layer.cornerRadius = 5
        allergiesTextField.layer.borderWidth = 0.5
        sexLabel.attributedText = NSAttributedString(string: " Gender", attributes: [.font: UIFont(name: "Arial", size: 16)])
        heightLabel.attributedText = NSAttributedString(string: " Height", attributes: [.font: UIFont(name: "Arial", size: 16)])
        birthdayLabel.text = "Birthday"
        birthdayDayLabel.text = "dd:"
        birthdayMonthLabel.text = "mm:"
        countryLabel.text = "Country"
        countryLabel.textAlignment = .left
    }
    
    // MARK: - Navigation

}
