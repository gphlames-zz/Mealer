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
        button.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        button.setTitle("Back", for: .normal)
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
        button.layer.cornerRadius = 8
        button.setTitleColor(.white, for: .normal)
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
    lazy var presentweighttextfield: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.placeholder = "Enter your present weight"
        textfield.font = UIFont(name: "Arial", size: 16)
        return textfield
    }()
    lazy var futureweighttextfield: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.placeholder = "Enter your future weight"
        textfield.font = UIFont(name: "Arial", size: 16)
        return textfield
    }()
    lazy var datepicker: UIDatePicker = {
        let date = UIDatePicker()
        date.translatesAutoresizingMaskIntoConstraints = false
        date.datePickerMode = .date
        return date
    }()
    lazy var presentweightStack: UIStackView = {
        let stackview = UIStackView()
        stackview.translatesAutoresizingMaskIntoConstraints = false
        return stackview
    }()
    lazy var futureweightStack: UIStackView = {
        let stackview = UIStackView()
        stackview.translatesAutoresizingMaskIntoConstraints = false
        return stackview
    }()
    
    override func layoutSubviews() {
        // MARK: - initialization section
        let presentweightlabelstack = UIStackView()
        let futureweightlabelstack =  UIStackView()
        let sexlabelstack = UIStackView()
        let sexandbirthdaystack = UIStackView()
        let heightandcountrystack = UIStackView()
        let heightLabel = UILabel()
        let heightLabelStack = UIStackView()
        let birthdayLabel = UILabel()
        let countryLabel = UILabel()
        let countryLabelStack = UIStackView()
        // MARK: - adding autoresizingmaskintocontraints to views
        translatemasks([self,presentweightlabelstack,futureweightlabelstack,sexlabelstack,sexandbirthdaystack,heightandcountrystack,heightLabel,heightLabelStack,birthdayLabel,countryLabel,countryLabelStack])
        
        // MARK: - adding subviews
        addsubviews(addingview: presentweightlabelstack, array: [presentpoundLabel,presentkilogramLabel])
        addsubviews(addingview: futureweightlabelstack, array: [futurepoundLabel,futurekilogramLabel])
        addsubviews(addingview: presentweightStack, array: [presentweighttextfield,presentweightlabelstack])
        addsubviews(addingview: futureweightStack, array: [futureweighttextfield,futureweightlabelstack])
        addsubviews(addingview: sexandbirthdaystack, array: [sexlabelstack,birthdayLabel,datepicker])
        addsubviews(addingview: sexlabelstack, array: [maleLabel,femaleLabel])
        addsubviews(addingview: countryLabelStack, array: [countryLabel,countryPicker])
        addsubviews(addingview: heightLabelStack, array: [feetPicker,inchesPicker,feetLabel,cmLabel,cmTextField,feet_Label,inches_Label])
        addsubviews(addingview: heightandcountrystack, array: [heightLabel,heightLabelStack])
        addsubviews(addingview: self, array: [backButton,logo,presentweightStack,futureweightStack,sexandbirthdaystack,heightandcountrystack,allergiesTextField,continueButton,countryLabelStack])
        
        // MARK: - adding constraints to view
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0(50)]-(5)-[v1(50)]-(10)-[v2(50)]-(10)-[v3(50)]-(10)-[v10(50)]-(10)-[v4(50)]-(10)-[v5(50)]-(10)-[v6(50)]", options: [], metrics: nil, views: ["v0":backButton, "v1":logo,"v2":presentweightStack,"v3":futureweightStack,"v4":sexandbirthdaystack,"v5":heightandcountrystack,"v10":allergiesTextField,"v6":countryLabelStack]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(10)-[v0]-(10)-|", options: [], metrics: nil, views: ["v0":logo]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(10)-[v0]-(10)-|", options: [], metrics: nil, views: ["v0":presentweightStack]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(10)-[v0]-(10)-|", options: [], metrics: nil, views: ["v0":futureweightStack]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(10)-[v0]-(10)-|", options: [], metrics: nil, views: ["v0":sexandbirthdaystack]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(10)-[v0]-(10)-|", options: [], metrics: nil, views: ["v0":heightandcountrystack]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(10)-[v0]-(10)-|", options: [], metrics: nil, views: ["v0":allergiesTextField]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(10)-[v0]-(10)-|", options: [], metrics: nil, views: ["v0":countryLabelStack]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[v0(200)]", options: [], metrics: nil, views: ["v0":continueButton]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0(50)]-(10)-|", options: [], metrics: nil, views: ["v0":continueButton]))
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
        
                // MARK: - sexandbirthdaylabelStack constraints
        
        sexandbirthdaystack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0(100)]-(2)-[v1(280)]", options: [], metrics: nil, views: ["v0":birthdayLabel,"v1":datepicker]))
        sexandbirthdaystack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[v0(80)]-(5)-|", options: [], metrics: nil, views: ["v0":sexlabelstack]))
        sexandbirthdaystack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0(25)]", options: [], metrics: nil, views: ["v0":sexlabelstack]))
        NSLayoutConstraint(item: sexlabelstack, attribute: .centerYWithinMargins, relatedBy: .equal, toItem: sexandbirthdaystack, attribute: .centerYWithinMargins, multiplier: 1, constant: 0).isActive = true
        sexandbirthdaystack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":birthdayLabel]))
        sexandbirthdaystack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":datepicker]))
        
        // MARK: - sexlabelstack constraints
        
        sexlabelstack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0(40)][v1(40)]|", options: [], metrics: nil, views: ["v0":maleLabel,"v1":femaleLabel]))
        sexlabelstack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":maleLabel]))
        sexlabelstack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":femaleLabel]))
        NSLayoutConstraint(item: sexlabelstack, attribute: .centerYWithinMargins, relatedBy: .equal, toItem: sexandbirthdaystack, attribute: .centerYWithinMargins, multiplier: 1, constant: 0).isActive = true
        
        // MARK: - countryLabelStack constraints
        
        countryLabelStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0(70)]", options: [], metrics: nil, views: ["v0":countryLabel]))
        countryLabelStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[v0]-(5)-|", options: [], metrics: nil, views: ["v0":countryPicker]))
        countryLabelStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":countryLabel]))
        countryLabelStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0(50)]", options: [], metrics: nil, views: ["v0":countryPicker]))
        NSLayoutConstraint(item: countryPicker, attribute: .centerYWithinMargins, relatedBy: .equal, toItem: countryLabelStack, attribute: .centerYWithinMargins, multiplier: 1, constant: 0).isActive = true
        
        // MARK: - heightStack constraints
        
        heightandcountrystack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0(100)]-(2)-[v2]|", options: [], metrics: nil, views: ["v0":heightLabel,"v2":heightLabelStack]))
        heightandcountrystack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":heightLabel]))
        heightandcountrystack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0(40)]", options: [], metrics: nil, views: ["v0":heightLabelStack]))
        
        // MARK: - heightLabelStack constraints
        
        heightLabelStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v4(20)][v0(30)][v5(20)][v1(30)]", options: [], metrics: nil, views: ["v0":feetPicker,"v1":inchesPicker,"v4":feet_Label,"v5":inches_Label]))
        heightLabelStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[v2(40)][v3(40)]-(5)-|", options: [], metrics: nil, views: ["v2":feetLabel,"v3":cmLabel]))
        heightLabelStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":feetPicker]))
        heightLabelStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0(25)]", options: [], metrics: nil, views: ["v0":feetLabel]))
        heightLabelStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":inchesPicker]))
        heightLabelStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0(25)]", options: [], metrics: nil, views: ["v0":cmLabel]))
        heightLabelStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":cmTextField]))
        heightLabelStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":feet_Label]))
        heightLabelStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":inches_Label]))
        NSLayoutConstraint(item: heightLabelStack, attribute: .centerYWithinMargins, relatedBy: .equal, toItem: heightandcountrystack, attribute: .centerYWithinMargins, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: cmLabel, attribute: .centerYWithinMargins, relatedBy: .equal, toItem: heightLabelStack, attribute: .centerYWithinMargins, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: feetLabel, attribute: .centerYWithinMargins, relatedBy: .equal, toItem: heightLabelStack, attribute: .centerYWithinMargins, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: cmTextField, attribute: .leading, relatedBy: .equal, toItem: heightLabelStack, attribute: .leading, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: cmTextField, attribute: .trailing, relatedBy: .equal, toItem: feetLabel, attribute: .leading, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: cmTextField, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1, constant: 50).isActive = true
        

        
        // MARK: - giving attributes to views
        heightLabel.attributedText = NSAttributedString(string: " Height", attributes: [.font: UIFont(name: "Arial", size: 16)])
        birthdayLabel.attributedText = NSAttributedString(string: "Date of birth", attributes: [.font:UIFont(name: "Arial", size: 16)])
        countryLabel.attributedText = NSAttributedString(string: "Country", attributes: [.font:UIFont(name: "Arial", size: 16)])
        countryLabel.textAlignment = .left
        addbottomlayer([presentweightStack,futureweightStack,sexandbirthdaystack,heightandcountrystack,allergiesTextField])
        futureweightlabelstack.layer.cornerRadius = 10
        presentweightlabelstack.layer.cornerRadius = 10
        presentpoundLabel.layer.cornerRadius = 10
        presentkilogramLabel.layer.cornerRadius = 10
        futurepoundLabel.layer.cornerRadius = 10
        futurekilogramLabel.layer.cornerRadius = 10
        feetLabel.layer.cornerRadius = 10
        cmLabel.layer.cornerRadius = 10
    }
    func translatemasks(_ views:[UIView]){
        for view in views{
            view.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    func addsubviews(addingview: UIView, array:[UIView]){
        for i in array{
            addingview.addSubview(i)
        }
    }
    func addbottomlayer(_ inview: [UIView]){
        for i in inview{
            let layer = CALayer()
            layer.frame = CGRect(x: 0, y: Int(i.frame.height) - 1, width: Int(i.frame.width), height: 1)
            layer.backgroundColor = UIColor.systemBlue.cgColor
            i.layer.addSublayer(layer)
        }
    }

    
    // MARK: - Navigation

}
