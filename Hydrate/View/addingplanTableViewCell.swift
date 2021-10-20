//
//  addingplanTableViewCell.swift
//  Hydrate
//
//  Created by user on 06/05/2020.
//  Copyright © 2021 swift tech. All rights reserved.
//

import UIKit

class addingplanTableViewCell: UITableViewCell {
    
    var timelabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var timelabel2: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var breakfastview: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = view.frame.height/2
        return view
    }()
    var dinnerview: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = view.frame.height/2
        return view
    }()
    
    var lunchview: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = view.frame.height/2
        return view
    }()
    
    var othersview: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = view.frame.height/2
        return view
    }()
    var imageview: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    var breakfaststack: UIStackView = {
        let stackview = UIStackView()
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.sizeToFit()
        return stackview
    }()
    var lunchtack: UIStackView = {
        let stackview = UIStackView()
        stackview.translatesAutoresizingMaskIntoConstraints = false
        return stackview
    }()
    var dinnerstack: UIStackView = {
        let stackview = UIStackView()
        stackview.translatesAutoresizingMaskIntoConstraints = false
        return stackview
    }()
    var otherstack: UIStackView = {
        let stackview = UIStackView()
        stackview.translatesAutoresizingMaskIntoConstraints = false
        return stackview
    }()
    override func layoutSubviews() {
        let timestack = UIStackView()
        let breakfastlabel = UILabel()
        let lunchlabel = UILabel()
        let dinnerlabel = UILabel()
        let otherslabel = UILabel()
        let understack = UIStackView()
        
        translatemasks([timestack,timelabel2,breakfastlabel,lunchlabel,dinnerlabel,otherslabel,understack])
       
        addsubviews(addingview: timestack, array: [timelabel2,timelabel])
        addsubviews(addingview: breakfaststack, array: [breakfastview,breakfastlabel])
        addsubviews(addingview: lunchtack, array: [lunchview,lunchlabel])
        addsubviews(addingview: dinnerstack, array: [dinnerview,dinnerlabel])
        addsubviews(addingview: otherstack, array: [othersview,otherslabel])
        addsubviews(addingview: understack, array: [breakfaststack,lunchtack,dinnerstack,otherstack])
        addsubviews(addingview: contentView, array: [imageview,timestack,understack])
        
        understack.axis = .horizontal
         // MARK: - parentstack constraints
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[v0(100)]|", options: [], metrics: nil, views: ["v0":timestack]))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0(40)]", options: [], metrics: nil, views: ["v0":timestack]))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: [], metrics: nil, views: ["v0":imageview]))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":imageview]))
        NSLayoutConstraint(item: understack, attribute: .bottom, relatedBy: .equal, toItem: contentView, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: understack, attribute: .leading, relatedBy: .equal, toItem: contentView, attribute: .leading, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: understack, attribute: .trailing, relatedBy: .equal, toItem: contentView, attribute: .trailing, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: understack, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 60).isActive = true
        NSLayoutConstraint(item: breakfaststack, attribute: .leading, relatedBy: .equal, toItem: contentView, attribute: .leading, multiplier: 1, constant:0).isActive = true
        NSLayoutConstraint(item: lunchtack, attribute: .leading, relatedBy: .equal, toItem: breakfaststack, attribute: .trailing, multiplier: 1, constant:0).isActive = true
        NSLayoutConstraint(item: dinnerstack, attribute: .leading, relatedBy: .equal, toItem: lunchtack, attribute: .trailing, multiplier: 1, constant:0).isActive = true
        NSLayoutConstraint(item: otherstack, attribute: .leading, relatedBy: .equal, toItem: dinnerstack, attribute: .trailing, multiplier: 1, constant:0).isActive = true
        // MARK: - breakfaststack constraints
        breakfaststack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(2)-[v0(10)][v1]|", options: [], metrics: nil, views: ["v0":breakfastview,"v1":breakfastlabel]))
        breakfaststack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0(10)]", options: [], metrics: nil, views: ["v0":breakfastview]))
        NSLayoutConstraint(item: breakfastview, attribute: .centerYWithinMargins, relatedBy: .equal, toItem: breakfaststack, attribute: .centerYWithinMargins, multiplier: 1, constant: 0).isActive = true
        breakfaststack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":breakfastlabel]))
        // MARK: - lunchstack constraints
        lunchtack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(2)-[v0(10)][v1]-(2)-|", options: [], metrics: nil, views: ["v0":lunchview,"v1":lunchlabel]))
        lunchtack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0(10)]", options: [], metrics: nil, views: ["v0":lunchview]))
        NSLayoutConstraint(item: lunchview, attribute: .centerYWithinMargins, relatedBy: .equal, toItem: lunchtack, attribute: .centerYWithinMargins, multiplier: 1, constant: 0).isActive = true
        lunchtack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":lunchlabel]))
        // MARK: - dinnerstack constraints
        dinnerstack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(2)-[v0(10)][v1]-(2)-|", options: [], metrics: nil, views: ["v0":dinnerview,"v1":dinnerlabel]))
        dinnerstack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0(10)]", options: [], metrics: nil, views: ["v0":dinnerview]))
        NSLayoutConstraint(item: dinnerview, attribute: .centerYWithinMargins, relatedBy: .equal, toItem: dinnerstack, attribute: .centerYWithinMargins, multiplier: 1, constant: 0).isActive = true
        dinnerstack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":dinnerlabel]))
        // MARK: - otherstack constraints
        otherstack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(2)-[v0(10)][v1]-(2)-|", options: [], metrics: nil, views: ["v0":othersview,"v1":otherslabel]))
        otherstack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0(10)]", options: [], metrics: nil, views: ["v0":othersview]))
        NSLayoutConstraint(item: othersview, attribute: .centerYWithinMargins, relatedBy: .equal, toItem: otherstack, attribute: .centerYWithinMargins, multiplier: 1, constant: 0).isActive = true
        otherstack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":otherslabel]))
        // MARK: - timestack constraints
        timestack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(2)-[v0(40)][v1]-(2)-|", options: [], metrics: nil, views: ["v0":timelabel2,"v1":timelabel]))
        timestack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":timelabel2]))
        timestack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":timelabel]))
        // MARK: - understack constraints
//        understack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0][v1][v2][v3]|", options: [], metrics: nil, views: ["v0":breakfaststack,"v1":lunchtack,"v2":dinnerstack,"v3":otherstack]))
        understack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":breakfaststack]))
        understack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":lunchtack]))
        understack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":dinnerstack]))
        understack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":otherstack]))
        contentView.bringSubviewToFront(timestack)
        contentView.bringSubviewToFront(understack)
        
        timelabel2.attributedText = NSAttributedString(string: "Time:", attributes: [.font:UIFont(name: "Arial", size: 14),.foregroundColor:UIColor.white])
        breakfastlabel.attributedText = NSAttributedString(string: " Breakfast", attributes: [.font:UIFont(name: "Arial Bold", size: 14),.foregroundColor:UIColor.white])
        lunchlabel.attributedText = NSAttributedString(string: " Lunch", attributes: [.font:UIFont(name: "Arial Bold", size: 14),.foregroundColor:UIColor.white])
        dinnerlabel.attributedText = NSAttributedString(string: " Dinner", attributes: [.font:UIFont(name: "Arial Bold", size: 14),.foregroundColor:UIColor.white])
        otherslabel.attributedText = NSAttributedString(string: " Others", attributes: [.font:UIFont(name: "Arial Bold", size: 14),.foregroundColor:UIColor.white])
        
    }
    
    func translatemasks(_ views:[UIView]){
        for view in views{
            view.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    func addsubviews(addingview: UIView, array:[UIView]){
        for i in array{
            addingview.addSubview(i)
        }
    }
}
