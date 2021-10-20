//
//  recipeViewController.swift
//  Hydrate
//
//  Created by user on 06/05/2020.
//  Copyright © 2021 swift tech. All rights reserved.
//

import UIKit

class recipeViewController: UIViewController {
    let recipeview = recipeView()
    var productid: UInt
    var results: productinfo?
    let emptyLabel = UILabel()
    init(_ productid: UInt) {
        self.productid = productid
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(recipeview)
        recipeview.frame = view.frame
        recipeview.tableview.register(UITableViewCell.self, forCellReuseIdentifier: "recipecells")
        emptyLabel.attributedText = NSAttributedString(string: "couldn't fetch the details of the selected product", attributes: [.font:UIFont(name: "Arial Italic", size: 20)])
        emptyLabel.textAlignment = .center
        loadData()
    }
    func loadData(){
        recipefunctions.shared.getProductDetails(productid) { [weak self] result in
            print("\(self!.productid)")
            if let res = result{
                DispatchQueue.main.async {
                    self!.results = res
                    self!.recipeview.tableview.delegate = self
                    self!.recipeview.tableview.dataSource = self
                    self!.recipeview.caloriesLabel2.text = "\(res.calories)KCal"
                    self?.recipeview.fatLabel.text = String(res.fatpercent) + "% " + res.fat
                    self?.recipeview.proteinLabel.text = String(res.proteinpercent) + "% " + res.protein
                    self?.recipeview.carbsLabel.text = String(res.carbspercent)  + "% " + res.carbs
                    self?.recipeview.tableview.reloadData()
                }
            }
            else{
                let alert = UIAlertController(title: "Error", message: "couldn't fetch the details of the selected product", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {[weak self] _ in
                    alert.dismiss(animated: true) {
                        DispatchQueue.main.async {
                            self!.emptyLabel.frame = self!.view.frame
                            self?.recipeview.tableview.isHidden = true
                        }
                       
                    }
                }))
                DispatchQueue.main.async {
                    self!.present(alert, animated: true, completion: nil)
                }
            }
        }

    }
}
extension recipeViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Int(results?.ingredientcount ?? 0)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = recipeview.tableview.dequeueReusableCell(withIdentifier: "recipecells", for: indexPath)
        cell.textLabel?.attributedText = NSAttributedString(string: (results?.ingredient[indexPath.row].name)!, attributes: [.font:UIFont(name: "Arial", size: 14)])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if results?.ingredient[indexPath.row].description == nil{
            let alert = UIAlertController(title: "Info", message: "No description provided", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
        }else {
            tableView.deselectRow(at: indexPath, animated: true)
            let alert = UIAlertController(title: "Info", message: "\(results?.ingredient[indexPath.row].description))", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
        }
       
    }
    
    
}
