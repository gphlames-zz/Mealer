//
//  data.swift
//  Hydrate
//
//  Created by user on 06/05/2020.
//  Copyright © 2020 swift tech. All rights reserved.
//

import Foundation
struct DataOfApp{
    let feet = ["3","4","5","6","7","8"]
    let inches = ["0","1","2","3","4","5","6","7","8","9","10","11"]
    let month = ["1","2","3","4","5","6","7","8","9","10","11","12"]
    let day = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16",
               "17","18","19","20","21","22","23","24","25","26","27","28","29","30","31"]
    let writeup:[startingwriteup] = [
        startingwriteup("Build Your perfect meal Plan","The Mealer app makes organizing a meal plan for whatever goal you choose easy with it's clean easy to use interface"),startingwriteup("Search for recipe", "searching for different recipes and including it to your meal plan has never been easier"),startingwriteup("Professional meal plans", "Buy Meal plans built by professionals to meet your different goals")
    ]
    var countries: [String] = {
        var country = [String]()
        for code in NSLocale.isoCountryCodes  {
            let id = NSLocale.localeIdentifier(fromComponents: [NSLocale.Key.countryCode.rawValue: code])
            let name = NSLocale(localeIdentifier: "en_UK").displayName(forKey: NSLocale.Key.identifier, value: id) ?? "Country not found for code: \(code)"
            country.append(name)
        }
        return country
    }()
    
    static func monthreturn(_ int:Int) -> String{
        let month = int
        switch month {
        case 1:
            return "Jan"
        case 2:
            return "Feb"
        case 3:
            return "Mar"
        case 4:
            return "Apr"
        case 5:
            return "May"
        case 6:
            return "Jun"
        case 7:
            return "Jul"
        case 8:
            return "Aug"
        case 9:
            return "Sep"
        case 10:
            return "Oct"
        case 11:
            return "Nov"
        case 12:
            return "Dec"
        default:
            return "Unknown"
        }
    }
}

struct startingwriteup {
    var infolabel: String
    var infolabel2: String
    init(_ string1: String, _ string2: String) {
        self.infolabel = string1
        self.infolabel2 = string2
    }
}

