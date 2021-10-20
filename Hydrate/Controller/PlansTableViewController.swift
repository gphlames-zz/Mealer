////
////  PlansTableViewController.swift
////  Hydrate
////
////  Created by user on 06/05/2020.
////  Copyright © 2020 swift tech. All rights reserved.
////
//
import UIKit
import CoreData

class PlansTableViewController: UIViewController{
    
     let tableView = UITableView()
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var plans: [PlanCollection]?
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(planandmealTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        LoadData()
        tableView.reloadData()
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.barTintColor = traitCollection.userInterfaceStyle == .dark ? UIColor.black : UIColor(named: "chlorineblue")
        LoadData()
        tableView.reloadData()
    }
    func LoadData(){
        do{
            plans = try context.fetch(PlanCollection.fetchRequest())
        }catch{
            print(error)
        }
    }
    func saveData(){
        do{
            try context.save()
        }catch{
            print("couldn't save items")
        }
    }
}
// MARK:->
extension PlansTableViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1//intial.initialie.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! planandmealTableViewCell
        //cell.imageview.image = UIImage(data: (plans?[indexPath.section].planImage)!)
        cell.nameLabel.attributedText = NSAttributedString(string: (plans?[indexPath.section].name)!, attributes: fontData.arial14)
        let datefomatter = DateFormatter()
        let date = datefomatter.string(from: (plans?[indexPath.section].dateCreated)!)
        cell.timeLabel.attributedText = NSAttributedString(string: date, attributes: fontData.arial12)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        plans?.count ?? 0
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            if plans?[indexPath.section].primaryPlan == false{
                let ind = NSMutableIndexSet()
                ind.add(indexPath.section)
                self.tableView.deleteSections(ind as IndexSet, with: .automatic)
                context.delete((plans?[indexPath.section])!)
                plans?.remove(at: indexPath.section)
                do{
                   try  context.save()
                }catch{
                    let alertController = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                        alertController.dismiss(animated: true, completion: nil)
                    }))
                    present(alertController, animated: true, completion: nil)
                }
            }else{
                let center = UNUserNotificationCenter.current()
                center.removeAllDeliveredNotifications()
                center.removeAllPendingNotificationRequests()
                let ind = NSMutableIndexSet()
                ind.add(indexPath.section)
                self.tableView.deleteSections(ind as IndexSet, with: .automatic)
                context.delete((plans?[indexPath.section])!)
                plans?.remove(at: indexPath.section)
                do{
                   try  context.save()
                }catch{
                    let alertController = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                        alertController.dismiss(animated: true, completion: nil)
                    }))
                    present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
}

//MARK:->
extension UIColor
{
    var isDarkColor: Bool {
        var r, g, b, a: CGFloat
        (r, g, b, a) = (0, 0, 0, 0)
        self.getRed(&r, green: &g, blue: &b, alpha: &a)
        let lum = 0.2126 * r + 0.7152 * g + 0.0722 * b
        return  lum < 0.50
    }
}
