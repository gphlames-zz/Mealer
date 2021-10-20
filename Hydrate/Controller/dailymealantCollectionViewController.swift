//
//  dailymealantCollectionViewController.swift
//  Hydrate
//
//  Created by user on 06/05/2020.
//  Copyright © 2021 swift tech. All rights reserved.
//

import UIKit
import CoreData

class dailymealantCollectionViewController: UIViewController {
    let collectionviews = dailymealantview()
    var item: NSManagedObjectID
    var arrayofitems: [NSManagedObject] = []
    var numberofrows: Int = 0
    var presentingController: UINavigationController?
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var dailyplandetails: DailyPlanDetails?
    init(_ objectid: NSManagedObjectID) {
        item = objectid
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionviews)
        collectionviews.frame = view.bounds
        NSLayoutConstraint(item: collectionviews, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 1, constant: 0).isActive = true
        do {
            try dailyplandetails = context.existingObject(with: item) as? DailyPlanDetails
            generatenumberofrows()
        } catch {
            let alertcontroller = UIAlertController(title: "Error", message: "Object not found in context", preferredStyle: .alert)
            alertcontroller.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak self] _ in
                self!.dismiss(animated: true, completion: nil)
            }))
            present(alertcontroller, animated: true, completion: nil)
        }
        collectionviews.collectionview.delegate = self
        collectionviews.collectionview.dataSource = self
    }
    func generatenumberofrows(){
        if dailyplandetails?.breakFastrelationship != nil && dailyplandetails?.lunchrelationship != nil && dailyplandetails?.dinnerRelationship != nil{
            arrayofitems.append((dailyplandetails?.breakFastrelationship)!)
            arrayofitems.append((dailyplandetails?.lunchrelationship)!)
            arrayofitems.append((dailyplandetails?.dinnerRelationship)!)
            for i in dailyplandetails!.otherRelationship!.allObjects as! [Others]{
                arrayofitems.append(i)
            }
            numberofrows =  3 + (dailyplandetails!.otherRelationship!.count)
        }
        else if dailyplandetails?.breakFastrelationship == nil && dailyplandetails?.lunchrelationship == nil && dailyplandetails?.dinnerRelationship == nil{
            numberofrows = (dailyplandetails!.otherRelationship!.count)
            for i in dailyplandetails!.otherRelationship!.allObjects as! [Others]{
                arrayofitems.append(i)
            }
        }
        else if dailyplandetails?.breakFastrelationship != nil && dailyplandetails?.lunchrelationship == nil && dailyplandetails?.dinnerRelationship == nil{
            numberofrows = (dailyplandetails!.otherRelationship!.count) + 1
            arrayofitems.append(dailyplandetails!.breakFastrelationship!)
            for i in dailyplandetails!.otherRelationship!.allObjects as! [Others]{
                arrayofitems.append(i)
            }
        }else if dailyplandetails?.breakFastrelationship == nil && dailyplandetails?.lunchrelationship != nil && dailyplandetails?.dinnerRelationship == nil{
            numberofrows = (dailyplandetails!.otherRelationship!.count) + 1
            arrayofitems.append(dailyplandetails!.lunchrelationship!)
            for i in dailyplandetails!.otherRelationship!.allObjects as! [Others]{
                arrayofitems.append(i)
            }
        }else if dailyplandetails?.breakFastrelationship == nil && dailyplandetails?.lunchrelationship == nil && dailyplandetails?.dinnerRelationship != nil{
            numberofrows = (dailyplandetails!.otherRelationship!.count) + 1
            arrayofitems.append(dailyplandetails!.dinnerRelationship!)
            for i in dailyplandetails!.otherRelationship!.allObjects as! [Others]{
                arrayofitems.append(i)
            }
        }
        else if dailyplandetails?.breakFastrelationship != nil && dailyplandetails?.lunchrelationship != nil && dailyplandetails?.dinnerRelationship == nil{
            numberofrows = (dailyplandetails!.otherRelationship!.count) + 2
            arrayofitems.append(dailyplandetails!.breakFastrelationship!)
            arrayofitems.append(dailyplandetails!.lunchrelationship!)
            for i in dailyplandetails!.otherRelationship!.allObjects as! [Others]{
                arrayofitems.append(i)
            }
        }
        else if dailyplandetails?.breakFastrelationship != nil && dailyplandetails?.lunchrelationship == nil && dailyplandetails?.dinnerRelationship != nil{
            numberofrows = (dailyplandetails!.otherRelationship!.count) + 2
            arrayofitems.append(dailyplandetails!.breakFastrelationship!)
            arrayofitems.append(dailyplandetails!.dinnerRelationship!)
            for i in dailyplandetails!.otherRelationship!.allObjects as! [Others]{
                arrayofitems.append(i)
            }
        }
        else if dailyplandetails?.breakFastrelationship == nil && dailyplandetails?.lunchrelationship != nil && dailyplandetails?.dinnerRelationship != nil{
            numberofrows = (dailyplandetails!.otherRelationship!.count) + 2
            arrayofitems.append(dailyplandetails!.lunchrelationship!)
            arrayofitems.append(dailyplandetails!.dinnerRelationship!)
            for i in dailyplandetails!.otherRelationship!.allObjects as! [Others]{
                arrayofitems.append(i)
            }
        }
    }

}
extension dailymealantCollectionViewController: UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 135)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return numberofrows
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dailymealantcollectionviewcell", for: indexPath) as! dailymealantCollectionViewCell
        print(indexPath.row)
        if arrayofitems[indexPath.section] is Breakfast{
            let dateformatter = DateFormatter()
            dateformatter.dateFormat = "h:mm s"
            let date = dateformatter.date(from: (arrayofitems[indexPath.section] as! Breakfast).timeOfDay!.description)
            cell.imageview.image = UIImage(data: (arrayofitems[indexPath.section] as! Breakfast).mealimage!)
            cell.timelabel.text = date?.description
            cell.label.text = "Breakfast"
        }
        else if arrayofitems[indexPath.section] is Lunch{
            let dateformatter = DateFormatter()
            dateformatter.dateFormat = "h:mm s"
            let date = dateformatter.date(from: (arrayofitems[indexPath.section] as! Lunch).timeOfDay!.description)
            cell.imageview.image = UIImage(data: (arrayofitems[indexPath.section] as! Lunch).mealimage!)
            cell.timelabel.text = date?.description
            cell.imageview.image = UIImage(data: (arrayofitems[indexPath.section] as! Lunch).mealimage!)
            cell.label.text = "Lunch"
        }
        else if arrayofitems[indexPath.section] is Dinner{
            let dateformatter = DateFormatter()
            dateformatter.dateFormat = "h:mm s"
            let date = dateformatter.date(from: (arrayofitems[indexPath.section] as! Dinner).timeOfDay!.description)
            cell.imageview.image = UIImage(data: (arrayofitems[indexPath.section] as! Dinner).mealimage!)
            cell.timelabel.text = date?.description
            cell.imageview.image = UIImage(data: (arrayofitems[indexPath.section] as! Dinner).mealimage!)
            cell.label.text = "Dinner"
        }
        else if arrayofitems[indexPath.section] is Others{
            let dateformatter = DateFormatter()
            dateformatter.dateFormat = "h:mm s"
            let date = dateformatter.date(from: (arrayofitems[indexPath.section] as! Others).timeOfDay!.description)
            cell.imageview.image = UIImage(data: (arrayofitems[indexPath.section] as! Others).mealimage!)
            cell.timelabel.text = date?.description
            cell.imageview.image = UIImage(data: (arrayofitems[indexPath.section] as! Others).mealimage!)
            cell.label.text = "Others"
        }
        return cell
    }
}
