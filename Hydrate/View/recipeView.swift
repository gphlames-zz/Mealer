//
//  recipeView.swift
//  Hydrate
//
//  Created by user on 06/05/2020.
//  Copyright © 2021 swift tech. All rights reserved.
//

import UIKit

class recipeView: UIView {
    
    lazy var caloriesLabel2: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Arial Italic", size: 18)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    lazy var fatLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Arial", size: 14)
        label.textColor = .darkText
        return label
    }()
    lazy var proteinLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Arial", size: 14)
        label.textColor = .darkText
        return label
    }()
    lazy var carbsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Arial", size: 14)
        label.textColor = .darkText
        return label
    }()
    lazy var ingredients: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "Ingredients", attributes: [.font:UIFont(name: "Arial Bold", size: 22)])
        label.textColor = .black
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var tableview: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    override func layoutSubviews() {
        let caloriesStack = UIStackView()
        let fatStack = UIStackView()
        let proteinStack = UIStackView()
        let carbStack = UIStackView()
        let fatlabel2 = UILabel()
        let proteinlabel2 = UILabel()
        let carbsLabel2 = UILabel()
        let caloriesLabel = UILabel()
        caloriesStack.translatesAutoresizingMaskIntoConstraints = false
        fatStack.translatesAutoresizingMaskIntoConstraints = false
        proteinStack.translatesAutoresizingMaskIntoConstraints = false
        carbStack.translatesAutoresizingMaskIntoConstraints = false
        fatlabel2.translatesAutoresizingMaskIntoConstraints = false
        proteinlabel2.translatesAutoresizingMaskIntoConstraints = false
        carbsLabel2.translatesAutoresizingMaskIntoConstraints = false
        caloriesLabel.translatesAutoresizingMaskIntoConstraints = false
        addsubviews(addingview: caloriesStack, array: [caloriesLabel,caloriesLabel2])
        addsubviews(addingview: fatStack, array: [fatlabel2,fatLabel])
        addsubviews(addingview: proteinStack, array: [proteinlabel2,proteinLabel])
        addsubviews(addingview: carbStack, array: [carbsLabel2,carbsLabel])
        addsubviews(addingview: self, array: [caloriesStack,ingredients,fatStack,proteinStack,carbStack,tableview])
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-(10)-[v0(30)]-(5)-[v1(20)][v2(20)][v3(20)]-(10)-[v4(30)]-(10)-[v5]-(10)-|", options: [], metrics: nil, views: ["v0":caloriesStack,"v1":fatStack,"v2":proteinStack,"v3":carbStack,"v4":ingredients,"v5":tableview]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(10)-[v0]-(10)-|", options: [], metrics: nil, views: ["v0":caloriesStack]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(10)-[v0]-(10)-|", options: [], metrics: nil, views: ["v0":fatStack]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(10)-[v0]-(10)-|", options: [], metrics: nil, views: ["v0":proteinStack]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(10)-[v0]-(10)-|", options: [], metrics: nil, views: ["v0":carbStack]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(10)-[v0]-(10)-|", options: [], metrics: nil, views: ["v0":ingredients]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(10)-[v0]-(10)-|", options: [], metrics: nil, views: ["v0":tableview]))
        caloriesStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0(100)]-(5)-[v1]|", options: [], metrics: nil, views: ["v0":caloriesLabel,"v1":caloriesLabel2]))
        caloriesStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":caloriesLabel]))
        caloriesStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":caloriesLabel2]))
        fatStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0(80)]-(5)-[v1]|", options: [], metrics: nil, views: ["v0":fatlabel2,"v1":fatLabel]))
        fatStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":fatlabel2]))
        fatStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":fatLabel]))
        proteinStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0(80)]-(5)-[v1]|", options: [], metrics: nil, views: ["v0":proteinlabel2,"v1":proteinLabel]))
        proteinStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":proteinlabel2]))
        proteinStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":proteinLabel]))
        carbStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0(80)]-(5)-[v1]|", options: [], metrics: nil, views: ["v0":carbsLabel2,"v1":carbsLabel]))
        carbStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":carbsLabel2]))
        carbStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":carbsLabel]))
        fatlabel2.attributedText = NSAttributedString(string: "Fat: ", attributes: [.font:UIFont(name: "Arial Bold", size: 18)])
        proteinlabel2.attributedText = NSAttributedString(string: "Protein: ", attributes: [.font:UIFont(name: "Arial Bold", size: 18)])
        carbsLabel2.attributedText = NSAttributedString(string: "Carbs: ", attributes: [.font:UIFont(name: "Arial Bold", size: 18)])
        caloriesLabel.attributedText = NSAttributedString(string: "Calories: ", attributes: [.font:UIFont(name: "Arial Bold", size: 22)])
        caloriesLabel.textColor = .black
        fatlabel2.textColor = .black
        proteinlabel2.textColor = .black
        carbsLabel2.textColor = .black
        caloriesLabel.textAlignment = .left
        fatlabel2.textAlignment = .left
        proteinlabel2.textAlignment = .left
        carbsLabel2.textAlignment = .left
    }
    func addsubviews(addingview: UIView, array:[UIView]){
        for i in array{
            addingview.addSubview(i)
        }
    }
}
