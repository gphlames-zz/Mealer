//
//  loginView.swift
//  Hydrate
//
//  Created by user on 06/05/2020.
//  Copyright © 2021 swift tech. All rights reserved.
//

import UIKit

class loginView: UIView {
    lazy var email_field: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.placeholder = " Email Address"
        textfield.layer.borderColor = CGColor(red: 0.047, green: 0.686, blue: 1.0, alpha: 1.0)
        return textfield
    }()
    lazy var password_field: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.placeholder =  " Password"
        textfield.layer.borderColor = CGColor(red: 0.047, green: 0.686, blue: 1.0, alpha: 1.0)
        return textfield
    }()
    lazy var signUpButton: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.attributedText = NSAttributedString(string: "Sign Up", attributes: [.font: UIFont(name: "Arial", size: 16),.foregroundColor:UIColor(named: "firstshade")])
        label.textAlignment = .left
        label.isUserInteractionEnabled = true
        return label
    }()
    lazy var signInButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setAttributedTitle(NSAttributedString(string: "Sign in", attributes: [.font:UIFont(name: "Arial", size: 16),.foregroundColor:UIColor.white]), for: .normal)
        button.backgroundColor = UIColor(named: "firstshade")
        button.layer.cornerRadius = 8
        return button
    }()
    override func layoutSubviews() {
        //MARK:-> initialization section
        let logostack = UIStackView()
        logostack.axis = .horizontal
        let imageview = UIImageView(image: UIImage(named: "logo"))
        let forget_password_button = UIButton()
        let welcome_label = UILabel()
        let signUPLabel = UILabel()
        let signUpStack = UIStackView()
        //MARK:-> set property section
        signUpStack.axis = .horizontal
        translatemasks([self,imageview,logostack,forget_password_button,welcome_label,signUPLabel,signUpStack])
       
        welcome_label.attributedText = NSAttributedString(string: "Welcome back", attributes: [.font:UIFont(name: "Arial Bold", size: 28),.foregroundColor:UIColor(named: "firstshade")])
        welcome_label.textAlignment = .center
        signUPLabel.attributedText = NSAttributedString(string: "Don't have an account?", attributes: [.font:UIFont(name: "Arial", size: 14),.foregroundColor:UIColor.black])
        signUPLabel.textAlignment = .right
        signUpStack.spacing = 0
        forget_password_button.setTitleColor(UIColor(named: "firstshade"), for: .normal)
        forget_password_button.setAttributedTitle(NSAttributedString(string: "Forgot Password?", attributes: [.font:UIFont(name: "Arial Italic", size: 16)]), for: .normal)
        logostack.addSubview(imageview)
        signUpStack.addSubview(signUPLabel)
        signUpStack.addSubview(signUpButton)
        addSubview(logostack)
        addSubview(welcome_label)
        addSubview(email_field)
        addSubview(password_field)
        addSubview(signInButton)
        addSubview(forget_password_button)
        addSubview(signUpStack)
        
        //MARK:-> set constraints section
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0(60)]-(15)-[v5(30)]-(15)-[v1(40)]-(15)-[v2(40)]-(8)-[v3(10)]", options: [], metrics: nil, views: ["v0":logostack,"v1":email_field,"v2":password_field,"v3":forget_password_button,"v5":welcome_label]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0(40)]-(3)-[v1(30)]-(10)-|", options: [], metrics: nil, views: ["v0":signInButton,"v1":signUpStack]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: [], metrics: nil, views: ["v0":logostack]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(10)-[v0]-(10)-|", options: [], metrics: nil, views: ["v0":email_field]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(10)-[v0]-(10)-|", options: [], metrics: nil, views: ["v0":password_field]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(10)-[v0]-(10)-|", options: [], metrics: nil, views: ["v0":welcome_label]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(20)-[v0]-(20)-|", options: [], metrics: nil, views: ["v0":signInButton]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(20)-[v0]-(20)-|", options: [], metrics: nil, views: ["v0":signUpStack]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[v0(150)]-(10)-|", options: [], metrics: nil, views: ["v0":forget_password_button]))
        logostack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[v0(60)]", options: [], metrics: nil, views: ["v0":imageview]))
        logostack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":imageview]))
        signUpStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0][v1(80)]|", options: [], metrics: nil, views: ["v0":signUPLabel,"v1":signUpButton]))
        signUpStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":signUPLabel]))
        signUpStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":signUpButton]))
        NSLayoutConstraint(item: imageview, attribute: .centerXWithinMargins, relatedBy: .equal, toItem: logostack, attribute: .centerXWithinMargins, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: imageview, attribute: .centerYWithinMargins, relatedBy: .equal, toItem: logostack, attribute: .centerYWithinMargins, multiplier: 1, constant: 0).isActive = true
        self.backgroundColor = UIColor(named: "Ceramic white")
    }
    func translatemasks(_ views:[UIView]){
        for view in views{
            view.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}
