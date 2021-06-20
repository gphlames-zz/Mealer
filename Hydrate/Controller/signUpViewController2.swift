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
    var customerdetails = CustomerDetail()
    var signUpView = signUpView2()
    var data = DataOfApp()
    var attributes: [NSAttributedString.Key: UIFont] = {
        return [.font: UIFont(name: "Arial", size: 12)!]
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(signUpView.mainview)
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
        signUpView.mainview.topAnchor.constraint(equalTo: topguide.topAnchor, constant: 1).isActive = true
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
        NSLayoutConstraint(item: signUpView.mainview, attribute: .height, relatedBy: .equal, toItem: view, attribute: .height, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: signUpView.mainview, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 1, constant: 0).isActive = true
//        signUpView.cmLabel.attributedText = NSAttributedString(string: "cm", attributes: [.font: UIFont(name: "Arial", size: 14)])
//        signUpView.feetLabel.attributedText = NSAttributedString(string: "ft", attributes: [.font: UIFont(name: "Arial", size: 14)])
//        signUpView.presentpoundLabel.attributedText = NSAttributedString(string: "lb", attributes: [.font: UIFont(name: "Arial", size: 14)])
        signUpView.countryPicker.showPhoneCodeInView = false
        signUpView.setConstraints()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        
        
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

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
