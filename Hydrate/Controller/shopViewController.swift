//
//  shopViewController.swift
//  Hydrate
//
//  Created by user on 06/05/2020.
//  Copyright © 2021 swift tech. All rights reserved.
//

import UIKit

class shopViewController: UIViewController {
 let shopview = shopView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(shopview.mainView)
        let guides = view.safeAreaLayoutGuide
        NSLayoutConstraint(item: shopview.mainView, attribute: .height, relatedBy: .equal, toItem: view, attribute: .height, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: shopview.mainView, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 1, constant: 0).isActive = true
        shopview.mainView.topAnchor.constraint(equalTo: guides.topAnchor).isActive = true
        shopview.mainView.bottomAnchor.constraint(equalTo: guides.bottomAnchor).isActive = true
        shopview.setUpConstraints()
        shopview.collectionView.delegate = self
        shopview.collectionView.dataSource = self
        shopview.collectionView.register(shopCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        
    }
}
extension shopViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! shopCollectionViewCell
        
        cell.setConstraints()
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 200)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(5)
    }
    
    
}
