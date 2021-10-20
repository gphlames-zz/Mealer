////
////  addingViewController.swift
////  Hydrate
////
////  Created by user on 06/05/2020.
////  Copyright © 2020 swift tech. All rights reserved.
////
//
import UIKit
import FSCalendar
import CoreData

class addingViewController: UIViewController{
   let addingplanview = addingPlanView()
    let appdelegate = UIApplication.shared.delegate as! AppDelegate
    var dailyplandetails: DailyPlanDetails?
    override func viewDidLoad() {
        super.viewDidLoad()
        // MARK: - inintialization section
        let closeButton = UIButton()
        let viewButton = UIButton(frame: CGRect(x: 0, y: 0, width: 80, height: 30))
        let leftbarbutton = UIBarButtonItem(customView: closeButton)
        let rightbarbutton = UIBarButtonItem(customView: viewButton)
        // MARK: - adding subviews section
        view.addSubview(addingplanview)
        // MARK: - contraints section
        NSLayoutConstraint(item: addingplanview, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: addingplanview, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: addingplanview, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: 0).isActive = true
        //addingplanview.scrollView.topAnchor.constraint(equalTo: guides.topAnchor).isActive = true
        addingplanview.scrollView.isScrollEnabled = true
        // MARK: - other section
        viewButton.setAttributedTitle(NSAttributedString(string: "view plans", attributes: [.font:UIFont(name: "Arial", size: 14)]), for: .normal)
        viewButton.backgroundColor = UIColor(named: "firstshade")
        viewButton.addTarget(self, action: #selector(viewplans), for: .touchUpInside)
        viewButton.setTitleColor(.white, for: .normal)
        addingplanview.scrollView.showsVerticalScrollIndicator = false
        closeButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        closeButton.addTarget(self, action: #selector(exitfunc), for: .touchUpInside)
        navigationItem.leftBarButtonItem = leftbarbutton
        navigationItem.rightBarButtonItem = rightbarbutton
        addingplanview.breakFastTableView.delegate = self
        addingplanview.lunchTableView.delegate = self
        addingplanview.dinnerTableView.delegate = self
        addingplanview.othersTableView.delegate = self
        addingplanview.breakFastTableView.dataSource = self
        addingplanview.lunchTableView.dataSource = self
        addingplanview.dinnerTableView.dataSource = self
        addingplanview.othersTableView.dataSource = self
        addingplanview.calendar.delegate = self
        addingplanview.calendar.dataSource = self
        addingplanview.scrollView.delegate = self
        addingplanview.breakFastTableView.register(planandmealTableViewCell.self, forCellReuseIdentifier: "breakfastcell")
        addingplanview.lunchTableView.register(planandmealTableViewCell.self, forCellReuseIdentifier: "lunchcell")
        addingplanview.dinnerTableView.register(planandmealTableViewCell.self, forCellReuseIdentifier: "dinnercell")
        addingplanview.othersTableView.register(planandmealTableViewCell.self, forCellReuseIdentifier: "otherscell")
        addingplanview.breakfastAddButton.addTarget(self, action: #selector(addplan), for: .touchUpInside)
        addingplanview.lunchAddButton.addTarget(self, action: #selector(addplan), for: .touchUpInside)
        addingplanview.dinnerAddButton.addTarget(self, action: #selector(addplan), for: .touchUpInside)
        addingplanview.othersAddButton.addTarget(self, action: #selector(addplan), for: .touchUpInside)
        addingplanview.saveButton.addTarget(self, action: #selector(saveFunction), for: .touchUpInside)
        addingplanview.collectionview.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "collectioncell")
        addingplanview.collectionview.delegate = self
        addingplanview.collectionview.dataSource = self
        viewButton.backgroundColor = .white
        viewButton.setTitleColor(.blue, for: .normal)
        viewButton.layer.cornerRadius = 8
    }
    override func viewWillAppear(_ animated: Bool) {
        loadData()
    }
    override func viewDidLayoutSubviews() {
        addingplanview.scrollView.contentSize = addingplanview.frame.size
        addingplanview.scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: addingplanview.frame.height - UIScreen.main.bounds.height, right: 0)
    }
    override func didReceiveMemoryWarning() {
        let alertcontroller = UIAlertController(title: "Warning", message: "you have used up a lot of memory and we advice you immediately save your plan so far to avoid losing your progress", preferredStyle: .alert)
        alertcontroller.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertcontroller, animated: true, completion: nil)
    }
    func loadData(){
        if !appdelegate.plans.isEmpty{
            if addingplanview.calendar.selectedDate != nil{
                let calendar = Calendar(identifier: .gregorian)
                let firstcalendarcomponents = calendar.dateComponents([.day,.month], from: addingplanview.calendar.selectedDate!)
                for i in appdelegate.plans{
                    let calendar2 = Calendar(identifier: .gregorian)
                    let secondcalendarcomponents = calendar2.dateComponents([.day,.month], from: i.date!)
                    if firstcalendarcomponents == secondcalendarcomponents{
                        dailyplandetails = i
                    }else{
                        
                    }
                }
            }else{
                dailyplandetails = appdelegate.plans.last
            }
        }
        else{
            
        }
        addingplanview.breakFastTableView.reloadData()
        addingplanview.lunchTableView.reloadData()
        addingplanview.dinnerTableView.reloadData()
        addingplanview.othersTableView.reloadData()
        addingplanview.collectionview.reloadData()
    }
    @objc func viewplans(){
        if appdelegate.plans.count == 0{
            let alertcontroller = UIAlertController(title: "Error", message: "there are no mealants to display", preferredStyle: .alert)
            alertcontroller.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            present(alertcontroller, animated: true, completion: nil)
        }else{
            let nextview = addingplanTableViewController()
            nextview.presentingController = navigationController
            navigationController?.present(nextview, animated: true, completion: nil)
        }
    }
    @objc func saveFunction(){
        for i in appdelegate.plans{
            if i.breakFastrelationship == nil && i.lunchrelationship == nil && i.dinnerRelationship == nil && i.otherRelationship?.count == 0{
                appdelegate.persistentContainer.viewContext.delete(i)
            }
        }
            do{
                if appdelegate.plans.count == 0{
                    try appdelegate.persistentContainer.viewContext.save()
                }
            }catch{
                let alertcontroller = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                alertcontroller.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                present(alertcontroller, animated: true, completion: nil)
            }
    }
    @objc func exitfunc(){
        appdelegate.persistentContainer.viewContext.reset()
        appdelegate.plans.removeAll()
        navigationController?.popViewController(animated: true)
    }
    @objc func addplan(_ sender: UIButton){
        if let daily = dailyplandetails{
            print("Entered the daily block")
            let nextview = addingplanViewController2()
            let nav = UINavigationController(rootViewController: nextview)
                if sender == addingplanview.breakfastAddButton{
                    nextview.breakfast = true
                    if daily.breakFastrelationship == nil{
                        let index = appdelegate.plans.firstIndex(of: daily)
                        nextview.indexof = index!
                        let breakfast = appdelegate.createBreakfast()
                        nextview.nsobject = breakfast.objectID
                        nextview.modalPresentationStyle = .popover
                        nextview.parentController = navigationController
                        present(nav, animated: true, completion: nil)
                    }else{
                        let alertcontroller = UIAlertController(title: "Not allowed", message: "only one breakfast mealant is allowed per day please delete mealant already present", preferredStyle: .alert)
                        alertcontroller.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                        present(alertcontroller, animated: true, completion: nil)
                    }
                }
                else if sender == addingplanview.lunchAddButton{
                    nextview.lunch = true
                    if daily.lunchrelationship == nil{
                        let index = appdelegate.plans.firstIndex(of: daily)
                        nextview.indexof = index!
                        let lunch = appdelegate.createLunch()
                        nextview.nsobject = lunch.objectID
                        nextview.modalPresentationStyle = .popover
                        nextview.parentController = navigationController
                        present(nav, animated: true, completion: nil)
                    }else{
                        let alertcontroller = UIAlertController(title: "Not allowed", message: "only one lunch mealant is allowed per day please delete mealant already present", preferredStyle: .alert)
                        alertcontroller.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                        present(alertcontroller, animated: true, completion: nil)
                    }
                }
                else if sender == addingplanview.dinnerAddButton{
                    nextview.dinner = true
                    if daily.dinnerRelationship == nil{
                        let index = appdelegate.plans.firstIndex(of: daily)
                        nextview.indexof = index!
                        let dinner = appdelegate.createDinner()
                        nextview.nsobject = dinner.objectID
                        nextview.modalPresentationStyle = .popover
                        nextview.parentController = navigationController
                        present(nav, animated: true, completion: nil)
                    }else{
                        let alertcontroller = UIAlertController(title: "Not allowed", message: "only one dinner mealant is allowed per day please delete mealant already present", preferredStyle: .alert)
                        alertcontroller.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                        present(alertcontroller, animated: true, completion: nil)
                    }
                }
                else if sender == addingplanview.othersAddButton{
                    let index = appdelegate.plans.firstIndex(of: daily)
                    nextview.indexof = index!
                    nextview.others = true
                    let others = appdelegate.createOthers()
                    nextview.nsobject = others.objectID
                    nextview.modalPresentationStyle = .popover
                    nextview.parentController = navigationController
                    present(nav, animated: true, completion: nil)
                }
                else{
                    
                }
        }else{
            let nextview = addingplanViewController2()
            let nav = UINavigationController(rootViewController: nextview)
            appdelegate.createDailyplandeatails()
            dailyplandetails = appdelegate.plans.last 
            if addingplanview.calendar.selectedDate != nil{
                appdelegate.plans.last?.date = addingplanview.calendar.selectedDate
            }
            else{
                appdelegate.plans.last?.date = Date()
            }
            if sender == addingplanview.breakfastAddButton{
                nextview.breakfast = true
                nextview.indexof = appdelegate.plans.count - 1
                let breakfast = appdelegate.createBreakfast()
                nextview.nsobject = breakfast.objectID
                nextview.modalPresentationStyle = .popover
                nextview.parentController = navigationController
                present(nav, animated: true, completion: nil)
            }
            else if sender == addingplanview.lunchAddButton{
                nextview.lunch = true
                nextview.indexof = appdelegate.plans.count - 1
                let lunch = appdelegate.createLunch()
                nextview.nsobject = lunch.objectID
                nextview.modalPresentationStyle = .popover
                nextview.parentController = navigationController
                present(nav, animated: true, completion: nil)
            }
            else if sender == addingplanview.dinnerAddButton{
                nextview.dinner = true
                nextview.indexof = appdelegate.plans.count - 1
                let dinner = appdelegate.createDinner()
                nextview.nsobject = dinner.objectID
                nextview.modalPresentationStyle = .popover
                nextview.parentController = navigationController
                present(nav, animated: true, completion: nil)
            }
            else if sender == addingplanview.othersAddButton{
                nextview.indexof = appdelegate.plans.count - 1
                nextview.others = true
                let others = appdelegate.createOthers()
                nextview.nsobject = others.objectID
                nextview.modalPresentationStyle = .popover
                nextview.parentController = navigationController
                present(nav, animated: true, completion: nil)
            }
            else{
            }
        }
    }
}
extension addingViewController: UITableViewDelegate, UITableViewDataSource,FSCalendarDelegate,FSCalendarDataSource,UIScrollViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == addingplanview.breakFastTableView || tableView == addingplanview.lunchTableView || tableView == addingplanview.dinnerTableView {
            return 1
        }else{
            if dailyplandetails?.otherRelationship?.count == 0{
                return 1
            }else{
                return (dailyplandetails?.otherRelationship?.count) ?? 1
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: planandmealTableViewCell
        if dailyplandetails == nil{
            let cell = planandmealTableViewCell()
            if tableView == addingplanview.breakFastTableView{
                addingplanview.breakfastAddButton.tintColor = UIColor(named: "firstshade")
                addingplanview.breakfastAddButton.isUserInteractionEnabled = true
                cell.imageview.isHidden = true
                cell.stackview.isHidden = true
                return cell
            }
            else if tableView == addingplanview.lunchTableView{
                addingplanview.lunchAddButton.tintColor = UIColor(named: "firstshade")
                addingplanview.lunchAddButton.isUserInteractionEnabled = true
                cell.imageview.isHidden = true
                cell.stackview.isHidden = true
                return cell
            }
           else if tableView == addingplanview.dinnerTableView{
                addingplanview.dinnerAddButton.tintColor = UIColor(named: "firstshade")
                addingplanview.dinnerAddButton.isUserInteractionEnabled = true
                cell.imageview.isHidden = true
                cell.stackview.isHidden = true
                return cell
            }
           else if tableView == addingplanview.othersTableView{
                cell.imageview.isHidden = true
                cell.stackview.isHidden = true
                return cell
            }
        }else{
            if tableView == addingplanview.breakFastTableView && dailyplandetails?.breakFastrelationship == nil{
                cell = planandmealTableViewCell()
                addingplanview.breakfastAddButton.tintColor = UIColor(named: "firstshade")
                addingplanview.breakfastAddButton.isUserInteractionEnabled = true
                cell.imageview.isHidden = true
                cell.stackview.isHidden = true
                return cell
            }
            else if tableView == addingplanview.breakFastTableView && dailyplandetails?.breakFastrelationship != nil{
                cell = tableView.dequeueReusableCell(withIdentifier: "breakfastcell") as! planandmealTableViewCell
                cell.emptylabel.isHidden = true
                cell.imageview.isHidden = false
                cell.stackview.isHidden = false
                cell.imageView!.image = UIImage(data: (dailyplandetails?.breakFastrelationship!.mealimage)!)
                cell.nameLabel.attributedText = NSAttributedString(string: "\((dailyplandetails?.breakFastrelationship?.nameofbreakfast)!)", attributes: [.font:UIFont(name: "Arial", size: 14)])
                let dateformatter = DateFormatter()
                dateformatter.dateFormat = "h:mm a"
                cell.timeLabel.attributedText = NSAttributedString(string: "\(dateformatter.string(from: (dailyplandetails?.breakFastrelationship?.timeOfDay)!)) ", attributes: [.font:UIFont(name: "Arial", size: 14)])
                addingplanview.breakfastAddButton.tintColor = .lightGray
                addingplanview.breakfastAddButton.isUserInteractionEnabled = false
                return cell
            }
            else if tableView == addingplanview.lunchTableView && dailyplandetails?.lunchrelationship == nil{
                cell = planandmealTableViewCell()
                addingplanview.lunchAddButton.tintColor = UIColor(named: "firstshade")
                addingplanview.lunchAddButton.isUserInteractionEnabled = true
                cell.imageview.isHidden = true
                cell.stackview.isHidden = true
                return cell
            }
            else if tableView == addingplanview.lunchTableView && dailyplandetails?.lunchrelationship != nil{
                cell = tableView.dequeueReusableCell(withIdentifier: "lunchcell") as! planandmealTableViewCell
                cell.emptylabel.isHidden = true
                cell.imageview.isHidden = false
                cell.stackview.isHidden = false
                cell.imageView!.image = UIImage(data: (dailyplandetails?.lunchrelationship!.mealimage)!)
                cell.nameLabel.attributedText = NSAttributedString(string: "\((dailyplandetails?.lunchrelationship?.nameoflunch)!)", attributes: [.font:UIFont(name: "Arial", size: 14)])
                let dateformatter = DateFormatter()
                dateformatter.dateFormat = "h:mm a"
                cell.timeLabel.attributedText = NSAttributedString(string: "\(dateformatter.string(from: (dailyplandetails?.lunchrelationship?.timeOfDay)!)) ", attributes: [.font:UIFont(name: "Arial", size: 14)])
                addingplanview.lunchAddButton.tintColor = .lightGray
                addingplanview.lunchAddButton.isUserInteractionEnabled = false
                return cell
            }
            else if tableView == addingplanview.dinnerTableView && dailyplandetails?.dinnerRelationship == nil{
                cell =  planandmealTableViewCell()
                addingplanview.dinnerAddButton.tintColor = UIColor(named: "firstshade")
                addingplanview.dinnerAddButton.isUserInteractionEnabled = true
                cell.imageview.isHidden = true
                cell.stackview.isHidden = true
                return cell
            }
            else if tableView == addingplanview.dinnerTableView && dailyplandetails?.dinnerRelationship != nil{
                cell = tableView.dequeueReusableCell(withIdentifier: "dinnercell") as! planandmealTableViewCell
                cell.emptylabel.isHidden = true
                cell.imageview.isHidden = false
                cell.stackview.isHidden = false
                cell.imageView!.image = UIImage(data: (dailyplandetails?.dinnerRelationship!.mealimage)!)
                cell.nameLabel.attributedText = NSAttributedString(string: "\(dailyplandetails?.dinnerRelationship?.nameofdinner)", attributes: [.font:UIFont(name: "Arial", size: 14)])
                let dateformatter = DateFormatter()
                dateformatter.dateFormat = "h:mm a"
                cell.timeLabel.attributedText = NSAttributedString(string: "\(dateformatter.string(from: (dailyplandetails?.dinnerRelationship?.timeOfDay)!)) ", attributes: [.font:UIFont(name: "Arial", size: 14)])
                addingplanview.dinnerAddButton.tintColor = .lightGray
                addingplanview.dinnerAddButton.isUserInteractionEnabled = false
                return cell
            }
            else if tableView == addingplanview.othersTableView && dailyplandetails?.otherRelationship?.count == 0{
                cell = planandmealTableViewCell()
                addingplanview.othersAddButton.tintColor = UIColor(named: "firstshade")
                addingplanview.othersAddButton.isUserInteractionEnabled = true
                cell.imageview.isHidden = true
                cell.stackview.isHidden = true
                return cell
            }
            else if tableView == addingplanview.othersTableView && dailyplandetails?.otherRelationship?.count                                                     != 0{
                cell = tableView.dequeueReusableCell(withIdentifier: "otherscell") as! planandmealTableViewCell
                cell.emptylabel.isHidden = true
                cell.imageview.isHidden = false
                cell.stackview.isHidden = false
                cell.imageView!.image = UIImage(data: (dailyplandetails?.otherRelationship?.allObjects[indexPath.row] as! Others).mealimage!)
                cell.nameLabel.attributedText = NSAttributedString(string: "\((dailyplandetails?.otherRelationship?.allObjects[indexPath.row] as! Others).nameofmeal!)", attributes: [.font:UIFont(name: "Arial", size: 14)])
                let dateformatter = DateFormatter()
                dateformatter.dateFormat = "h:mm a"
                print((dailyplandetails?.otherRelationship?.allObjects[indexPath.row] as! Others).nameofmeal!)
                cell.timeLabel.attributedText = NSAttributedString(string: "\(dateformatter.string(from: (dailyplandetails?.otherRelationship?.allObjects[indexPath.row] as! Others).timeOfDay!)) ", attributes: [.font:UIFont(name: "Arial", size: 14)])
                return cell
            }else {
                
            }
        }
        let cells = UITableViewCell()
        return cells
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            if tableView == addingplanview.breakFastTableView{
                if dailyplandetails?.breakFastrelationship != nil{
                    appdelegate.persistentContainer.viewContext.delete((dailyplandetails?.breakFastrelationship)!)
                    tableView.reloadData()
                }
            }
            else if tableView == addingplanview.lunchTableView{
                if dailyplandetails?.lunchrelationship != nil{
                    appdelegate.persistentContainer.viewContext.delete((dailyplandetails?.lunchrelationship)!)
                    tableView.reloadData()
                }
            }
            else if tableView == addingplanview.dinnerTableView{
                if dailyplandetails?.dinnerRelationship != nil{
                    appdelegate.persistentContainer.viewContext.delete((dailyplandetails?.dinnerRelationship)!)
                    tableView.reloadData()
                }
            }
            else if tableView == addingplanview.othersTableView{
                if dailyplandetails?.otherRelationship?.count != 0{
                    appdelegate.persistentContainer.viewContext.delete((dailyplandetails?.otherRelationship?.allObjects[indexPath.row]) as! Others)
                    tableView.reloadData()
                }
            }
        }
    }
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        for i in appdelegate.plans{
                let clen = Calendar(identifier: .gregorian)
            let components = clen.dateComponents([.day,.month,.year], from: i.date!)
                let components2 = clen.dateComponents([.day,.month,.year], from: date)
                if components == components2{
                    dailyplandetails = i
                    break
                }
                else{
                    dailyplandetails = nil
                }
        }
        addingplanview.breakFastTableView.reloadData()
        addingplanview.lunchTableView.reloadData()
        addingplanview.dinnerTableView.reloadData()
        addingplanview.othersTableView.reloadData()
    }
}

extension addingViewController:UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if appdelegate.plans.count == 0{
            return 0
        }else{
            return appdelegate.plans.count
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectioncell", for: indexPath)
        addingplanview.emptylabel.isHidden = true
        setcollectionviewcelllayout(cell, indexPath)
        cell.layer.cornerRadius = 20
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 80)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    func setcollectionviewcelllayout(_ cell: UICollectionViewCell, _ indexPath: IndexPath){
        let imageview = UIImageView()
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.contentMode = .scaleAspectFill
        imageview.clipsToBounds = true
        if appdelegate.plans[indexPath.section].breakFastrelationship ==  nil && appdelegate.plans[indexPath.section].lunchrelationship ==  nil && appdelegate.plans[indexPath.section].dinnerRelationship ==  nil && appdelegate.plans[indexPath.section].otherRelationship?.count ==  0{
            imageview.image = UIImage(named: "image placeholder")
        }
        else if appdelegate.plans[indexPath.section].breakFastrelationship !=  nil &&  !(appdelegate.plans[indexPath.section].breakFastrelationship?.mealimage?.isEmpty ?? true) {
            imageview.image = UIImage(data: appdelegate.plans[indexPath.section].breakFastrelationship!.mealimage!)
        }
        else if appdelegate.plans[indexPath.section].lunchrelationship !=  nil && !(appdelegate.plans[indexPath.section].lunchrelationship?.mealimage?.isEmpty ?? true) {
            imageview.image = UIImage(data: appdelegate.plans[indexPath.section].lunchrelationship!.mealimage!)
        }
        else if appdelegate.plans[indexPath.section].dinnerRelationship !=  nil && !(appdelegate.plans[indexPath.section].dinnerRelationship?.mealimage?.isEmpty ?? true){
            imageview.image = UIImage(data: appdelegate.plans[indexPath.section].dinnerRelationship!.mealimage!)
        }
        else if appdelegate.plans[indexPath.section].otherRelationship?.count !=  0 {
            for i in appdelegate.plans[indexPath.section].otherRelationship!.allObjects as! [Others]{
                if !(i.mealimage?.isEmpty ?? true){
                    imageview.image = UIImage(data: i.mealimage!)
                    break
                }
            }
            if imageview.image == nil{
                imageview.image = UIImage(named: "image placeholder")
            }
        }
        else{
            imageview.image = UIImage(named: "image placeholder")
        }
        let label1 = UILabel()
        label1.backgroundColor = .clear
        label1.textColor = .white
        label1.translatesAutoresizingMaskIntoConstraints = false
        cell.contentView.addSubview(label1)
        cell.contentView.addSubview(imageview)
        cell.contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":imageview]))
        cell.contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: [], metrics: nil, views: ["v0":imageview]))
        cell.contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: [], metrics: nil, views: ["v0":label1]))
        cell.contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0(30)]|", options: [], metrics: nil, views: ["v0":label1]))
        cell.contentView.bringSubviewToFront(label1)
        let calender = Calendar(identifier: .gregorian)
        let components = calender.dateComponents([.day,.month], from: appdelegate.plans[indexPath.section].date!)
        label1.attributedText = NSAttributedString(string: "\(components.day!)" + " " + DataOfApp.monthreturn(components.month!), attributes: [.font:UIFont(name: "Arial", size: 16)])
        label1.textAlignment = .center
        imageview.layer.cornerRadius = 20
        label1.layer.cornerRadius = 20
    }
    
    
}

