//
//  siginClass.swift
//  Hydrate
//
//  Created by user on 06/05/2020.
//  Copyright © 2021 swift tech. All rights reserved.
//

import Foundation
import Firebase

protocol signInState {
    func didFailWithError(_ state: String)
    func didlogin(_ login: Bool)
}

class signinClass {
    var email: String = ""
    var password: String = ""
    var delegate: signInState?
    func login(){
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            if let err = error{
                print("there was an error")
                self?.delegate?.didFailWithError(err.localizedDescription)
            }else{
                print("succeeded")
                self?.delegate?.didlogin(true)
            }
          
        }
    }
}
