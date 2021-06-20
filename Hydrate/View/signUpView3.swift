//
//  signUpView3.swift
//  Hydrate
//
//  Created by user on 06/05/2020.
//  Copyright © 2021 swift tech. All rights reserved.
//

import UIKit

class signUpView3: UIView {
    var logo: UIStackView = {
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
    var backButton: UIButton = {
        let button = UIButton()
        if #available(iOS 13.0, *) {
            button.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        } else {
            button.setTitle("Back", for: .normal)
        }
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    var continueButton: UIButton = {
        let button = UIButton()
        button.setTitle("Continue", for: .normal)
        button.layer.cornerRadius = 5
        button.backgroundColor = UIColor(named: "firstshade")
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    var userName: UITextField = {
        let username = UITextField()
        username.placeholder = " Email Address"
        username.layer.borderWidth = 1
        username.layer.cornerRadius = 5
        username.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 13.0, *) {
            username.layer.borderColor = CGColor(red: 0.047, green: 0.686, blue: 1.000, alpha: 1.0)
        } else {
            // Fallback on earlier versions
        }
        return username
    }()
    var password: UITextField = {
        let password = UITextField()
        password.placeholder = " Password"
        password.layer.borderWidth = 1
        password.layer.cornerRadius = 5
        password.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 13.0, *) {
            password.layer.borderColor = CGColor(red: 0.047, green: 0.686, blue: 1.000, alpha: 1.0)
        } else {
            // Fallback on earlier versions
        }
        return password
    }()
    var firstName: UITextField = {
        let username = UITextField()
        username.placeholder = " First Name"
        username.layer.borderWidth = 1
        username.layer.cornerRadius = 5
        username.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 13.0, *) {
            username.layer.borderColor = CGColor(red: 0.047, green: 0.686, blue: 1.000, alpha: 1.0)
        } else {
            // Fallback on earlier versions
        }
        return username
    }()
    var lastName: UITextField = {
        let username = UITextField()
        username.placeholder = " Last Name"
        username.layer.borderWidth = 1
        username.layer.cornerRadius = 5
        username.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 13.0, *) {
            username.layer.borderColor = CGColor(red: 0.047, green: 0.686, blue: 1.000, alpha: 1.0)
        } else {
            // Fallback on earlier versions
        }
        return username
    }()
    var mainView3: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "Ceramic white")
        return view
    }()
    func setConstraints(){
        let parentStack = UIStackView()
        let nameStack = UIStackView()
        let nameView = UIView()
        nameStack.addSubview(firstName)
        nameStack.addSubview(nameView)
        nameStack.addSubview(lastName)
        parentStack.addSubview(backButton)
        parentStack.addSubview(logo)
        parentStack.addSubview(nameStack)
        parentStack.addSubview(userName)
        parentStack.addSubview(password)
        parentStack.addSubview(continueButton)
        mainView3.addSubview(parentStack)
        
        parentStack.translatesAutoresizingMaskIntoConstraints = false
        nameStack.translatesAutoresizingMaskIntoConstraints = false
        nameView.translatesAutoresizingMaskIntoConstraints = false
        // MARK: - parentStack constraints
        NSLayoutConstraint(item: parentStack, attribute: .top, relatedBy: .equal, toItem: mainView3, attribute: .top, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: parentStack, attribute: .leading, relatedBy: .equal, toItem: mainView3, attribute: .leading, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: parentStack, attribute: .trailing, relatedBy: .equal, toItem: mainView3, attribute: .trailing, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: parentStack, attribute: .bottom, relatedBy: .equal, toItem: mainView3, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
        parentStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0(40)]-(10)-[v1(50)]-(10)-[v2(50)]-(10)-[v3(50)]-(10)-[v4(50)]-(10)-[v5(50)]", options: [], metrics: nil, views: ["v0":backButton,"v1":logo,"v2":nameStack,"v3":userName,"v4":password,"v5":continueButton]))
        parentStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(10)-[v0(40)]", options: [], metrics: nil, views: ["v0":backButton]))
        parentStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(10)-[v0]-(10)-|", options: [], metrics: nil, views: ["v0":logo]))
        parentStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(10)-[v0]-(10)-|", options: [], metrics: nil, views: ["v0":nameStack]))
        parentStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(10)-[v0]-(10)-|", options: [], metrics: nil, views: ["v0":userName]))
        parentStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(10)-[v0]-(10)-|", options: [], metrics: nil, views: ["v0":password]))
        parentStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[v0(200)]", options: [], metrics: nil, views: ["v0":continueButton]))
        NSLayoutConstraint(item: continueButton, attribute: .centerXWithinMargins, relatedBy: .equal, toItem: parentStack, attribute: .centerXWithinMargins, multiplier: 1, constant: 0).isActive = true


        // MARK: - nameStack Constraints
        //let parentWidth = (parentStack.bounds.width - 25)/2
        nameStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]-[v2(25)]-[v1]|", options: [], metrics: nil, views: ["v0":firstName,"v1":lastName,"v2":nameView]))
        nameStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":firstName]))
        nameStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":lastName]))
        NSLayoutConstraint(item: nameView, attribute: .centerXWithinMargins, relatedBy: .equal, toItem: nameStack, attribute: .centerXWithinMargins, multiplier: 1, constant: 0).isActive = true
    }
}
