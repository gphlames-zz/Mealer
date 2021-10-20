//
//  loginViewController.swift
//  Hydrate
//
//  Created by user on 06/05/2020.
//  Copyright © 2021 swift tech. All rights reserved.
//

import UIKit

class loginViewController: UIViewController {
    let signinview = loginView()
    let siginModel = signinClass()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        view.addSubview(signinview)
        view.backgroundColor = UIColor(named: "Ceramic white")
        let guides = view.safeAreaLayoutGuide
        signinview.frame = view.frame
//        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":signinview]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: [], metrics: nil, views: ["v0":signinview]))
        signinview.topAnchor.constraint(equalTo: guides.topAnchor,constant: 0).isActive = true
        signinview.bottomAnchor.constraint(equalTo: guides.bottomAnchor,constant: 0).isActive = true
        signinview.signInButton.addTarget(self, action: #selector(signInButtonPressed), for: .touchUpInside)
        let gesture = UITapGestureRecognizer(target: self, action: #selector(signUpButtonPressed))
        signinview.signUpButton.addGestureRecognizer(gesture)
        siginModel.delegate = self
    }
    override func viewDidAppear(_ animated: Bool) {
        addbottomlayer([signinview.email_field,signinview.password_field])
    }
    @objc func signUpButtonPressed(){
        let view = signUpViewController1()
        let navigationController = UINavigationController(rootViewController: view)
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true, completion: nil)
    }
    @objc func signInButtonPressed(){
        siginModel.email = signinview.email_field.text ?? ""
        siginModel.password = signinview.password_field.text ?? ""
        siginModel.login()
    }
    func addbottomlayer(_ inview: [UIView]){
        for i in inview{
            let layer = CALayer()
            layer.frame = CGRect(x: 0, y: Int(i.frame.height) - 1, width: Int(i.frame.width), height: 1)
            layer.backgroundColor = UIColor.systemBlue.cgColor
            i.layer.addSublayer(layer)
        }
    }
}
extension loginViewController: signInState{
    func didFailWithError(_ state: String) {
        let alert = UIAlertController(title: "Error", message: state, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .cancel) { _ in
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
    }
    func didlogin(_ login: Bool) {
        if login == true{
            let nextview = HomeViewController()
            let navigationController = UINavigationController(rootViewController: nextview)
            navigationController.modalPresentationStyle = .fullScreen
            present(navigationController, animated: true, completion: nil)
        }else{
            
        }
    }
    
    
}

