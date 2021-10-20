//
//  startUPViewController.swift
//  Hydrate
//
//  Created by user on 06/05/2020.
//  Copyright © 2021 swift tech. All rights reserved.
//

import UIKit

class startUPViewController: UIViewController {
    var startup = startUpView()
    var arrayofImageViews: [UIImageView]?
    let dataofapp = DataOfApp()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        view.addSubview(startup)
        startup.frame = view.frame
        arrayofImageViews = [startup.imageview1,startup.imageview2,startup.imageview3]
        configureStartUpView()
    }
    
    override func viewDidLayoutSubviews() {
        
        for i in 0..<arrayofImageViews!.count{
            arrayofImageViews![i].frame = CGRect(x: view.frame.size.width * CGFloat(i), y: 0, width:    startup.frame.size.width, height: startup.frame.height)
        }
        startup.guideScrollview.contentSize = CGSize(width: startup.frame.width * 3, height: startup.frame.height)
    }
    
    func configureStartUpView() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(presentloginview))
        startup.signInLabel2.addGestureRecognizer(gesture)
        startup.guideScrollview.delegate = self
        startup.continueasguestbutton.addTarget(self, action: #selector(pushtohomeView), for: .touchUpInside)
    }
        
    @objc func presentloginview(){
        let login_page = loginViewController()
        let navigation_login_page = UINavigationController(rootViewController: login_page)
        navigation_login_page.modalPresentationStyle = .fullScreen
        present(navigation_login_page, animated: true, completion: nil)
    }
    @objc func pushtohomeView(){
        let homeview = tabViewController()
        let nav = UINavigationController()
        nav.pushViewController(homeview, animated: true)
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: true, completion: nil)
    }
}
extension startUPViewController: UIScrollViewDelegate{
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let value = Int(floor(startup.guideScrollview.contentOffset.x/view.frame.width))
        startup.pageview.currentPage = value
        startup.infoLabel.text = dataofapp.writeup[value].infolabel
        startup.infoLabel2.text = dataofapp.writeup[value].infolabel2
    }
}
