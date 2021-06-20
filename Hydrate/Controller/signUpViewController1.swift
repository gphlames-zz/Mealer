//
//  signUpViewController.swift
//  Hydrate
//
//  Created by user on 06/05/2020.
//  Copyright © 2021 swift tech. All rights reserved.
//

import UIKit
import CoreData
class signUpViewController1: UIViewController {
    var customerpriorities = CustomerChoices().choices
    let signUpView = signUpView1()
    var customerdetails = CustomerDetail()
    let keys = Array(CustomerChoices().choices.keys)
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        let guide = view.safeAreaLayoutGuide
        self.view.backgroundColor = .white
        view.addSubview(signUpView.mainview)
        NSLayoutConstraint(item: signUpView.mainview, attribute: .height, relatedBy: .equal, toItem: view, attribute: .height, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item:signUpView.mainview, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 1, constant: 0).isActive = true
        signUpView.mainview.topAnchor.constraint(equalTo: guide.topAnchor, constant: 1).isActive = true
        signUpView.backButton.addTarget(self, action: #selector(dismissview), for: .touchUpInside)
        signUpView.continueButton.addTarget(self, action: #selector(storeProperties), for: .touchUpInside)
        signUpView.setUpViewContraints()
        signUpView.collection.delegate = self
        signUpView.collection.dataSource = self
        signUpView.collection.register(CollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        signUpView.collection.reloadData()
    }
   
    @objc func dismissview(){
        dismiss(animated: true, completion: nil)
    }
    @objc func storeProperties(){
        
        let secondsignupview = signUpViewController2()
        secondsignupview.customerSelectedPriorities = customerpriorities
        let navigation = UINavigationController(rootViewController: secondsignupview)
        navigation.modalPresentationStyle = .fullScreen
        present(navigation, animated: true, completion: nil)
    }
}
extension signUpViewController1:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return customerpriorities.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        cell.imageview = UIImageView(image: UIImage(named: "\(keys[indexPath.row])"))
        let attributes: [NSAttributedString.Key: Any] = [.font: UIFont(name: "Arial", size: 12)]
        cell.label.attributedText = NSAttributedString(string: keys[indexPath.row], attributes: attributes)
        cell.contentView.layer.cornerRadius = 10
        cell.contentView.backgroundColor = UIColor(named: "white smoke")
        cell.setUpviews()
        signUpView.mainview.bringSubviewToFront(cell)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 80)
    }
//    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
//        let cell = collectionView.cellForItem(at: indexPath) as! CollectionViewCell
//        cell.layer.borderWidth = 0
//    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! CollectionViewCell
        if customerpriorities[cell.label.text!] == false{
            customerpriorities[cell.label.text!] = true
            cell.layer.borderWidth = 0.3
            cell.layer.borderColor = CGColor(red: 0, green: 1.0, blue: 0, alpha: 1.0)
            cell.label.textColor = UIColor(cgColor: CGColor(red: 0, green: 1.0, blue: 0, alpha: 1.0))
            cell.imageview.image = UIImage(named: "\(cell.label.text! + ".green")")
        }
        else{
            customerpriorities[cell.label.text!] = false
                cell.layer.borderWidth = 0
                cell.label.textColor = UIColor(cgColor: CGColor(red: 0, green: 0, blue: 0, alpha: 1.0))
                cell.imageview.image = UIImage(named: "\(cell.label.text!)")
                cell.layer.borderWidth = 0
        }
        
    }
}
