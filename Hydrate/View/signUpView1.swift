//
//  signUpView.swift
//  Hydrate
//
//  Created by user on 06/05/2020.
//  Copyright © 2021 swift tech. All rights reserved.
//

import UIKit

class signUpView1: UIView {
    var backButton: UIButton = {
        let button = UIButton()
        if #available(iOS 13.0, *) {
            button.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        } else {
            button.setTitle("Back", for: .normal)
        }
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    let collection: UICollectionView = {
        let flowlayout = UICollectionViewFlowLayout()
        let collectionview = UICollectionView(frame: .zero, collectionViewLayout: flowlayout)
        collectionview.translatesAutoresizingMaskIntoConstraints = false
        collectionview.register(CollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionview.backgroundColor = UIColor(named: "Ceramic White")
        return collectionview
    }()
    var continueButton: UIButton = {
        let button = UIButton()
        button.setTitle("Continue", for: .normal)
        button.layer.cornerRadius = 5
        button.backgroundColor = UIColor(named: "firstshade")
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    var mainview: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "Ceramic white")
        return view
    }()
    func setUpViewContraints(){
        //MARK: - > initialization section
        let imageview = UIImageView(image: UIImage(named: "logo"))
        let parentStack = UIStackView()
        let logoStack = UIStackView()
        let label = UILabel()
        //MARK: - > setproperty section
        imageview.translatesAutoresizingMaskIntoConstraints = false
        parentStack.translatesAutoresizingMaskIntoConstraints = false
        logoStack.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        imageview.contentMode = .scaleAspectFit
        label.text = "Choose your goals, select all that apply"
        label.textAlignment = .center
        label.textColor = .gray
        continueButton.layer.cornerRadius = 8
        logoStack.addSubview(imageview)
        parentStack.addSubview(backButton)
        parentStack.addSubview(logoStack)
        parentStack.addSubview(label)
        parentStack.addSubview(collection)
        parentStack.addSubview(continueButton)
        mainview.addSubview(parentStack)
        //MARK: - > set constraints section
        mainview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: [], metrics: nil, views: ["v0":parentStack]))
        mainview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":parentStack]))
        logoStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[v0(50)]", options: [], metrics: nil, views: ["v0":imageview]))
        logoStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":imageview]))
        parentStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0(50)][v1(50)]-(5)-[v2(60)]-(10)-[v3(400)]-(10)-[v4(50)]", options: [], metrics: nil, views: ["v0":backButton,"v1":logoStack,"v2":label,"v3":collection,"v4":continueButton]))
        parentStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(2)-[v0(50)]", options: [], metrics: nil, views: ["v0":backButton]))
        parentStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: [], metrics: nil, views: ["v0":logoStack]))
        parentStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(20)-[v0]-(20)-|", options: [], metrics: nil, views: ["v0":label]))
        parentStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(15)-[v0]-(15)-|", options: [], metrics: nil, views: ["v0":collection]))
        parentStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(20)-[v0]-(20)-|", options: [], metrics: nil, views: ["v0":continueButton]))
        NSLayoutConstraint(item: imageview, attribute: .centerXWithinMargins, relatedBy: .equal, toItem: logoStack, attribute: .centerXWithinMargins, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: imageview, attribute: .centerYWithinMargins, relatedBy: .equal, toItem: logoStack, attribute: .centerYWithinMargins, multiplier: 1, constant: 0).isActive = true
    }
}
