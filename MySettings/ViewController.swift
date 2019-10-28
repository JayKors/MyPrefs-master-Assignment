//
//  ViewController.swift
//  MyPrefs
//
//  Created by Charles Konkol on 10/21/19.
//  Copyright © 2019 Charles Konkol. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var txtFullName: UITextField!
    
    @IBOutlet weak var txtPreferredName: UITextField!
    
    @IBOutlet weak var txtPhoneNumber: UITextField!
    
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var txtAddress: UITextField!
    
    @IBOutlet weak var datepicker: UIDatePicker!
    
    @IBAction func btnSave(_ sender: Any) {
        let defaults: UserDefaults = UserDefaults.standard
            defaults.set(self.txtFullName.text, forKey: "fullname")
            defaults.set(self.txtPreferredName.text, forKey: "preferredname")
            defaults.set(self.txtPhoneNumber.text, forKey: "phonenumber")
            defaults.set(self.txtEmail.text, forKey: "email")
            defaults.set(self.txtAddress.text, forKey: "address")
              let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMM d, yyyy" //Your New Date format as per requirement change it own
            let newDate = dateFormatter.string(from:datepicker.date) //pass Date here
            defaults.set(newDate, forKey: "bdate")
            print(self.txtFullName.text!)
            print(self.txtPreferredName.text!)
            print(self.txtPhoneNumber.text!)
            print(self.txtEmail.text!)
            print(self.txtAddress.text!)
            print(datepicker.date.description)
            defaults.synchronize()
            clear()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let defaults: UserDefaults = UserDefaults.standard
              if defaults.string(forKey: "fullname") != nil{
                    txtFullName.text = defaults.string(forKey: "fullname")
              }
              if defaults.string(forKey: "preferredname") != nil{
                    txtPreferredName.text = defaults.string(forKey: "preferredname")
              }
              if defaults.string(forKey: "phonenumber") != nil{
                    txtPhoneNumber.text = defaults.string(forKey: "phonenumber")
              }
              if defaults.string(forKey: "email") != nil{
                  txtEmail.text = defaults.string(forKey: "email")
              }
              if defaults.string(forKey: "address") != nil{
                  txtAddress.text = defaults.string(forKey: "address")
              }
              if defaults.string(forKey: "bdate") != nil{
                  let bdate  = defaults.string(forKey: "bdate")
                  let dateFormatter = DateFormatter()
                  dateFormatter.dateFormat = "MMM d, yyyy" //Your date format
                  let date = dateFormatter.date(from: bdate!) //according to date format your date string
                  datepicker.setDate(date!, animated: true)
              }
    }
    
   func clear()
   {
    txtFullName.resignFirstResponder()
    txtPreferredName.resignFirstResponder()
    txtPhoneNumber.resignFirstResponder()
    txtEmail.resignFirstResponder()
    txtAddress.resignFirstResponder()
    }


}

