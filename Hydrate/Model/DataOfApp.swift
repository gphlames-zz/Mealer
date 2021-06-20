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
    var countries: [String] = {
        var country = [String]()
        for code in NSLocale.isoCountryCodes  {
            let id = NSLocale.localeIdentifier(fromComponents: [NSLocale.Key.countryCode.rawValue: code])
            let name = NSLocale(localeIdentifier: "en_UK").displayName(forKey: NSLocale.Key.identifier, value: id) ?? "Country not found for code: \(code)"
            country.append(name)
        }
        return country
    }()
}

