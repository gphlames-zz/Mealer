//
//  writetofirebase.swift
//  Hydrate
//
//  Created by user on 06/05/2020.
//  Copyright © 2021 swift tech. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

protocol writefirebase{
    func didFailWithError(_ error: Error)
    func didSuccessfulWrite(_ bool: Bool)
}

struct writetofirebase {
    var customerdetails: CustomerDetail = CustomerDetail()
    let db = Firestore.firestore()
    var delegate: writefirebase?
    func write(){
        print(customerdetails)
        do {
            try db.collection("Mealer Users").document("customerDetails").setData(from: customerdetails, merge: true)
                delegate?.didSuccessfulWrite(true)
           
        } catch let error {
            delegate?.didFailWithError(error)
        }
    }
}
