////
////  showViewController.swift
////  Hydrate
////
////  Created by user on 06/05/2020.
////  Copyright © 2020 swift tech. All rights reserved.
////
//
//import UIKit
//import RealmSwift
//import UserNotifications
//
//class showViewController: UIViewController {
//    
//    @IBOutlet weak var save: UIBarButtonItem!
//    @IBOutlet weak var table: UITableView!
//    var realm = try! Realm()
//    var checkSave = false
//    var result: superCollectionOfPlanDetails?
//    let image = superCollectionOfPlanDetails()
//    var pacificCalendar = Calendar(identifier: .gregorian)
//    var date = Date()
//    var dateComponents = DateComponents()
//    var arraydatecomponents: [DateComponents] = []
//    var planers = Plans()
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        if traitCollection.userInterfaceStyle == .dark{
//            navigationController?.navigationBar.tintColor = .white
//            navigationItem.leftBarButtonItem?.tintColor = .white
//            save.tintColor = .white
//        }else{
//            navigationController?.navigationBar.tintColor = .white
//            navigationItem.leftBarButtonItem?.tintColor = .white
//            save.tintColor = .white
//        }
//            dateComponents = pacificCalendar.dateComponents([.day,.month,.weekday,.year,.hour,.minute], from: date)
//        table.register(UINib(nibName: "customizedCell", bundle: nil), forCellReuseIdentifier: "custom")
//        
//        table.dataSource = self
//        populateImage()
//        populateDate()
//        // Do any additional setup after loading the view.
//    }
//    override func viewWillAppear(_ animated: Bool) {
//        navigationController?.navigationBar.barTintColor = traitCollection.userInterfaceStyle == .dark ? UIColor.black : UIColor(named: "chlorineblue")
//    }
//    func saver(){
//        do{
//                try realm.write{
//                    if let e = result{
//                        realm.delete(e)
//                        let center = UNUserNotificationCenter.current()
//                        center.removeAllDeliveredNotifications()
//                        center.removeAllPendingNotificationRequests()
//                        UIApplication.shared.applicationIconBadgeNumber = 0
//                    }
//                }
//        }catch{
//            print("Couldn't delete current database")
//            }
//            do {
//                try realm.write{
//                    if !image.collection.isEmpty{
//                        realm.add(image)
//                        createNotifications(image.collection)
//                    }
//                }
//            } catch {
//                print("Failed to add objects")
//            }
//        }
//     @IBAction func buttonfunc(_ sender: UIBarButtonItem) {
//            if save.title == "Edit"{
//                save.title = "Save"
//                if result?.current == true{
//                    image.current = true
//                }
//                image.name = result?.name.copy() as! String
//                table.reloadData()
//            }else{
//                saver()
//                self.navigationController?.popViewController(animated: true)
//        }
//    }
//        func populateImage(){
//            for i in result!.collection{
//                let h = collectionOfPlanDetails()
//                for e in i.plandetails{
//                    h.plandetails.append(getimage(e))
//                }
//                h.dayOfWeek = i.dayOfWeek.copy() as! String
//                image.collection.append(h)
//            }
//        }
//    func getimage(_ planx: PlansDetails)-> PlansDetails{
//        let pla = PlansDetails()
//        pla.items = planx.items.copy() as! String
//        pla.date = (planx.date as NSDate).copy() as! Date
//        pla.ampm = planx.ampm.copy() as! String
//        return pla
//    }
//        func createTime(_ day: String)-> String{
//            for i in planers.days{
//                if i.day == day{
//                    return i.time
//                }
//            }
//            return ""
//        }
//        func populateDate(){
//            for _ in 1...7{
//                let y = String(dateComponents.month!) + "\\" + String(dateComponents.day!) + "\\" + String(dateComponents.year!)
//                let t = dateForCustomizedView(days.daysOfWeek[dateComponents.weekday!-1], y)
//                planers.days.append(t)
//                arraydatecomponents.append(dateComponents)
//                date = Calendar.current.date(byAdding: .day, value: 1, to: date)!
//                dateComponents = pacificCalendar.dateComponents([.day,.month,.weekday,.year], from: date)
//            }
//        }
//    func createNotifications(_ image: List<collectionOfPlanDetails>){
//        let center = UNUserNotificationCenter.current()
//        for i in image{
//            for e in i.plandetails{
//                let content = UNMutableNotificationContent()
//                content.title = "Mealer"
//                content.body = e.items
//                content.sound = UNNotificationSound.default
//                let triggerweekly =
//                    Calendar.current.dateComponents([.weekday,.hour,.minute],from: e.date)
//                let trigger = UNCalendarNotificationTrigger(dateMatching: triggerweekly, repeats: true)
//                let identifier = "UYllocalNotification" + e.items + e.date.description
//                let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
//                center.add(request) { (error) in
//                    if let e = error{
//                        let alert = UIAlertController(title: "Error", message: e.localizedDescription, preferredStyle: .alert)
//                        self.present(alert, animated: true,completion: nil)
//                    }
//                }
//            }
//        }
//    }
//}
//   
//extension showViewController: UITableViewDataSource{
//   
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 1
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "custom", for: indexPath) as! customizedCell
//        cell.dayOfTheWeek.text = " " + planers.days[indexPath.section].day
//        cell.dateOfDay.text = planers.days[indexPath.section].time
//        for i in 0..<7{
//            if  image.collection[i].dayOfWeek == planers.days[indexPath.section].day{
//                cell.itemArray = image.collection[i].plandetails
//                cell.dataComponents = arraydatecomponents[indexPath.section]
//                cell.presentbutton.isHidden = save.title == "Edit" ? true:false
//                cell.TableViewToHoldItems.reloadData()
//            }
//            else{
//                
//            }
//        }
//        
//        if #available(iOS 13.0, *) {
//            cell.layer.borderWidth = 2
//            cell.layer.borderColor = CGColor(red: 0.047, green: 0.686, blue: 1.000, alpha: 1)
//        } else {
//            // Fallback on earlier versions
//        }
//        return cell
//    }
//    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 7
//    }
//    
//    private func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 20
//    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 186.5
//       }
//}
