//
//  signUpViewController3.swift
//  Hydrate
//
//  Created by user on 06/05/2020.
//  Copyright © 2021 swift tech. All rights reserved.
//

import UIKit

class signUpViewController3: UIViewController {
   var signUpView = signUpView3()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(signUpView.mainView3)
        navigationController?.navigationBar.isHidden = true
        let topguide = view.safeAreaLayoutGuide
        signUpView.mainView3.topAnchor.constraint(equalTo: topguide.topAnchor, constant: 1).isActive = true
        signUpView.backButton.addTarget(self, action: #selector(dismissview), for: .touchUpInside)
        NSLayoutConstraint(item: signUpView.mainView3, attribute: .height, relatedBy: .equal, toItem: view, attribute: .height, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: signUpView.mainView3, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 1, constant: 0).isActive = true
        signUpView.setConstraints()
        signUpView.continueButton.addTarget(self, action: #selector(continueFunction), for: .touchUpInside)
        // Do any additional setup after loading the view.
    }
    
    @objc func dismissview(){
        dismiss(animated: true, completion: nil)
    }
    @objc func continueFunction(){
        let homeViewController = tabViewController()
        let navigation = UINavigationController(rootViewController: homeViewController)
        navigation.modalPresentationStyle = .fullScreen
        present(navigation, animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
