//
//  signUpViewController3.swift
//  Hydrate
//
//  Created by user on 06/05/2020.
//  Copyright © 2021 swift tech. All rights reserved.
//

import UIKit
import Firebase
import CoreData

class signUpViewController3: UIViewController {
   var signUpView = signUpView3()
    var signup = signUpClass()
    var write = writetofirebase()
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var customerdetails: NSManagedObject?
    var signupbool: Bool = false
    var writebool: Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(signUpView)
        signUpView.frame = view.frame
        navigationController?.navigationBar.isHidden = true
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: [], metrics: nil, views: ["v0":signUpView]))
        let topguide = view.safeAreaLayoutGuide
        signUpView.topAnchor.constraint(equalTo: topguide.topAnchor, constant: 1).isActive = true
        signUpView.backButton.addTarget(self, action: #selector(dismissview), for: .touchUpInside)
        signUpView.continueButton.addTarget(self, action: #selector(continueFunction), for: .touchUpInside)
        signup.delegate = self
        write.delegate = self
        write.customerdetails = CustomerDetail(customerID: "", firstname: "", lastname: "", age: 0, birthday: 0, country: "", pound: true, feetboolean: true, currentweight: 0, desiredweight: 0, sex: false, feet: 0, inches: 0, cm: 0)
        do{
            for i in context.insertedObjects{
                if i is CustomerDetails{
                    customerdetails = try context.existingObject(with: i.objectID )
                }
            }
        }catch{
            let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "OK", style: .cancel) { _ in
                alert.dismiss(animated: true, completion: nil)
            }
            alert.addAction(alertAction)
            present(alert, animated: true, completion: nil)
        }
        
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        addbottomlayer([signUpView.firstName,signUpView.lastName,signUpView.password,signUpView.userName])
    }
    
    @objc func dismissview(){
        dismiss(animated: true, completion: nil)
    }
    @objc func continueFunction(){
        let cg = customerdetails as! CustomerDetails
        cg.firstname = signUpView.firstName.text
        cg.lastname = signUpView.lastName.text
        signup.email = signUpView.userName.text ?? ""
        signup.password = signUpView.password.text ?? ""
        
        if cg.firstname!.isEmpty || cg.lastname!.isEmpty || cg.customerID!.isEmpty{
            let alert = UIAlertController(title: "Error", message: "Your first name, last name, email and password are required for the sign up process", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "OK", style: .cancel) { _ in
                alert.dismiss(animated: true, completion: nil)
            }
            alert.addAction(alertAction)
            present(alert, animated: true, completion: nil)
        }else{
            write.customerdetails.age = Int(cg.age)
            //write.customerdetails?.allergies = cg.allergies ?? []
            write.customerdetails.birthday = Int(cg.birthday)
            for (_,k) in cg.chosenchoices!.enumerated(){
                if k.value == true{
                    //write.customerdetails?.chosenchoices.append(k.key)
                }
            }
            write.customerdetails.cm = cg.cm
            write.customerdetails.country = cg.country!
            write.customerdetails.currentweight = Int(cg.currentweight)
            write.customerdetails.desiredweight = Int(cg.desiredweight)
            write.customerdetails.feet = Int(cg.feet)
            write.customerdetails.feetboolean = cg.feetboolean
            write.customerdetails.firstname = cg.firstname!
            write.customerdetails.lastname = cg.lastname!
            write.customerdetails.pound = cg.pound
            write.customerdetails.sex = cg.sex
            //self.signup.signUp()
            DispatchQueue.main.async {
                let homeViewController = tabViewController()
                let navigation = UINavigationController(rootViewController: homeViewController)
                navigation.modalPresentationStyle = .fullScreen
                self.present(navigation, animated: true, completion: nil)
            }
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

}

extension signUpViewController3: signUpState,writefirebase{
    func didSuccessfulWrite(_ bool: Bool) {
        DispatchQueue.main.async {
            let homeViewController = tabViewController()
            let navigation = UINavigationController(rootViewController: homeViewController)
            navigation.modalPresentationStyle = .fullScreen
            self.present(navigation, animated: true, completion: nil)
        }
    }
    
    func didFailWithError(_ error: Error) {
        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .cancel) { _ in
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(alertAction)
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
       
    }
    
    func success(_ bool: Bool) {
        if bool == true{
            self.write.write()
        }else{
            
        }
        
    }
}
