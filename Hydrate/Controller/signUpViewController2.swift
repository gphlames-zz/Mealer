//
//  signUpViewController2.swift
//  Hydrate
//
//  Created by user on 06/05/2020.
//  Copyright © 2021 swift tech. All rights reserved.
//

import UIKit
import CountryPickerView

class signUpViewController2: UIViewController{
    var customerSelectedPriorities: [String:Bool]?
    var customerdetails = CustomerDetail(customerID: "", firstname: "", lastname: "", age: 0, birthday: 0, country: "", pound: true, feetboolean: true, currentweight: 0, desiredweight: 0, sex: false, feet: 0, inches: 0, cm: 0)
    var signUpView = signUpView2()
    var data = DataOfApp()
    var attributes: [NSAttributedString.Key: UIFont] = {
        return [.font: UIFont(name: "Arial", size: 12)!]
    }()
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(signUpView)
        signUpView.frame = view.frame
        // MARK: -  initialization and properties section
        view.backgroundColor = .white
        signUpView.feetPicker.delegate = self
        signUpView.inchesPicker.delegate = self
        signUpView.feetPicker.dataSource = self
        signUpView.inchesPicker.dataSource = self
        signUpView.countryPicker.delegate = self
        signUpView.countryPicker.dataSource = self
        signUpView.feetPicker.tintColor = .black
        signUpView.inchesPicker.tintColor = .black
        navigationController?.navigationBar.isHidden = true
        let topguide = view.safeAreaLayoutGuide
        signUpView.topAnchor.constraint(equalTo: topguide.topAnchor, constant: 1).isActive = true
        signUpView.bottomAnchor.constraint(equalTo: topguide.bottomAnchor, constant: 1).isActive = true
        signUpView.backButton.addTarget(self, action: #selector(dismissview), for: .touchUpInside)
        let views = [signUpView.presentpoundLabel,signUpView.presentkilogramLabel,signUpView.futurepoundLabel,signUpView.futurekilogramLabel,signUpView.maleLabel,signUpView.femaleLabel,signUpView.feetLabel,signUpView.cmLabel]
        for i in views{
            let gesture = UITapGestureRecognizer(target: self, action: #selector(tap(sender:)))
            gesture.delegate = self
            i.addGestureRecognizer(gesture)
        }
        if customerdetails.pound{
            signUpView.presentpoundLabel.backgroundColor = UIColor(named: "firstshade")
            signUpView.futurepoundLabel.backgroundColor = UIColor(named: "firstshade")
            signUpView.presentkilogramLabel.backgroundColor = .lightGray
            signUpView.futurekilogramLabel.backgroundColor = .lightGray
        }else{
            signUpView.futurepoundLabel.backgroundColor = UIColor(named: "firstshade")
            signUpView.presentpoundLabel.backgroundColor = UIColor(named: "firstshade")
            signUpView.futurekilogramLabel.backgroundColor = .lightGray
            signUpView.presentkilogramLabel.backgroundColor = .lightGray
        }
        if customerdetails.feetboolean{
            signUpView.feetLabel.backgroundColor = UIColor(named: "firstshade")
            signUpView.cmLabel.backgroundColor = .lightGray
            signUpView.cmTextField.isHidden = true
        }else{
            signUpView.cmLabel.backgroundColor = UIColor(named: "firstshade")
            signUpView.feetLabel.backgroundColor = .lightGray
            signUpView.feetPicker.isHidden = true
            signUpView.inchesPicker.isHidden = true
        }
        if customerdetails.sex{
            signUpView.maleLabel.backgroundColor = UIColor(named: "firstshade")
            signUpView.femaleLabel.backgroundColor = .lightGray
        }else{
            signUpView.maleLabel.backgroundColor = .lightGray
            signUpView.femaleLabel.backgroundColor = UIColor(named: "firstshade")
        }
        signUpView.continueButton.addTarget(self, action: #selector(continuefunc), for: .touchUpInside)
        // MARK: -  contrainsts section
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: [], metrics: nil, views: ["v0":signUpView]))
        signUpView.countryPicker.showPhoneCodeInView = false
    }
    override func viewDidAppear(_ animated: Bool) {
        addbottomlayer([signUpView.presentweightStack,signUpView.futureweightStack,signUpView.allergiesTextField])

    }
    @objc func tap(sender: UITapGestureRecognizer){
        let the_sender = sender.view as! UILabel
        switch the_sender {
        case signUpView.presentpoundLabel:
            signUpView.presentpoundLabel.backgroundColor = UIColor(named: "firstshade")
            signUpView.futurepoundLabel.backgroundColor = UIColor(named: "firstshade")
            signUpView.presentkilogramLabel.backgroundColor = .lightGray
            signUpView.futurekilogramLabel.backgroundColor = .lightGray
            customerdetails.pound = true
        case signUpView.presentkilogramLabel:
            signUpView.presentkilogramLabel.backgroundColor = UIColor(named: "firstshade")
            signUpView.futurekilogramLabel.backgroundColor = UIColor(named: "firstshade")
            signUpView.presentpoundLabel.backgroundColor = .lightGray
            signUpView.futurepoundLabel.backgroundColor = .lightGray
            customerdetails.pound = false
        case signUpView.futurepoundLabel:
            signUpView.futurepoundLabel.backgroundColor = UIColor(named: "firstshade")
            signUpView.presentpoundLabel.backgroundColor = UIColor(named: "firstshade")
            signUpView.futurekilogramLabel.backgroundColor = .lightGray
            signUpView.presentkilogramLabel.backgroundColor = .lightGray
            customerdetails.pound = true
        case signUpView.futurekilogramLabel:
            signUpView.futurepoundLabel.backgroundColor = .lightGray
            signUpView.presentpoundLabel.backgroundColor = .lightGray
            signUpView.futurekilogramLabel.backgroundColor = UIColor(named: "firstshade")
            signUpView.presentkilogramLabel.backgroundColor = UIColor(named: "firstshade")
            customerdetails.pound = false
        case signUpView.maleLabel:
            signUpView.femaleLabel.backgroundColor = .lightGray
            signUpView.maleLabel.backgroundColor = UIColor(named: "firstshade")
            customerdetails.sex = true
        case signUpView.femaleLabel:
            signUpView.femaleLabel.backgroundColor = UIColor(named: "firstshade")
            signUpView.maleLabel.backgroundColor = .lightGray
            customerdetails.sex = false
        case signUpView.feetLabel:
            signUpView.feetPicker.isHidden = false
            signUpView.inchesPicker.isHidden = false
            signUpView.feet_Label.isHidden = false
            signUpView.inches_Label.isHidden = false
            signUpView.cmTextField.isHidden = true
            signUpView.feetLabel.backgroundColor = UIColor(named: "firstshade")
            signUpView.cmLabel.backgroundColor = .lightGray
        case signUpView.cmLabel:
            signUpView.feetPicker.isHidden = true
            signUpView.inchesPicker.isHidden = true
            signUpView.feet_Label.isHidden = true
            signUpView.inches_Label.isHidden = true
            signUpView.cmTextField.isHidden = false
            signUpView.cmLabel.backgroundColor = UIColor(named: "firstshade")
            signUpView.feetLabel.backgroundColor = .lightGray
        default:
            break
        }
        
       
    }
    @objc func dismissview(){
        dismiss(animated: true, completion: nil)
    }
    @objc func continuefunc(){
        let signUpcontroller3 = signUpViewController3()
        signUpcontroller3.modalPresentationStyle = .fullScreen
        present(signUpcontroller3, animated: true, completion: nil)
    }
    func addbottomlayer(_ inview: [UIView]){
        for i in inview{
            let layer = CALayer()
            layer.frame = CGRect(x: 0, y: Int(i.frame.height) - 1, width: Int(i.frame.width), height: 1)
            layer.backgroundColor = UIColor.systemBlue.cgColor
            i.layer.addSublayer(layer)
        }
    }


}
extension signUpViewController2: UIGestureRecognizerDelegate{
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
extension signUpViewController2: UIPickerViewDelegate,UIPickerViewDataSource,CountryPickerViewDelegate,CountryPickerViewDataSource{
    func countryPickerView(_ countryPickerView: CountryPickerView, didSelectCountry country: Country) {
        
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == signUpView.feetPicker{
            return data.feet.count
        }else if pickerView == signUpView.inchesPicker{
            return data.inches.count
        }else if pickerView == signUpView.countryPicker{
            return data.countries.count
        }
        return 1
    }
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        if pickerView == signUpView.feetPicker{
//            return data.feet[row]
//        }else if pickerView == signUpView.inchesPicker{
//            return data.inches[row]
//        }
//        return nil
//    }
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let label = UILabel()
        if pickerView == signUpView.feetPicker{
            label.font = UIFont(name: "Aerial", size: 10)
            label.textAlignment = .center
            label.text = data.feet[row]
        }else if pickerView == signUpView.inchesPicker{
            label.font = UIFont(name: "Aerial", size: 10)
            label.textAlignment = .center
            label.text = data.inches[row]
        }else if pickerView == signUpView.countryPicker{
            label.font = UIFont(name: "Aerial", size: 10)
            label.textAlignment = .center
            label.text = data.countries[row]
            label.backgroundColor = .white
            pickerView.backgroundColor = .white
            pickerView.sizeToFit()
        }
        return label
    }
}
