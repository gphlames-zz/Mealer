//
//  loginViewController.swift
//  Hydrate
//
//  Created by user on 06/05/2020.
//  Copyright © 2021 swift tech. All rights reserved.
//

import UIKit

class loginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        tabBarController?.tabBar.isHidden = false
        let main_view = UIView()
        view.addSubview(main_view)
        view.backgroundColor = .white
        let guides = view.safeAreaLayoutGuide
        main_view.translatesAutoresizingMaskIntoConstraints = false
        main_view.backgroundColor = .white
        NSLayoutConstraint(item: main_view, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: main_view, attribute: .height, relatedBy: .equal, toItem: view, attribute: .height, multiplier: 1, constant: 0).isActive = true
        main_view.topAnchor.constraint(equalTo: guides.topAnchor,constant: 0).isActive = true
        //main_view.bottomAnchor.constraint(equalTo: guides.bottomAnchor, constant: 0).isActive = true
        setUpViews(view: main_view)
    }
    func setUpViews(view: UIView){
        //MARK:-> initialization section
        let logostack = UIStackView()
        logostack.axis = .horizontal
        let imageview = UIImageView(image: UIImage(named: "logo"))
        let parentStack = UIStackView()
        let email_field = UITextField()
        let password_field = UITextField()
        let signInButton = UIButton()
        let forget_password_button = UIButton()
        let padding_view = UIView()
        let welcome_label = UILabel()
        let signUPLabel = UILabel()
        let signUpStack = UIStackView()
        let signUpButton = UIButton()
        //MARK:-> set property section
        parentStack.axis = .vertical
        signUpStack.axis = .horizontal
        parentStack.translatesAutoresizingMaskIntoConstraints = false
        imageview.translatesAutoresizingMaskIntoConstraints = false
        logostack.translatesAutoresizingMaskIntoConstraints = false
        email_field.translatesAutoresizingMaskIntoConstraints = false
        password_field.translatesAutoresizingMaskIntoConstraints = false
        forget_password_button.translatesAutoresizingMaskIntoConstraints = false
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        welcome_label.translatesAutoresizingMaskIntoConstraints = false
        signUPLabel.translatesAutoresizingMaskIntoConstraints = false
        signUpStack.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        email_field.placeholder = " Email Address"
        password_field.placeholder = " Password"
        email_field.layer.borderWidth = 2
        password_field.layer.borderWidth = 2
        welcome_label.text = "Welcome back"
        welcome_label.font = .italicSystemFont(ofSize: 24.0)
        welcome_label.textAlignment = .center
        welcome_label.textColor = UIColor(named: "chlorineblue")
        signUPLabel.text = "Don't have an account?"
        signUPLabel.textAlignment = .right
        signUPLabel.textColor = UIColor(named: "chlorineblue")
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.setTitleColor(.systemBlue, for: .normal)
        if #available(iOS 13.0, *) {
            email_field.layer.borderColor = .init(red: 0.047, green: 0.686, blue: 1.0, alpha: 1.0)
            password_field.layer.borderColor = .init(red: 0.047, green: 0.686, blue: 1.0, alpha: 1.0)
        } else {
        
        }
        signInButton.setTitle("Sign in", for: .normal)
        signInButton.backgroundColor = UIColor(named: "chlorineblue")
        signInButton.layer.cornerRadius = 8
        signInButton.setTitleColor(.white, for: .normal)
        signUpStack.spacing = 0
        forget_password_button.setTitleColor(UIColor.systemBlue, for: .normal)
        forget_password_button.setTitle("Forgot Password?", for: .normal)
        signUpButton.addTarget(self, action: #selector(signUpButtonPressed), for: .touchUpInside)
        logostack.addSubview(imageview)
        signUpStack.addSubview(signUPLabel)
        signUpStack.addSubview(signUpButton)
        parentStack.addSubview(logostack)
        parentStack.addSubview(welcome_label)
        parentStack.addSubview(email_field)
        parentStack.addSubview(password_field)
        parentStack.addSubview(signInButton)
        parentStack.addSubview(forget_password_button)
        parentStack.addSubview(padding_view)
        parentStack.addSubview(signUpStack)
        view.addSubview(parentStack)
        
        //MARK:-> set constraints section
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":parentStack]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: [], metrics: nil, views: ["v0":parentStack]))
        parentStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0(60)]-(15)-[v5(30)]-(15)-[v1(40)]-(15)-[v2(40)]-(5)-[v3(10)]-(15)-[v4(40)]-(3)-[v6(15)]", options: [], metrics: nil, views: ["v0":logostack,"v1":email_field,"v2":password_field,"v3":forget_password_button,"v4":signInButton,"v5":welcome_label,"v6":signUpStack]))
        parentStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: [], metrics: nil, views: ["v0":logostack]))
        parentStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(10)-[v0]-(10)-|", options: [], metrics: nil, views: ["v0":email_field]))
        parentStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(10)-[v0]-(10)-|", options: [], metrics: nil, views: ["v0":password_field]))
        parentStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(10)-[v0]-(10)-|", options: [], metrics: nil, views: ["v0":welcome_label]))
        parentStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(20)-[v0]-(20)-|", options: [], metrics: nil, views: ["v0":signInButton]))
        parentStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(20)-[v0]-(20)-|", options: [], metrics: nil, views: ["v0":signUpStack]))
        parentStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(10)-[v1][v0(150)]-(10)-|", options: [], metrics: nil, views: ["v0":forget_password_button,"v1":padding_view]))
        logostack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[v0(60)]", options: [], metrics: nil, views: ["v0":imageview]))
        logostack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":imageview]))
        signUpStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0][v1(80)]|", options: [], metrics: nil, views: ["v0":signUPLabel,"v1":signUpButton]))
        signUpStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":signUPLabel]))
        signUpStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":signUpButton]))
        NSLayoutConstraint(item: imageview, attribute: .centerXWithinMargins, relatedBy: .equal, toItem: logostack, attribute: .centerXWithinMargins, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: imageview, attribute: .centerYWithinMargins, relatedBy: .equal, toItem: logostack, attribute: .centerYWithinMargins, multiplier: 1, constant: 0).isActive = true
        //NSLayoutConstraint(item: padding_view, attribute: .top, relatedBy: .equal, toItem: password_field, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
    }
    @objc func signUpButtonPressed(){
        let view = signUpViewController1()
        let navigationController = UINavigationController(rootViewController: view)
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true, completion: nil)
    }
}

