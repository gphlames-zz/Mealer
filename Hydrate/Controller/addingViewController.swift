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
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var dailyplandetails: DailyPlanDetails? = nil
    var breakfast: Breakfast? = nil
    var lunch: Lunch? = nil
    var dinner: Dinner? = nil
    var others: Others? = nil
    var date: Date?  = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        // MARK: - inintialization section
        let closeButton = UIButton()
        dailyplandetails = DailyPlanDetails(context: context)
        // MARK: - adding subviews section
        view.addSubview(addingplanview.scrollView)
        
        // MARK: - contraints section
        NSLayoutConstraint(item: addingplanview.scrollView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: addingplanview.scrollView, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 1, constant: 0).isActive = true
        //addingplanview.scrollView.topAnchor.constraint(equalTo: guides.topAnchor).isActive = true
        addingplanview.scrollView.isScrollEnabled = true
        // MARK: - other section
        addingplanview.scrollView.showsVerticalScrollIndicator = false
        closeButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        closeButton.addTarget(self, action: #selector(exitfunc), for: .touchUpInside)
        let rightbarbutton = UIBarButtonItem(customView: closeButton)
        navigationItem.leftBarButtonItem = rightbarbutton
        navigationController?.navigationBar.backgroundColor = UIColor(named: "Ceramic white")
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
        addingplanview.breakFastTableView.register(planandmealTableViewCell.self, forCellReuseIdentifier: "Cell")
        addingplanview.lunchTableView.register(planandmealTableViewCell.self, forCellReuseIdentifier: "Cell")
        addingplanview.dinnerTableView.register(planandmealTableViewCell.self, forCellReuseIdentifier: "Cell")
        addingplanview.othersTableView.register(planandmealTableViewCell.self, forCellReuseIdentifier: "Cell")
        addingplanview.breakfastAddButton.addTarget(self, action: #selector(addplan), for: .touchUpInside)
        addingplanview.lunchAddButton.addTarget(self, action: #selector(addplan), for: .touchUpInside)
        addingplanview.dinnerAddButton.addTarget(self, action: #selector(addplan), for: .touchUpInside)
        addingplanview.othersAddButton.addTarget(self, action: #selector(addplan), for: .touchUpInside)
        addingplanview.saveButton.addTarget(self, action: #selector(saveFunction), for: .touchUpInside)
        let bottomOffset = CGPoint(x: 0, y: addingplanview.scrollView.contentSize.height)
        addingplanview.scrollView.setContentOffset(bottomOffset, animated: true)
    }
    override func viewWillAppear(_ animated: Bool) {
        addingplanview.setConstraints()
        
    }
    override func viewDidLayoutSubviews() {
        addingplanview.scrollView.contentSize=addingplanview.parentStack.frame.size
    }
    @objc func saveFunction(){
        
    }
    @objc func exitfunc(){
        dismiss(animated: true) {
            self.context.reset()
        }
    }
    @objc func addplan(_ sender: UIButton){
        if sender == addingplanview.breakfastAddButton{
            
        }
        else if sender == addingplanview.lunchAddButton{
            
        }
        else if sender == addingplanview.dinnerAddButton{
            
        }
        else if sender == addingplanview.othersAddButton{
            
        }else{
            
        }
    }
}
extension addingViewController: UITableViewDelegate, UITableViewDataSource,FSCalendarDelegate,FSCalendarDataSource,UIScrollViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == addingplanview.breakFastTableView || tableView == addingplanview.lunchTableView || tableView == addingplanview.dinnerTableView {
            return 1
        }else{
            return dailyplandetails?.otherRelationship?.count ?? 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! planandmealTableViewCell
        cell.emptylabel.textColor = .lightGray
        if tableView == addingplanview.breakFastTableView && breakfast == nil{
            cell.imageview.isHidden = true
            cell.nameLabel.isHidden = true
            cell.timeLabel.isHidden = true
            cell.setConstraints()
            return cell
        }
        else if tableView == addingplanview.breakFastTableView && breakfast != nil{


        }
        else if tableView == addingplanview.lunchTableView && breakfast == nil{
            cell.imageview.isHidden = true
            cell.nameLabel.isHidden = true
            cell.timeLabel.isHidden = true
            cell.setConstraints()
            return cell
        }
        else if tableView == addingplanview.lunchTableView && breakfast != nil{

        }
        else if tableView == addingplanview.dinnerTableView && breakfast == nil{
            cell.imageview.isHidden = true
            cell.nameLabel.isHidden = true
            cell.timeLabel.isHidden = true
            cell.setConstraints()
            return cell
        }
        else if tableView == addingplanview.dinnerTableView && breakfast != nil{

        }
        else if tableView == addingplanview.othersTableView && breakfast == nil{
            cell.imageview.isHidden = true
            cell.nameLabel.isHidden = true
            cell.timeLabel.isHidden = true
            cell.setConstraints()
            return cell
        }
        else if tableView == addingplanview.othersTableView && breakfast != nil{

        }else {

        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        self.date = date
    }
}

//
//class addingViewController: UIViewController {
//    var items: UITextField?
//    var firstView: UIView?
//    var topLabel: UILabel?
//    var createEvent: UIButton?
//    var EventLabel: UILabel?
//    var foodStack: UIStackView?
//    var hourPicker: UIPickerView?
//    var minutesPicker: UIPickerView?
//    var superStack: UIStackView?
//    var pickerStack: UIStackView?
//    var ampmPicker: UIPickerView?
//    var event: List<PlansDetails>?
//    var datecomponents: DateComponents?
//    let plant = PlansDetails()
//    var tablevi: UITableView?
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        items?.delegate = self
//        datecomponents?.hour = 0
//        datecomponents?.minute = 0
//        plant.ampm = "AM"
//        // MARK:-> intialization section
//        items = UITextField()
//        firstView = UIView()
//        topLabel = UILabel()
//        createEvent = UIButton()
//        EventLabel = UILabel()
//        foodStack = UIStackView()
//        hourPicker = UIPickerView()
//        minutesPicker = UIPickerView()
//        superStack = UIStackView(frame: CGRect(x: 0, y: 0, width: (firstView?.bounds.width)!, height: 212))
//        pickerStack = UIStackView()
//        let createlabelstack = UIStackView()
//        let hourLabel = UILabel()
//        let minuteLabel = UILabel()
//        let timelabel = UILabel()
//        ampmPicker = UIPickerView()
//        // MARK:-> formatting section
//        foodStack?.translatesAutoresizingMaskIntoConstraints = false
//        createlabelstack.translatesAutoresizingMaskIntoConstraints = false
//        topLabel?.translatesAutoresizingMaskIntoConstraints = false
//        EventLabel?.translatesAutoresizingMaskIntoConstraints = false
//        hourLabel.translatesAutoresizingMaskIntoConstraints = false
//        minuteLabel.translatesAutoresizingMaskIntoConstraints = false
//        pickerStack?.translatesAutoresizingMaskIntoConstraints = false
//        superStack?.translatesAutoresizingMaskIntoConstraints = false
//        hourPicker?.translatesAutoresizingMaskIntoConstraints = false
//        minutesPicker?.translatesAutoresizingMaskIntoConstraints = false
//        createEvent?.translatesAutoresizingMaskIntoConstraints = false
//        firstView?.translatesAutoresizingMaskIntoConstraints = false
//        topLabel?.translatesAutoresizingMaskIntoConstraints = false
//        timelabel.translatesAutoresizingMaskIntoConstraints = false
//        items?.translatesAutoresizingMaskIntoConstraints = false
//        ampmPicker?.translatesAutoresizingMaskIntoConstraints = false
//        EventLabel?.numberOfLines = 0
//        EventLabel?.textColor = .white
//        createEvent?.tintColor = .white
//        timelabel.textColor = .white
//        hourLabel.textColor = .white
//        minuteLabel.textColor = .white
//        topLabel?.textColor = .white
//        items?.adjustsFontSizeToFitWidth = true
//        items?.placeholder = "Enter Foods/events here"
//        if #available(iOS 13.0, *) {
//            items?.layer.borderColor = CGColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//        } else {
//            // Fallback on earlier versions
//        }
//        createEvent?.setTitle("Create item", for: .normal)
//        createEvent?.layer.borderWidth = 1
//        if #available(iOS 13.0, *) {
//            createEvent?.layer.borderColor = CGColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.0)
//        } else {
//            // Fallback on earlier versions
//        }
//        topLabel?.text = "Add different foods for options"
//        topLabel?.textAlignment = .left
//        timelabel.textAlignment = .left
//        EventLabel?.text = "Foods/Events"
//        timelabel.text = "Time"
//        timelabel.textAlignment = .left
//        EventLabel?.textAlignment = .left
//        createEvent?.addTarget(self, action: #selector(createItem), for: .touchUpInside)
//        foodStack?.axis = .horizontal
//        foodStack?.addSubview(EventLabel!)
//        foodStack?.addSubview(items!)
//        createlabelstack.axis = .horizontal
//        hourLabel.text = "HH:"
//        minuteLabel.text = "MM:"
//        createlabelstack.addSubview(createEvent!)
//        pickerStack?.axis = .horizontal
//        pickerStack?.addSubview(timelabel)
//        pickerStack?.addSubview(hourPicker!)
//        pickerStack?.addSubview(minutesPicker!)
//        pickerStack?.addSubview(ampmPicker!)
//        pickerStack?.addSubview(hourLabel)
//        pickerStack?.addSubview(minuteLabel)
//        superStack?.axis = .vertical
//        superStack?.addSubview(topLabel!)
//        superStack?.addSubview(foodStack!)
//        superStack?.addSubview(createlabelstack)
//        superStack?.addSubview(pickerStack!)
//        firstView?.backgroundColor = UIColor(named: "chlorineblue")
//        items!.layer.borderWidth = 1
//        firstView?.addSubview(superStack!)
//        view.addSubview(firstView!)
//        // MARK:-> add constraints
//        // MARK:-> view constraints
//        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":firstView!]))
//        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: [], metrics: nil, views: ["v0":firstView!]))
//        // MARK:-> firstview constraints
//        firstView?.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: [], metrics: nil, views: ["v0":superStack!]))
//        // MARK:-> food stack constraints
//        foodStack!.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(2)-[v0(80)]-(0)-[v1]-(5)-|", options: [], metrics: nil, views: ["v0":EventLabel!,"v1":items!]))
//        foodStack!.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0(50)]|", options: [], metrics: nil, views: ["v0":items!]))
//        foodStack!.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":EventLabel!]))
//        // MARK:-> superstack constraints
//        superStack!.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-(2)-[v0(20)]-(1)-[v1(70)]-(15)-[v3(50)]-(4)-[v4(50)]-(2)-|", options: [], metrics: nil, views: ["v0":topLabel!,"v1":foodStack!,"v3":pickerStack!,"v4":createlabelstack]))
//        superStack!.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(80)-[v0]-(2)-|", options: [], metrics: nil, views: ["v0":topLabel!]))
//        superStack!.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(2)-[v0]-(2)-|", options: [], metrics: nil, views: ["v0":pickerStack!]))
//        superStack!.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(2)-[v0]-(2)-|", options: [], metrics: nil, views: ["v0":createlabelstack]))
//        superStack!.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(2)-[v0]-(2)-|", options: [], metrics: nil, views: ["v0":foodStack!]))
////        superStack!.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(\(((superStack?.bounds.width)!-150)/2))-[v0(150)]-(\(((superStack?.bounds.width)!-150)/2))-|", options: [], metrics: nil, views: ["v0":createEvent]))
//        NSLayoutConstraint(item: superStack!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 227).isActive = true
//        // MARK:-> createlabelstack constraints
//        createlabelstack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":createEvent!]))
//        NSLayoutConstraint(item: createEvent!, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 150).isActive = true
//        NSLayoutConstraint(item: createEvent!, attribute: .centerX, relatedBy: .equal, toItem: createlabelstack, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
//        NSLayoutConstraint(item: createEvent!, attribute: .centerY, relatedBy: .equal, toItem: createlabelstack, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
//        // MARK:-> pickerstack constraints
//        pickerStack?.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0(80)][v4(35)][v1(65)][v5(35)][v2(65)]-(5)-[v3(65)]", options: [], metrics: nil, views: ["v0":timelabel,"v1":hourPicker!,"v2":minutesPicker!,"v3":ampmPicker!,"v4":hourLabel,"v5":minuteLabel]))
//        pickerStack?.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":timelabel]))
//        pickerStack?.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":hourPicker!]))
//        pickerStack?.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":minutesPicker!]))
//        pickerStack?.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":ampmPicker!]))
//        pickerStack?.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":hourLabel]))
//        pickerStack?.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":minuteLabel]))
//        hourPicker?.dataSource = self
//        hourPicker?.delegate = self
//        minutesPicker?.dataSource = self
//        minutesPicker?.delegate = self
//        ampmPicker?.dataSource = self
//        ampmPicker?.delegate = self
//        // MARK:-> other constraints
//    }
//    func createtime()-> Date{
//        let calendar = Calendar(identifier: .gregorian)
//        if plant.ampm == "AM" && (datecomponents?.hour)! == 12{
//            datecomponents?.hour! -= 12
//        }
//        else if plant.ampm == "PM" && (datecomponents?.hour)! < 12{
//            datecomponents?.hour! += 12
//        }
//        else if plant.ampm == "PM" && (datecomponents?.hour)! == 12{
//            datecomponents?.hour = 12
//        }
//        let date = calendar.date(from: datecomponents!)!
//        return date
//    }
//    @objc func createItem(_ sender: UIButton) {
//        if items!.text == ""{
//          let alert = UIAlertController(title: "Incomplete Field", message: "Text Field is empty please input foods to continue", preferredStyle: .alert)
//          let aler = UIAlertAction(title: "OK", style: .cancel, handler: nil)
//          alert.addAction(aler)
//          present(alert, animated: true, completion: nil)
//      }else{
//        plant.items = " " + items!.text!
//         plant.date = createtime()
//         event?.append(plant)
//         tablevi?.reloadData()
//         dismiss(animated: true, completion: nil)
//      }
//    }
//
//}
//extension addingViewController: UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate{
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 1
//    }
//
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        if pickerView == hourPicker{
//            return Data.hours.count
//        }else if pickerView == minutesPicker{
//            return Data.minutes.count
//        }else{
//            return Data.ampm.count
//        }
//    }
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        pickerView.tintColor = .white
//        if pickerView == hourPicker{
//            return NSAttributedString(string: Data.hours[row], attributes: [.foregroundColor:UIColor.white]).string
//        }else if pickerView == minutesPicker{
//            return NSAttributedString(string: Data.minutes[row], attributes: [.foregroundColor:UIColor.white]).string
//        }else{
//            return Data.ampm[row]
//        }
//    }
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
//        if pickerView == hourPicker{
//            datecomponents?.hour = Int(Data.choosetime(Data.hours[row]))
//        }else if pickerView == minutesPicker{
//             datecomponents?.minute = Int(Data.choosetime(Data.minutes[row]))
//        }else{
//            plant.ampm = Data.ampm[row]
//        }
//    }
//}
