//
//  startUPViewController.swift
//  Hydrate
//
//  Created by user on 06/05/2020.
//  Copyright © 2021 swift tech. All rights reserved.
//

import UIKit

class startUPViewController: UIViewController {
    var guideScrollview: UIScrollView?
    var pageview: UIPageControl?
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        let mainview = UIView()
        mainview.backgroundColor = UIColor(named: "baby powder")
        view.addSubview(mainview)
        view.backgroundColor = .white
        let guide = view.safeAreaLayoutGuide
        mainview.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: mainview, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: mainview, attribute: .height, relatedBy: .equal, toItem: view, attribute: .height, multiplier: 1, constant: 0).isActive = true
        mainview.topAnchor.constraint(equalTo: guide.topAnchor, constant: 1).isActive = true
        setupViewandConstraints(view: mainview)
        }
    override func viewWillAppear(_ animated: Bool) {
        
    }
    func setupViewandConstraints(view: UIView){
        //MARK: - > Initialization section
        let logo = UIImage(named: "logo")
         let imageView = UIImageView(image: logo)
        let parentStack = UIStackView()
        guideScrollview = UIScrollView()
        let imageview1 = UIImageView(image: UIImage(named: "osi"))
        let imageview2 = UIImageView(image: UIImage(named: "logo"))
        let imageviewStack = UIStackView()
        let arrayofImageViews = [imageview1,imageview2]
        let infoLabel = UILabel()
        let infoLabel2 = UILabel()
        let pageview = UIPageControl()
        let getStartedButton = UIButton()
        let signInStack = UIStackView()
        let signInLabel = UILabel()
        let signInButton = UIButton()
        let scrollviewStack = UIStackView()
        //MARK:-> set properties section
        imageView.contentMode = .scaleAspectFit
        view.addSubview(parentStack)
        guideScrollview!.isPagingEnabled = true
        imageview1.contentMode = .scaleAspectFit
        imageview2.contentMode = .scaleAspectFit
        parentStack.translatesAutoresizingMaskIntoConstraints = false
        guideScrollview!.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageview1.translatesAutoresizingMaskIntoConstraints = false
        imageview2.translatesAutoresizingMaskIntoConstraints = false
        imageviewStack.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        infoLabel2.translatesAutoresizingMaskIntoConstraints = false
        pageview.translatesAutoresizingMaskIntoConstraints = false
        getStartedButton.translatesAutoresizingMaskIntoConstraints = false
        signInStack.translatesAutoresizingMaskIntoConstraints = false
        signInLabel.translatesAutoresizingMaskIntoConstraints = false
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        scrollviewStack.translatesAutoresizingMaskIntoConstraints = false
        imageviewStack.axis = .horizontal
        scrollviewStack.axis = .horizontal
        guideScrollview!.frame = CGRect(x: 0, y: 0, width: scrollviewStack.frame.width, height: scrollviewStack.frame.height)
        for i in 0..<arrayofImageViews.count{
            arrayofImageViews[i].frame = CGRect(x: view.frame.size.width * CGFloat(i), y: 0, width: view.frame.size.width, height: CGFloat(scrollviewStack.frame.height))
            guideScrollview!.addSubview(arrayofImageViews[i])
        }
        guideScrollview!.contentSize = CGSize(width: scrollviewStack.frame.width * CGFloat(arrayofImageViews.count), height: CGFloat(scrollviewStack.frame.height))
        signInStack.axis = .horizontal
        signInStack.addSubview(signInLabel)
        signInStack.addSubview(signInButton)
        imageviewStack.addSubview(imageView)
        scrollviewStack.addSubview(guideScrollview!)
        parentStack.addSubview(imageviewStack)
        parentStack.addSubview(scrollviewStack)
        parentStack.addSubview(infoLabel)
        parentStack.addSubview(infoLabel2)
        parentStack.addSubview(pageview)
        parentStack.addSubview(getStartedButton)
        parentStack.addSubview(signInStack)
        parentStack.axis = .vertical
        signInStack.spacing = 0
        infoLabel.backgroundColor = .systemBlue
        infoLabel2.backgroundColor = .systemPink
        pageview.pageIndicatorTintColor = .black
        pageview.currentPageIndicatorTintColor = .systemBlue
        getStartedButton.backgroundColor = .systemBlue
        signInButton.setTitleColor(UIColor.blue, for: .normal)
        getStartedButton.setTitle("Get Started", for: .normal)
        getStartedButton.layer.cornerRadius = CGFloat(8)
        infoLabel.textAlignment = .center
        infoLabel2.textAlignment = .center
        signInLabel.textAlignment = .right
        signInLabel.text = "Already have an account?"
        signInLabel.textColor = UIColor(named: "firstshade")
        signInButton.setTitle("Sign in", for: .normal)
        pageview.numberOfPages = 3
        pageview.currentPage = 0
        signInButton.addTarget(self, action: #selector(presentloginview), for: .touchUpInside)
        guideScrollview!.delegate = self
        //MARK:-> set constraints section
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":parentStack]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: [], metrics: nil, views: ["v0":parentStack]))
        imageviewStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":imageView]))
        imageviewStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[v0(60)]", options: [], metrics: nil, views: ["v0":imageView]))
        signInStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":signInLabel]))
        signInStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":signInButton]))
        signInStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0][v1(65)]|", options: [], metrics: nil, views: ["v0":signInLabel,"v1":signInButton]))
        parentStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0(60)]-(10)-[v1(300)]-(20)-[v2(50)]-(15)-[v3(100)]-(10)-[v4(20)]-(10)-[v5(40)]-(10)-[v6(20)]", options: [], metrics: nil, views: ["v0":imageviewStack,"v1": scrollviewStack,"v2":infoLabel,"v3":infoLabel2,"v4":pageview,"v5":getStartedButton,"v6":signInStack]))
        parentStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: [], metrics: nil, views: ["v0":imageviewStack]))
        parentStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: [], metrics: nil, views: ["v0":scrollviewStack]))
        parentStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: [], metrics: nil, views: ["v0":infoLabel]))
        parentStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: [], metrics: nil, views: ["v0":infoLabel2]))
        parentStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(20)-[v0]-(20)-|", options: [], metrics: nil, views: ["v0":pageview]))
        parentStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(20)-[v0]-(20)-|", options: [], metrics: nil, views: ["v0":getStartedButton]))
        parentStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[v0]-(65)-|", options: [], metrics: nil, views: ["v0":signInStack]))
        NSLayoutConstraint(item: imageview1, attribute: .width, relatedBy: .equal, toItem: guideScrollview, attribute: .width, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: imageview2, attribute: .width, relatedBy: .equal, toItem: guideScrollview, attribute: .width, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: imageview1, attribute: .height, relatedBy: .equal, toItem: guideScrollview, attribute: .width, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: imageview2, attribute: .height, relatedBy: .equal, toItem: guideScrollview, attribute: .width, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: imageView, attribute: .centerXWithinMargins, relatedBy: .equal, toItem: imageviewStack, attribute: .centerXWithinMargins, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: imageView, attribute: .centerYWithinMargins, relatedBy: .equal, toItem: imageviewStack, attribute: .centerYWithinMargins, multiplier: 1, constant: 0).isActive = true
//        NSLayoutConstraint(item: imageview2, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: parentStack.bounds.width).isActive = true
//        NSLayoutConstraint(item: imageview2, attribute: .height
//                           , relatedBy: .equal, toItem: guideScrollview, attribute: .height, multiplier: 1, constant: 0).isActive = true
//        NSLayoutConstraint(item: imageview1, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: parentStack.bounds.width).isActive = true
//        NSLayoutConstraint(item: imageview1, attribute: .height
//                           , relatedBy: .equal, toItem: guideScrollview, attribute: .height, multiplier: 1, constant: 0).isActive = true
        
        //guideScrollview.edgeTo(view: view)
        //MARK:-> others
        NSLayoutConstraint(item: guideScrollview!, attribute: .leading, relatedBy: .equal, toItem: scrollviewStack, attribute: .leading, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: guideScrollview!, attribute: .trailing, relatedBy: .equal, toItem: scrollviewStack, attribute: .trailing, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: guideScrollview!, attribute: .top, relatedBy: .equal, toItem: scrollviewStack, attribute: .top, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: guideScrollview!, attribute: .bottom, relatedBy: .equal, toItem: scrollviewStack, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
        for i in 0..<arrayofImageViews.count{
            NSLayoutConstraint(item: arrayofImageViews[i], attribute: .leading, relatedBy: .equal, toItem: scrollviewStack, attribute: .leading, multiplier: 1, constant: 0).isActive = true
            NSLayoutConstraint(item: arrayofImageViews[i], attribute: .trailing, relatedBy: .equal, toItem: scrollviewStack, attribute: .trailing, multiplier: 1, constant: 0).isActive = true
            NSLayoutConstraint(item: arrayofImageViews[i], attribute: .top, relatedBy: .equal, toItem: scrollviewStack, attribute: .top, multiplier: 1, constant: 0).isActive = true
            NSLayoutConstraint(item: arrayofImageViews[i], attribute: .bottom, relatedBy: .equal, toItem: scrollviewStack, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
        }
        let constraint = guideScrollview!.trailingAnchor.constraint(equalTo: guideScrollview!.trailingAnchor)
        constraint.priority = UILayoutPriority(250)
        constraint.isActive = true
        let constraint2 = guideScrollview!.leadingAnchor.constraint(equalTo: guideScrollview!.trailingAnchor)
        constraint2.priority = UILayoutPriority(250)
        constraint2.isActive = true
    }
    @objc func presentloginview(){
        let login_page = loginViewController()
        let navigation_login_page = UINavigationController(rootViewController: login_page)
        navigation_login_page.modalPresentationStyle = .fullScreen
        present(navigation_login_page, animated: true, completion: nil)
    }
}
extension startUPViewController: UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }
}
