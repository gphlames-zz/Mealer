//
//  recipeSearchViewController.swift
//  Hydrate
//
//  Created by user on 06/05/2020.
//  Copyright © 2021 swift tech. All rights reserved.
//

import UIKit

class recipeSearchViewController: UIViewController {
    let recipeview = recipesearchview()
    var source:[recipe] = []
    var cache = NSCache<NSString, UIImage>()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(recipeview)
        recipeview.frame = view.frame
        recipeview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        recipeview.tableView.delegate = self
        recipeview.tableView.dataSource = self
        recipeview.tableView.register(menuitemsTableViewCell.self, forCellReuseIdentifier: "menucells")
        title = "Foods"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if source.count == 0{
            loaddata()
        }
    }
    func fetchimages(){
        for c in source{
            DispatchQueue.global(qos: .userInteractive).async {
                recipefunctions.shared.fetchimage(c.image) { [weak self] image in
                    self!.cache.setObject(image!, forKey: c.image as NSString)
                    DispatchQueue.main.async {
                        self?.recipeview.tableView.reloadData()
                        }
                    }
                }
            }
    }
    func loaddata(){
        recipefunctions.shared.getrecipe { [weak self] menu in
            if let men = menu{
                self?.source = men.menuItems
                DispatchQueue.main.sync {
                    self?.recipeview.tableView.reloadData()
                    self?.fetchimages()
                }
            }
            else{
                let alert = UIAlertController(title: "Error", message: "There was an error fetching the required data please check your internet connection and try again", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                DispatchQueue.main.async {
                    self?.present(alert, animated: true, completion: nil)
                }
            }
            
        }
    }
    func loadimages(){
        
    }

}
extension recipeSearchViewController: UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return source.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 5
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = recipeview.tableView.dequeueReusableCell(withIdentifier: "menucells") as! menuitemsTableViewCell
        //print(source[indexPath.section].title)
        cell.title.text = source[indexPath.section].title
        if self.cache.object(forKey: self.source[indexPath.section].image as NSString) != nil{
            cell.imageview.image = self.cache.object(forKey: self.source[indexPath.section].image as NSString)! as UIImage
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextview = recipeparentdetailsViewController()
        nextview.image = self.cache.object(forKey: self.source[indexPath.section].image as NSString)! as UIImage
        nextview.productid = source[indexPath.section].id
        nextview.modalPresentationStyle = .fullScreen
        present(nextview, animated: true, completion: nil)
    }
}
