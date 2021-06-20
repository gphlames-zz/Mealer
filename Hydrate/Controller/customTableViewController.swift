////
////  customTableViewController.swift
////  Hydrate
////
////  Created by user on 06/05/2020.
////  Copyright © 2020 swift tech. All rights reserved.
////
//
//import UIKit
//import UserNotifications
//import RealmSwift
//
//class customTableViewController: UIViewController {
//
//    @IBOutlet weak var tableView: UITableView!
//    @IBOutlet weak var save: UIBarButtonItem!
//    var planers = Plans()
//    var pacificCalendar = Calendar(identifier: .gregorian)
//    var date = Date()
//    var dateComponents = DateComponents()
//    var arraydatecomponents: [DateComponents] = []
//    var superior = superCollectionOfPlanDetails()
//    var realm = try! Realm()
//    override func viewDidLoad() {
//        super.viewDidLoad()
////        dateformatter.dateStyle = .short
////        dateformatter.locale = Locale(identifier: "en_US")
//        navigationController?.navigationBar.barTintColor = traitCollection.userInterfaceStyle == .dark ? UIColor.black : UIColor(named: "chlorineblue")
//        if traitCollection.userInterfaceStyle == .dark{
//            navigationController?.navigationBar.tintColor = .white
//            navigationItem.leftBarButtonItem?.tintColor = .white
//        }else{
//            navigationController?.navigationBar.tintColor = .white
//            navigationItem.leftBarButtonItem?.tintColor = .white
//        }
//        dateComponents = pacificCalendar.dateComponents([.day,.month,.weekday,.year,.hour,.minute], from: date)
//    tableView.register(UINib(nibName: "customizedCell", bundle: nil), forCellReuseIdentifier: "custom")
//    tableView.dataSource = self
//    populateDate()
//    }
//    func populateDate(){
//        for _ in 1...7{
//            let y = String(dateComponents.month!) + "\\" + String(dateComponents.day!) + "\\" + String(dateComponents.year!)
//            let t = dateForCustomizedView(days.daysOfWeek[dateComponents.weekday!-1], y)
//            planers.days.append(t)
//            let createCollect = collectionOfPlanDetails()
//            createCollect.dayOfWeek = days.daysOfWeek[dateComponents.weekday!-1]
//            superior.collection.append(createCollect)
//            arraydatecomponents.append(dateComponents)
//            date = Calendar.current.date(byAdding: .day, value: 1, to: date)!
//            dateComponents = pacificCalendar.dateComponents([.day,.month,.weekday,.year], from: date)
//        }
//       
//    }
//    @IBAction func saveData(_ sender: UIBarButtonItem) {
//        
//        if superior.collection.isEmpty{
//             let alert = UIAlertController(title: "Error", message: "Please create events before saving", preferredStyle: .alert)
//            present(alert, animated: true, completion: nil)
//        }else{
//            var texted = UITextField()
//            let center = UNUserNotificationCenter.current()
//            center.getNotificationSettings { (settings) in
//                if settings.authorizationStatus == .authorized{
//                    let alert = UIAlertController(title: "Enter Name of plan", message: "", preferredStyle: .alert)
//                    
//                    DispatchQueue.main.async {
//                        alert.addTextField { (textfield) in
//                            textfield.placeholder = "Enter name here"
//                         texted = textfield
//                        }
//                    }
//                    let action = UIAlertAction(title: "Set", style: .default) { (action) in
//                        self.superior.name = texted.text!
//                        self.superior.dateCreated = Date()
//                               for i in self.superior.collection{
//                                   for e in i.plandetails{
//                                    let content = UNMutableNotificationContent()
//                                        content.title = "As per your plan"
//                                    content.body = e.items
//                                    content.sound = UNNotificationSound.default
//                                    let triggerweekly =
//                                        Calendar.current.dateComponents([.weekday,.hour,.minute],from: e.date)
//                                    let trigger = UNCalendarNotificationTrigger(dateMatching: triggerweekly, repeats: true)
//                                    let identifier = "UYllocalNotification" + e.items + e.date.description
//                                    let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
//                                    center.add(request) { (error) in
//                                        if let e = error{
//                                            let alert = UIAlertController(title: "Error", message: e.localizedDescription, preferredStyle: .alert)
//                                            DispatchQueue.main.async {
//                                                 self.present(alert, animated: true,completion: nil)
//                                            }
//                                        }
//                                        
//                                    }
//                                }
//                           }
//                        do{
//                                          try self.realm.write{
//                                           self.realm.add(self.superior)
//                                            self.navigationController?.popViewController(animated: true)
//                                          }
//                                      }catch{
//                                          let alert = UIAlertController(title: "Error", message: "Couldn't save events", preferredStyle: .alert)
//                                          let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
//                                          alert.addAction(action)
//                                       self.present(alert, animated: true, completion: nil)
//                                      }
//                                  }
//                    DispatchQueue.main.async {
//                        let action2 = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
//                        alert.addAction(action2)
//                        alert.addAction(action)
//                         self.present(alert, animated: true,completion: nil)
//                    }
//                }else{
//                    let alert = UIAlertController(title: "Permission Denied", message: "Event notification not permitted on this device please go to settings and enable it", preferredStyle: .alert)
//                    let alertaction = UIAlertAction(title: "OK", style: .default, handler: nil)
//                    alert.addAction(alertaction)
//                    DispatchQueue.main.async {
//                        self.present(alert,animated: true,completion:  nil)
//                    }
//                }
//        }
//        }
//    }
//}
//extension customTableViewController: UITableViewDataSource{
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 1
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "custom", for: indexPath) as! customizedCell
//        cell.dayOfTheWeek.text = " " + planers.days[indexPath.section].day
//        cell.dateOfDay.text = planers.days[indexPath.section].time
//        cell.itemArray = superior.collection[indexPath.section].plandetails
//        cell.dataComponents = arraydatecomponents[indexPath.section]
//        for i in 0..<7{
//            if  superior.collection[i].dayOfWeek == planers.days[indexPath.section].day{
//                cell.itemArray = superior.collection[i].plandetails
//                cell.dataComponents = arraydatecomponents[indexPath.section]
//                cell.TableViewToHoldItems.reloadData()
//            }
//            else{
//                
//            }
//        }
//        if #available(iOS 13.0, *) {
//            cell.layer.borderWidth = 2
//            cell.layer.borderColor = CGColor(red: 0.047, green: 0.686, blue: 1.000, alpha: 1)
//        } else {
//            // Fallback on earlier versions
//        }
//         return cell
//    }
//        
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return planers.days.count
//    }
//    
//    private func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 20
//    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 190
//    }
//}
