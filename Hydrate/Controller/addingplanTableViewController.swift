//
//  addingplanTableViewController.swift
//  Hydrate
//
//  Created by user on 06/05/2020.
//  Copyright © 2021 swift tech. All rights reserved.
//

import UIKit
import CoreData

class addingplanTableViewController: UITableViewController {
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var appdelegate = UIApplication.shared.delegate as! AppDelegate
    var presentingController: UINavigationController?
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(addingplanTableViewCell.self, forCellReuseIdentifier: "cellers")
        tableView.estimatedSectionHeaderHeight = 10
        navigationController?.presentationController?.delegate = self
        
    }
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return appdelegate.plans.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellers", for: indexPath) as! addingplanTableViewCell
        let calender = Calendar(identifier: .gregorian)
        let components = calender.dateComponents([.day,.month], from: (appdelegate.plans[indexPath.section].date)!)
        cell.timelabel.attributedText = NSAttributedString(string:  "\(components.day!)"+" "+"\(DataOfApp.monthreturn(components.month!))", attributes: [.font:UIFont(name: "Arial Bold", size: 14),.foregroundColor:UIColor.white])
        cell.imageview.image = UIImage(data: imagedatafunc(appdelegate.plans[indexPath.section]))
        NSLayoutConstraint(item: cell.breakfaststack, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: cell.contentView.layer.frame.width/4).isActive = true
        NSLayoutConstraint(item: cell.lunchtack, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: cell.contentView.layer.frame.width/4).isActive = true
        NSLayoutConstraint(item: cell.dinnerstack, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: cell.contentView.layer.frame.width/4).isActive = true
        NSLayoutConstraint(item: cell.otherstack, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: cell.contentView.layer.frame.width/4).isActive = true
        if appdelegate.plans[indexPath.section].breakFastrelationship != nil{
            cell.breakfastview.backgroundColor = .systemGreen
            cell.breakfastview.layer.cornerRadius = 5
        }else{
            cell.breakfastview.backgroundColor = .systemRed
            cell.breakfastview.layer.cornerRadius = 5
        }
        if appdelegate.plans[indexPath.section].lunchrelationship != nil{
            cell.lunchview.backgroundColor = .systemGreen
            cell.lunchview.layer.cornerRadius = 5
        }else{
            cell.lunchview.backgroundColor = .systemRed
            cell.lunchview.layer.cornerRadius = 5
        }
        if appdelegate.plans[indexPath.section].dinnerRelationship != nil{
            cell.dinnerview.backgroundColor = .systemGreen
            cell.dinnerview.layer.cornerRadius = 5
        }else{
            cell.dinnerview.backgroundColor = .systemRed
            cell.dinnerview.layer.cornerRadius = 5
        }
        if appdelegate.plans[indexPath.section].otherRelationship?.count != 0{
            cell.othersview.backgroundColor = .systemGreen
            cell.othersview.layer.cornerRadius = 5
        }else{
            cell.othersview.backgroundColor = .systemRed
            cell.othersview.layer.cornerRadius = 5
        }
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            context.delete(appdelegate.plans[indexPath.section])
            appdelegate.plans.remove(at: indexPath.section)
            if appdelegate.plans.count == 0{
                for i in presentingController!.viewControllers{
                    if i is addingViewController{
                        let ic = i as! addingViewController
                        ic.loadData()
                        ic.addingplanview.emptylabel.isHidden = false
                    }
                }
               dismiss(animated: true, completion: nil)
            }else{
                tableView.reloadData()
            }
        }
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextview = dailymealantCollectionViewController(appdelegate.plans[indexPath.section].objectID)
        present(nextview, animated: true, completion: nil)
    }
    
    func imagedatafunc(_ item: DailyPlanDetails) -> Data{
        if item.breakFastrelationship == nil && item.lunchrelationship == nil && item.dinnerRelationship == nil && item.otherRelationship?.count == 0{
            return UIImage(named: "image placeholder")!.pngData()!
        }else if item.breakFastrelationship != nil && !(item.breakFastrelationship?.mealimage?.isEmpty ?? true){
           return (item.breakFastrelationship?.mealimage)!
        }
        else if item.lunchrelationship != nil && !(item.lunchrelationship?.mealimage?.isEmpty ?? true){
           return (item.lunchrelationship?.mealimage)!
        }
        else if item.dinnerRelationship != nil && !(item.dinnerRelationship?.mealimage?.isEmpty ?? true){
           return (item.dinnerRelationship?.mealimage)!
        }
        else if item.otherRelationship?.count != 0{
            for i in item.otherRelationship!.allObjects as! [Others]{
                if !(i.mealimage?.isEmpty ?? true){
                    return (i.mealimage)!
                }
            }
            return (UIImage(named: "image placeholder")?.pngData())!
        }
        return (UIImage(named: "image placeholder")?.pngData())!
    }
}
extension addingplanTableViewController:UIAdaptivePresentationControllerDelegate{
    
    func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
        for i in presentingController!.viewControllers{
            if i is addingViewController{
                let ic = i as! addingViewController
                ic.loadData()
            }
        }
    }
}
