////
////  customTableCell.swift
////  Hydrate
////
////  Created by user on 06/05/2020.
////  Copyright © 2020 swift tech. All rights reserved.
////
//
//import UIKit
//import RealmSwift
//
//class customTableCell: UITableViewCell {
//    @IBOutlet weak var itemLabel: UILabel!
//    @IBOutlet weak var dateLabel: UILabel!
//    @IBOutlet weak var romovebutton: UIButton!
//    var realm = try! Realm()
//    var table: UITableView?
//    var event: List<PlansDetails>?
//    var index: IndexPath?
//    var indexArray = [IndexPath]()
//    @IBAction func removeRow(_ sender: UIButton) {
//        indexArray.append(index!)
//        event?.remove(at: index!.row)
//        table?.deleteRows(at: indexArray, with: .fade)
//    }
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        if #available(iOS 13.0, *) {
//            
//        }else{
//            romovebutton.setImage(UIImage(named: "minusfill"), for: .normal)
//        }
//    }
//}
