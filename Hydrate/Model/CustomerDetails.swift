//
//  File.swift
//  Hydrate
//
//  Created by user on 06/05/2020.
//  Copyright © 2021 swift tech. All rights reserved.
//

import Foundation
struct CustomerDetail {
    var customerID = ""
    var firstname: String = ""
    var lastname: String = ""
    var age: Int = 0
    var birthday: Date = Date()
    var country: String = ""
    var pound: Bool = true
    var feetboolean: Bool = true
    var chosenchoices: [String:Bool]?
    var currentweight: Int = 0
    var desiredweight: Int = 0
    var sex: Bool = false
    var feet: Int = 0
    var inches: Int = 0
    var cm: Float = 0.0
    var allergies:[String]?
}
struct CustomerChoices{
    let choices: [String:Bool] = ["Be Healthy":false,"Sleep Better":false,"Boost Energy":false,"Lose Weight":false,"Control Glucose":false,"Gain Weight":false,"Build Muscle":false]
}
