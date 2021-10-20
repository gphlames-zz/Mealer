//
//  signUpClass.swift
//  Hydrate
//
//  Created by user on 06/05/2020.
//  Copyright © 2021 swift tech. All rights reserved.
//

import Foundation
import Firebase

protocol signUpState {
    func didFailWithError(_ error: Error)
    func success(_ bool: Bool)
}

struct signUpClass {
    var email: String = ""
    var password: String = ""
    var delegate: signUpState?
    func signUp(){
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let err = error{
                self.delegate?.didFailWithError(err)
            }else{
                self.delegate?.success(true)
            }
        }
        
    }
}
