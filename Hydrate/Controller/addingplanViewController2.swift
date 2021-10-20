//
//  addingplanViewController2.swift
//  Hydrate
//
//  Created by user on 06/05/2020.
//  Copyright © 2021 swift tech. All rights reserved.
//

import UIKit
import CoreData

class addingplanViewController2: UIViewController, UINavigationControllerDelegate {
    let addingplanview2 = addingPlanView2()
    var parentController: UINavigationController?
    var lunch: Bool?
    var breakfast: Bool?
    var dinner: Bool?
    var others: Bool?
    var cookware: [String] = []
    var ingredients: [String] = []
    var steps: [String] = []
    var indexof: Int = 0
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let appdelegate = UIApplication.shared.delegate as! AppDelegate
    var nsobject: NSManagedObjectID?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false
        view.addSubview(addingplanview2)
        view.backgroundColor = UIColor(named: "Ceramic white")
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 40))
        button.backgroundColor = UIColor(named: "firstshade")
        button.setAttributedTitle(NSAttributedString(string: "Done", attributes: [.font:UIFont(name: "Arial", size: 14)]), for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        addingplanview2.datepicker.frame = CGRect(x: 0, y: 0, width: 100, height: 40)
        let barbutton = UIBarButtonItem(customView: button)
        let barbutton2 = UIBarButtonItem(customView: addingplanview2.datepicker)
        navigationItem.rightBarButtonItem = barbutton
        navigationItem.leftBarButtonItem = barbutton2
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: [], metrics: nil, views: ["v0":addingplanview2]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]", options: [], metrics: nil, views: ["v0":addingplanview2]))
        let gesture = UITapGestureRecognizer(target: self, action: #selector(imagepresenter))
        addingplanview2.caloriesTextField.delegate = self
        button.addTarget(self, action: #selector(donebuttonpressed(_:)), for: .touchUpInside)
        addingplanview2.imageView.addGestureRecognizer(gesture)
        addingplanview2.datepicker.date = appdelegate.plans[indexof].date! // 1
        addingplanview2.scrollView.isScrollEnabled = true
        addingplanview2.ingredientsAddButton.addTarget(self, action: #selector(addButtonPressed(_:)), for: .touchUpInside)
        addingplanview2.cookwareAddButton.addTarget(self, action: #selector(addButtonPressed(_:)), for: .touchUpInside)
        addingplanview2.stepsAddButton.addTarget(self, action: #selector(addButtonPressed(_:)), for: .touchUpInside)
        addingplanview2.ingredientsTableView.delegate = self
        addingplanview2.ingredientsTableView.dataSource = self
        addingplanview2.ingredientsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        addingplanview2.cookwareTableView.delegate = self
        addingplanview2.cookwareTableView.dataSource = self
        addingplanview2.cookwareTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        addingplanview2.stepsTableView.delegate = self
        addingplanview2.stepsTableView.dataSource = self
        addingplanview2.stepsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        navigationController?.presentationController?.delegate = self
        navigationController?.navigationBar.backgroundColor = .clear
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        var h: CGFloat = 0
        for i in addingplanview2.mainview.subviews{
            h += i.frame.height
        }
        addingplanview2.scrollView.contentSize = addingplanview2.frame.size
        addingplanview2.scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: addingplanview2.mainview.frame.height - view.frame.height, right: 0)
    }
    @objc func addButtonPressed(_ sender: UIButton){
        if sender == addingplanview2.ingredientsAddButton{
            reloadingTableview(addingplanview2.ingredientsTableView,&ingredients)
        }else if sender == addingplanview2.cookwareAddButton{
            reloadingTableview(addingplanview2.cookwareTableView, &cookware)
        }else if sender == addingplanview2.stepsAddButton{
            reloadingTableview(addingplanview2.stepsTableView, &steps)
        }
    }
    func reloadingTableview(_ tableview: UITableView, _ source: UnsafeMutablePointer<[String]>){
        
        let alertController = UIAlertController(title: "Add item", message: "Add item to selected field", preferredStyle: .alert)
        alertController.addTextField { _ in
           
        }
        alertController.addAction(UIAlertAction(title: "Add", style: .default, handler: {[unowned self] _ in
            alertController.dismiss(animated: true) {
                source.pointee.append(alertController.textFields?[0].text ?? "")
                tableview.reloadData()
            }
        }))
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    @objc func imagepresenter(){
        let imagecontrol = UIImagePickerController()
        let alertcontrol = UIAlertController(title: "Photo Source", message: "Choose Source", preferredStyle: .alert)
        alertcontrol.addAction(UIAlertAction(title: "Camera", style: .default, handler: {[unowned self] _ in
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                imagecontrol.sourceType = .camera
                self.present(imagecontrol, animated: true, completion: nil)
            }
        }))
        alertcontrol.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: {[unowned self] _ in
            imagecontrol.sourceType = .photoLibrary
            self.present(imagecontrol, animated: true, completion: nil)
        }))
        alertcontrol.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in
            alertcontrol.dismiss(animated: true, completion: nil)
        }))
        imagecontrol.delegate = self
        present(alertcontrol, animated: true, completion: nil)
    }
    @objc func donebuttonpressed(_ sender: UIButton){
            
        let alertcontroller = UIAlertController(title: "Mealer", message: "Enter name of meal", preferredStyle: .alert)
        alertcontroller.addTextField(configurationHandler: nil)
        alertcontroller.addAction(UIAlertAction(title: "Ok", style: .default, handler: { [weak self] _ in
            if alertcontroller.textFields![0].text == ""{
                let alertcontrol = UIAlertController(title: "Error", message: "name texfield cannot be empty", preferredStyle: .alert)
                alertcontrol.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self?.present(alertcontrol, animated: true, completion: nil)
            }
            else {
                if self?.lunch == true {
                do{
                    let object =  try self?.appdelegate.persistentContainer.viewContext.existingObject(with: (self?.nsobject)!) as! Lunch
                    DispatchQueue.global(qos: .userInitiated).async {
                        object.cookware = self?.cookware.map{ $0.copy() as! String}
                        object.ingredients = self?.ingredients.map{ $0.copy() as! String}
                        object.steps = self?.steps.map{ $0.copy() as! String}
                        self?.appdelegate.plans[self!.indexof].lunchrelationship = object
                        DispatchQueue.main.async {
                            if self?.addingplanview2.imageView.image == nil{
                                object.mealimage = UIImage(named: "image placeholder")?.pngData()
                            }
                            else {
                                object.mealimage = Data()
                                object.mealimage?.append((self?.addingplanview2.imageView.image?.pngData())!)
                                }
                            object.nameoflunch = alertcontroller.textFields![0].text!.copy() as? String
                            object.timeOfDay = Date(timeIntervalSince1970: (self?.addingplanview2.datepicker.date.timeIntervalSince1970)!)
                            for i in self!.parentController!.viewControllers{
                                if i is addingViewController{
                                    let ic = i as! addingViewController
                                    ic.loadData()
                                    self?.dismiss(animated: true, completion: nil)
                                }
                            }
                        }
                    }
                }
                catch {
                    
                }
            }
                else if self?.breakfast == true {
                do{
                    let object = try self?.appdelegate.persistentContainer.viewContext.existingObject(with: self!.nsobject!) as! Breakfast
                    DispatchQueue.global(qos: .userInitiated).async {
                        object.cookware = self?.cookware.map{ $0.copy() as! String}
                        object.ingredients = self?.ingredients.map{ $0.copy() as! String}
                        object.steps = self?.cookware.map{ $0.copy() as! String}
                        self?.appdelegate.plans[self!.indexof].breakFastrelationship = object
                        DispatchQueue.main.sync {
                            if self?.addingplanview2.imageView.image == nil{
                                object.mealimage = UIImage(named: "image placeholder")?.pngData()
                            }
                            else {
                                object.mealimage = Data()
                                object.mealimage?.append((self?.addingplanview2.imageView.image?.pngData())!)
                            }
                            object.nameofbreakfast = alertcontroller.textFields![0].text!.copy() as? String
                            object.timeOfDay = Date(timeIntervalSince1970: (self?.addingplanview2.datepicker.date.timeIntervalSince1970)!)
                            for i in self!.parentController!.viewControllers{
                                if i is addingViewController{
                                    let ic = i as! addingViewController
                                    ic.loadData()
                                    self?.dismiss(animated: true, completion: nil)
                                }
                            }
                        }
                    }
                }
                catch{
                    
                }
                    
            }
                else if self?.dinner == true{
                do{
                    let object = try self?.appdelegate.persistentContainer.viewContext.existingObject(with: self!.nsobject!) as! Dinner
                    DispatchQueue.global(qos: .userInitiated).async {
                        object.cookware = self?.cookware.map{ $0.copy() as! String}
                        object.ingredients = self?.ingredients.map{ $0.copy() as! String}
                        object.steps = self?.cookware.map{ $0.copy() as! String}
                        self?.appdelegate.plans[self!.indexof].dinnerRelationship = object
                        DispatchQueue.main.async {
                            if self?.addingplanview2.imageView.image == nil{
                                object.mealimage = UIImage(named: "image placeholder")?.pngData()
                            }
                            else {
                                object.mealimage = Data()
                                object.mealimage?.append((self?.addingplanview2.imageView.image?.pngData())!)
                            }
                            object.nameofdinner = alertcontroller.textFields![0].text!.copy() as? String
                            object.timeOfDay = Date(timeIntervalSince1970: (self?.addingplanview2.datepicker.date.timeIntervalSince1970)!)
                            for i in self!.parentController!.viewControllers{
                                if i is addingViewController{
                                    let ic = i as! addingViewController
                                    ic.loadData()
                                    self?.dismiss(animated: true, completion: nil)
                                }
                            }
                        }
                    }
                }
                catch{
                    
                }
            }
                else if self?.others == true{
                
                do {
                    let object = try self?.appdelegate.persistentContainer.viewContext.existingObject(with: self!.nsobject!) as! Others
                    DispatchQueue.global(qos: .userInitiated).async {
                        object.cookware = self?.cookware.map{ $0.copy() as! String}
                        object.ingredients = self?.ingredients.map{ $0.copy() as! String}
                        object.steps = self?.cookware.map{ $0.copy() as! String}
                        self?.appdelegate.plans[self!.indexof].addToOtherRelationship(object)
                        DispatchQueue.main.async {
                            if self?.addingplanview2.imageView.image == nil{
                                object.mealimage = UIImage(named: "image placeholder")?.pngData()
                            }
                            else {
                                object.mealimage = Data()
                                object.mealimage?.append((self?.addingplanview2.imageView.image?.pngData())!)
                            }
                            object.nameofmeal = alertcontroller.textFields![0].text!.copy() as? String
                            object.timeOfDay = Date(timeIntervalSince1970: (self?.addingplanview2.datepicker.date.timeIntervalSince1970)!)
                            for i in self!.parentController!.viewControllers{
                                if i is addingViewController{
                                    let ic = i as! addingViewController
                                    ic.loadData()
                                    self?.dismiss(animated: true, completion: nil)
                                }
                            }
                        }
                    }
                }
                catch {
                    
                }
            }
            }
        }))
            alertcontroller.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            present(alertcontroller, animated: true, completion: nil)
        }
    func copyData(_ objectData: UnsafeMutableRawBufferPointer, _ dataToCopy: UnsafeMutableRawBufferPointer){
        objectData.copyBytes(from: dataToCopy)
    }
}
extension addingplanViewController2: UITextFieldDelegate{
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
}
extension addingplanViewController2: UIImagePickerControllerDelegate{
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        addingplanview2.imageView.image = UIImage(data: ((info[UIImagePickerController.InfoKey.originalImage] as? UIImage)?.jpegData(compressionQuality: 0.5))!) 
        picker.dismiss(animated: true, completion: nil)
    }
}

extension addingplanViewController2: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == addingplanview2.ingredientsTableView{
            if ingredients.count == 0{
                return 1
            }else{
                return ingredients.count
            }
        }
        else if tableView == addingplanview2.cookwareTableView{
            if cookware.count == 0{
                return 1
            }else{
                return cookware.count
            }
        }
        else if tableView == addingplanview2.stepsTableView{
            if steps.count == 0{
                return 1
            }else{
                return steps.count
            }
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if tableView == addingplanview2.ingredientsTableView{
            if ingredients.count == 0{
                cell.textLabel?.attributedText = NSAttributedString(string: "Ingredients list is empty", attributes: [.font:UIFont(name: "Arial", size: 14)])
            }else{
                cell.textLabel?.attributedText = NSAttributedString(string: "\(ingredients[indexPath.row])", attributes: [.font: UIFont(name: "Arial", size: 14)])
            }
        }
        else if tableView == addingplanview2.cookwareTableView{
            if cookware.count == 0{
                cell.textLabel?.attributedText = NSAttributedString(string: "cookware list is empty", attributes: [.font:UIFont(name: "Arial", size: 14)])
            }else{
                cell.textLabel?.attributedText = NSAttributedString(string: "\(cookware[indexPath.row])", attributes: [.font: UIFont(name: "Arial", size: 14)])
            }
        }
        else if tableView == addingplanview2.stepsTableView{
            if steps.count == 0{
                cell.textLabel?.attributedText = NSAttributedString(string: "steps list is empty", attributes: [.font:UIFont(name: "Arial", size: 14)])
            }else{
                cell.textLabel?.attributedText = NSAttributedString(string: "\(steps[indexPath.row])", attributes: [.font: UIFont(name: "Arial", size: 14)])
            }
        }
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if tableView == addingplanview2.ingredientsTableView{
            if editingStyle == .delete{
                ingredients.remove(at: indexPath.row)
                tableView.reloadData()
            }
        }
        else if tableView == addingplanview2.cookwareTableView{
            if editingStyle == .delete{
                cookware.remove(at: indexPath.row)
                tableView.reloadData()
            }
        }
        else if tableView == addingplanview2.stepsTableView{
            if editingStyle == .delete{
                steps.remove(at: indexPath.row)
                tableView.reloadData()
            }
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
}

extension addingplanViewController2:UIAdaptivePresentationControllerDelegate{
    
    func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
        if breakfast == true{
            do{
                let object = try appdelegate.persistentContainer.viewContext.existingObject(with: nsobject!) as! Breakfast
                if  object.nameofbreakfast?.count == 0{
                    context.delete(object)
                }else{
                    
                }
            }catch{
               
            }
        }
        else if lunch == true{
            do{
                let object = try appdelegate.persistentContainer.viewContext.existingObject(with: nsobject!) as! Lunch
                if  object.nameoflunch?.count == 0{
                    context.delete(object)
                }else{
                    
                }
            }catch{
               
            }
        }
        else if dinner == true{
            do{
                let object = try appdelegate.persistentContainer.viewContext.existingObject(with: nsobject!) as! Dinner
                if  object.nameofdinner?.count == 0{
                    context.delete(object)
                }else{
                    
                }
            }catch{
               
            }
        }
        else if others == true{
            do{
                let object = try appdelegate.persistentContainer.viewContext.existingObject(with: nsobject!) as! Others
                if  object.nameofmeal?.count == 0{
                    context.delete(object)
                }else{
                    
                }
            }catch{
                
            }
            
        }
        else{
            
        }
        if  appdelegate.plans[indexof].breakFastrelationship == nil &&                         appdelegate.plans[indexof].lunchrelationship == nil &&                         appdelegate.plans[indexof].dinnerRelationship == nil &&                         appdelegate.plans[indexof].otherRelationship?.count == 0{
            context.delete(appdelegate.plans[indexof])
            appdelegate.plans.remove(at: indexof)
            for i in parentController!.viewControllers{
                if i is addingViewController{
                    let ic = i as! addingViewController
                    ic.dailyplandetails = nil
                    ic.loadData()
                    dismiss(animated: true, completion: nil)
                }
            }
        }
    }
}

