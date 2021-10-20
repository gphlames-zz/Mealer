//
//  File.swift
//  Hydrate
//
//  Created by user on 06/05/2020.
//  Copyright © 2021 swift tech. All rights reserved.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

 struct CustomerDetail: Codable {
    var customerID: String = ""
    var firstname: String = ""
    var lastname: String = ""
    var age: Int = 0
    var birthday: Int = 0
    var country: String = ""
    var pound: Bool = true
    var feetboolean: Bool = true
    var currentweight: Int = 0
    var desiredweight: Int = 0
    var sex: Bool = false
    var feet: Int = 0
    var inches: Int = 0
    var cm: Float = 0.0
    
    enum CodingKeys: String, CodingKey {
        case firstname
        case lastname
        case age
        case birthday
        case country
        case pound
        case feetboolean
        case currentweight
        case desiredweight
        case sex
        case feet
        case inches
        case cm
        case customerID
    }
    //var allergies:[String] = []
    
//    enum CodingKeys: String, CodingKey {
//        case customerID
//        case firstname = "First Name"
//        case lastname = "Last Name"
//        case age = "Age"
//        case birthday = "Birthday"
//        case country = "Country"
//        case pound
//        case feetboolean
//        //case chosenchoices = "Chosen Choices"
//        case currentweight = "Current weight"
//        case desiredweight = "Desired Weight"
//        case sex = "Sex"
//        case feet = "Feet"
//        case inches = "Inches"
//        case cm = "Cm"
//       // case allergies = "Allergies"
//    }
}
struct CustomerChoices{
    let choices: [String:Bool] = ["Be Healthy":false,"Sleep Better":false,"Boost Energy":false,"Lose Weight":false,"Control Glucose":false,"Gain Weight":false]
}
