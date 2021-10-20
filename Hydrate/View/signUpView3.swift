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
        button.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    var continueButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign Up", for: .normal)
        button.layer.cornerRadius = 5
        button.backgroundColor = UIColor(named: "firstshade")
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    var userName: UITextField = {
        let username = UITextField()
        username.placeholder = " Email Address"
        username.translatesAutoresizingMaskIntoConstraints = false
        return username
    }()
    var password: UITextField = {
        let password = UITextField()
        password.placeholder = " Password"
        password.translatesAutoresizingMaskIntoConstraints = false
        return password
    }()
    var firstName: UITextField = {
        let username = UITextField()
        username.placeholder = " First Name"
        username.translatesAutoresizingMaskIntoConstraints = false
        return username
    }()
    var lastName: UITextField = {
        let username = UITextField()
        username.placeholder = " Last Name"
        username.translatesAutoresizingMaskIntoConstraints = false
        return username
    }()
    override func layoutSubviews() {
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
        addSubview(parentStack)
        
        parentStack.translatesAutoresizingMaskIntoConstraints = false
        nameStack.translatesAutoresizingMaskIntoConstraints = false
        nameView.translatesAutoresizingMaskIntoConstraints = false
        // MARK: - parentStack constraints
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":parentStack]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: [], metrics: nil, views: ["v0":parentStack]))
        parentStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0(40)]-(10)-[v1(50)]-(10)-[v2(50)]-(10)-[v3(50)]-(10)-[v4(50)]", options: [], metrics: nil, views: ["v0":backButton,"v1":logo,"v2":nameStack,"v3":userName,"v4":password]))
        parentStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0]-(10)-|", options: [], metrics: nil, views: ["v0":continueButton]))
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
