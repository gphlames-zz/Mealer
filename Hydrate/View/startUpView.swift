//
//  startUpView.swift
//  Hydrate
//
//  Created by user on 06/05/2020.
//  Copyright © 2021 swift tech. All rights reserved.
//

import UIKit

class startUpView: UIView {
    var guideScrollview: UIScrollView = {
        let scrollview = UIScrollView()
        scrollview.translatesAutoresizingMaskIntoConstraints = false
        scrollview.isUserInteractionEnabled = true
        scrollview.isPagingEnabled = true
        scrollview.showsHorizontalScrollIndicator = false
        return scrollview
    }()
   lazy var pageview: UIPageControl = {
        let pager = UIPageControl()
        pager.translatesAutoresizingMaskIntoConstraints = false
        pager.isUserInteractionEnabled = true
        pager.pageIndicatorTintColor = .black
        pager.currentPageIndicatorTintColor = .systemBlue
        pager.numberOfPages = 3
        pager.currentPage = 0
        return pager
    }()
    lazy var imageview1:UIImageView = {
        let imager = UIImageView(image: UIImage(named: "first image"))
        imager.translatesAutoresizingMaskIntoConstraints = false
        imager.contentMode = .scaleAspectFill
        imager.clipsToBounds = true
        return imager
    }()
    lazy var imageview2:UIImageView = {
        let imager = UIImageView(image: UIImage(named: "sixth image"))
        imager.translatesAutoresizingMaskIntoConstraints = false
        imager.contentMode = .scaleAspectFill
        imager.clipsToBounds = true
        return imager
    }()
    lazy var imageview3:UIImageView = {
        let imager = UIImageView(image: UIImage(named: "fifth image"))
        imager.translatesAutoresizingMaskIntoConstraints = false
        imager.contentMode = .scaleAspectFill
        imager.clipsToBounds = true
        return imager
    }()
    lazy var signInLabel2: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isUserInteractionEnabled = true
        label.attributedText = NSAttributedString(string: "Sign in", attributes: [.font:UIFont(name: "Arial", size: 14)])
        label.textAlignment = .left
        label.textColor = UIColor(named: "firstshade")
        return label
    }()
    lazy var getStartedButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setAttributedTitle(NSAttributedString(string: "Get Started", attributes: [.font:UIFont(name: "Arial Italic", size: 14)]), for: .normal)
        button.backgroundColor = UIColor(named: "firstshade")
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = CGFloat(8)
        return button
    }()
    lazy var guideview: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "Ceramic white")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var onlystack: UIStackView = {
        let stackview = UIStackView()
        stackview.translatesAutoresizingMaskIntoConstraints = false
        return stackview
    }()
    lazy var continueasguestbutton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setAttributedTitle(NSAttributedString(string: "Continue as guest", attributes: [.font:UIFont(name: "Arial Italic", size: 10)]), for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont(name: "Arial Bold", size: 22)
        label.text = "Build Your perfect meal Plan"
        return label
    }()
    lazy var infoLabel2: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .white
        label.numberOfLines = 0
        label.text = "The Mealer app makes organizing a meal plan for whatever goal you choose easy with it's clean easy to use interface"
        label.font = UIFont(name: "Arial Italic", size: 18)
        return label
    }()
    override func layoutSubviews() {
        //MARK: - > Initialization section
         let imageView = UIImageView(image: UIImage(named: "logo"))
        let imageviewStack = UIStackView()
        let signInStack = UIStackView()
        let signInLabel = UILabel()
        //MARK:-> set properties section
        imageView.contentMode = .scaleAspectFit
        translatemasks([imageView,imageviewStack,signInStack,signInLabel])
        imageviewStack.axis = .horizontal
        signInStack.axis = .horizontal
        addsubviews(addingview: signInStack, array: [signInLabel,signInLabel2])
        addsubviews(addingview: guideview, array: [imageview1,imageview2,imageview3])
        imageviewStack.addSubview(imageView)
        guideScrollview.addSubview(guideview)
        addsubviews(addingview: self, array: [guideScrollview,imageviewStack,onlystack])
        addsubviews(addingview: onlystack, array: [infoLabel,infoLabel2,pageview,getStartedButton,signInStack,continueasguestbutton])
        signInStack.spacing = 0
        //MARK:-> set constraints section
        NSLayoutConstraint(item: imageview1, attribute: .height, relatedBy: .equal, toItem: guideview, attribute: .height, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: imageview2, attribute: .height, relatedBy: .equal, toItem: guideview, attribute: .height, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: imageview1, attribute: .width, relatedBy: .equal, toItem: guideview, attribute: .width, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: imageview2, attribute: .width, relatedBy: .equal, toItem: guideview, attribute: .width, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: imageview3, attribute: .width, relatedBy: .equal, toItem: guideview, attribute: .width, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: imageview3, attribute: .height, relatedBy: .equal, toItem: guideview, attribute: .height, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: guideview, attribute: .width, relatedBy: .equal, toItem: guideScrollview, attribute: .width, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: guideview, attribute: .height, relatedBy: .equal, toItem: guideScrollview, attribute: .height, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: guideScrollview, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: guideScrollview, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 1, constant: 0).isActive = true
        imageviewStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":imageView]))
        imageviewStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[v0(60)]", options: [], metrics: nil, views: ["v0":imageView]))
        signInStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":signInLabel]))
        signInStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":signInLabel2]))
        signInStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0][v1(65)]|", options: [], metrics: nil, views: ["v0":signInLabel,"v1":signInLabel2]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0(265)]|", options: [], metrics: nil, views: ["v0":onlystack]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: [], metrics: nil, views: ["v0":onlystack]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: [], metrics: nil, views: ["v0":imageviewStack]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0(100)]", options: [], metrics: nil, views: ["v0":imageviewStack]))
        onlystack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v2(25)]-(5)-[v3(100)]-(10)-[v4(20)]-(10)-[v5(40)]-(10)-[v6(20)][v7(20)]-(5)-|", options: [], metrics: nil, views: ["v2":infoLabel,"v3":infoLabel2,"v4":pageview,"v5":getStartedButton,"v6":signInStack,"v7":continueasguestbutton]))
        onlystack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[v0(100)]|", options: [], metrics: nil, views: ["v0":continueasguestbutton]))
        onlystack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: [], metrics: nil, views: ["v0":infoLabel]))
        onlystack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: [], metrics: nil, views: ["v0":infoLabel2]))
        onlystack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(20)-[v0]-(20)-|", options: [], metrics: nil, views: ["v0":pageview]))
        onlystack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(20)-[v0]-(20)-|", options: [], metrics: nil, views: ["v0":getStartedButton]))
        onlystack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[v0]-(50)-|", options: [], metrics: nil, views: ["v0":signInStack]))
        //MARK:-> others
        NSLayoutConstraint(item: imageView, attribute: .centerXWithinMargins, relatedBy: .equal, toItem: imageviewStack, attribute: .centerXWithinMargins, multiplier: 1, constant: 0).isActive = true
        bringSubviewToFront(imageviewStack)
        bringSubviewToFront(onlystack)
        signInLabel.textAlignment = .right
        signInLabel.textColor = .white
        signInLabel.attributedText = NSAttributedString(string: "Already have an account?", attributes: [.font:UIFont(name: "Arial Italic", size: 14)])
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
