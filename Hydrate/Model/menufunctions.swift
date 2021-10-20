//
//  recipeClass.swift
//  Hydrate
//
//  Created by user on 06/05/2020.
//  Copyright © 2021 swift tech. All rights reserved.
//

import UIKit

struct recipe: Decodable{
    var id: UInt
    var title: String
    var image: String
}
struct menuItems:Decodable {
    var menuItems: [recipe]
}

struct productinfo:Decodable{
    var ingredientcount: Int
    var ingredient: [ingredientinfo]
    var fat: String
    var protein: String
    var carbs: String
    var fatpercent: Double
    var proteinpercent: Double
    var carbspercent: Double
    var calories: Double
    
    enum CodingKeys: String, CodingKey {
        case ingredientCount
        case ingredients
        case nutrition
    }
    enum firstKeys: String, CodingKey{
        case caloricbreakdown = "caloricBreakdown"
        case fat
        case protein
        case carbs
        case calories
    }
    enum secondCodingKeys: String, CodingKey {
        case percentProtein
        case percentFat
        case percentCarbs
    }
    init(from decoder: Decoder) throws {
        let collection = try decoder.container(keyedBy: CodingKeys.self)
        let nutitioncollection = try collection.nestedContainer(keyedBy: firstKeys.self, forKey: .nutrition)
        let caloriCollection = try nutitioncollection.nestedContainer(keyedBy: secondCodingKeys.self, forKey: .caloricbreakdown)
        fat = try nutitioncollection.decode(String.self, forKey: .fat)
        protein = try nutitioncollection.decode(String.self, forKey: .protein)
        carbs = try nutitioncollection.decode(String.self, forKey: .carbs)
        calories = try nutitioncollection.decode(Double.self, forKey: .calories)
        ingredientcount = try collection.decode(Int.self, forKey: .ingredientCount)
        ingredient = try collection.decode([ingredientinfo].self, forKey: .ingredients)
        fatpercent = try caloriCollection.decode(Double.self, forKey: .percentFat)
        proteinpercent = try caloriCollection.decode(Double.self, forKey: .percentProtein)
        carbspercent = try caloriCollection.decode(Double.self, forKey: .percentCarbs)
    }
}
struct nutrients: Decodable {
    var items: [nutrientsInfo]
}
struct nutrientsInfo: Decodable{
    var name: String
    var amount: Int
}
struct ingredientinfo: Decodable {
    var name: String
    var description: String?
}
struct caloricBreakdown: Decodable {
    var percentProtein: Double
    var percentFat: Double
    var percentCarbs: Double
}
class recipefunctions{
    var foods = ["vegetables","rice","potatoes","chocolate"]
    static let shared = recipefunctions()
    func getrecipe(completion: @escaping (menuItems?) -> Void){
        let endpoint: String = "https://api.spoonacular.com/food/menuItems/search?query=\(String(describing: foods.randomElement()!))&number=\(ispaid())&apiKey=7321ce3230f844b987ef68de24eeea57"
        let url = URL(string: endpoint)
        print(endpoint)
        var request = URLRequest(url: url!)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        let session = URLSession.shared
        session.dataTask(with: request){(data,response,error) in
            if error == nil{
                if let dat = data{
                    if let data = self.Jsondecoder(dat){
                        completion(data)
                    }
                }
            }
            else{
                completion(nil)
            }
        }.resume()
    }
    func ispaid() -> Int{
        if (UIApplication.shared.delegate as! AppDelegate).ispaid == true{
            return 30
        }
        else{
            return 10
        }
    }
    
    func Jsondecoder(_ data: Data) -> menuItems?{
        var decodedData: menuItems
        do{
            decodedData =  try JSONDecoder().decode(menuItems.self, from: data)
            return decodedData
        }catch{
            print("failed to decode data")
            return nil
        }
    }
    func Jsondecoder2(_ data: Data) -> productinfo?{
        var decodedData: productinfo
        do{
            decodedData =  try JSONDecoder().decode(productinfo.self, from: data)
            return decodedData
        }catch{
            print("failed to decode data")
            return nil
        }
    }
    
    func fetchimage(_ immgeurl: String, completion: @escaping (UIImage?) -> Void) {
        let endpoint = immgeurl
        let url = URL(string: endpoint)
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: url!){(data,response,error) in
            guard let dat = data,(response as! HTTPURLResponse).statusCode == 200, error == nil else {return}
            completion(UIImage(data: dat))
        }.resume()
    }
    
    func getProductDetails(_ productid: UInt, completion: @escaping (productinfo?) -> Void){
        let endpoint = "https://api.spoonacular.com/food/products/\(productid)?apiKey=7321ce3230f844b987ef68de24eeea57"
        let url = URL(string: endpoint)
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        URLSession.shared.dataTask(with: url!){(data,response,error) in
            guard let dat = data, error == nil else {return}
            completion(self.Jsondecoder2(dat))
        }.resume()
    }
    
}
