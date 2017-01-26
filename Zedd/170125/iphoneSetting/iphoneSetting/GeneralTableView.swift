//
//  GeneralTableView.swift
//  iphoneSetting
//
//  Created by Zedd on 2017. 1. 23..
//  Copyright © 2017년 최송이. All rights reserved.
//

import UIKit

let currentDate = NSDate()

let dateFormatter = DateFormatter()
var convertedDate = dateFormatter.string(from: currentDate as Date)
class GeneralTableView: UITableViewController{

    @IBAction func switch24HourButton(_ sender: Any){
        
//        let defaults = UserDefaults.standard
//        
//        if is24hour.isOn {
//            defaults.set(true, forKey: "SwitchState")//저장된 키값을 bool값으로 설정, true = >기본 데이터 베이스에 설정할 bool값.
//        } else {
//            defaults.set(false, forKey: "SwitchState")
//        }
        
        
        UserDefaults.standard.set(is24hour.isOn, forKey: "SwitchState")

        
    }
    
    @IBOutlet weak var is24hour: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.topItem?.title = "설정"
        
//        self.restorationIdentifier = "GeneralTable"
//        self.restorationClass = GeneralTableView.self

        
//        var defaults = UserDefaults.standard // Returns the shared defaults object.
//        
//        if (defaults.object(forKey: "SwitchState") != nil) {
//            is24hour
//                .isOn = defaults.bool(forKey: "SwitchState")
//        }
        
        is24hour.isOn =  UserDefaults.standard.bool(forKey: "SwitchState")
        // Returns the shared defaults object.

    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationItem.backBarButtonItem?.title = "설정"
    }
//    override func encodeRestorableState(with coder: NSCoder) {
//        coder.encode(is24hour.isOn, forKey: "SwitchState")
//        super.encodeRestorableState(with: coder)
//    }
    
    
    
//    override func decodeRestorableState(with coder: NSCoder) {
//        if let decodeObj = coder.decodeObject(forKey : "SwitchState")
//        {
//            is24hour.isOn = decodeObj as! Bool
//        }
//        super.decodeRestorableState(with: coder)
//    }
    
    
    
//    class func viewController(withRestorationIdentifierPath identifierComponents: [Any], coder: NSCoder) -> UIViewController? {
//        
//        let myViewController = GeneralTableView(nibName:"GeneralTable",bundle: nil )
//        return myViewController
//        
//    }
    
//    override func encodeRestorableState(with coder: NSCoder) {
//        print("===>encodeRestorableStateWithCoder")
//        coder.encode(is24hour, forKey:"SwitchState")
//        super.encodeRestorableState(with: coder)
//    }
//    
//    override func decodeRestorableState(with coder: NSCoder) {
//        print("===>decodeRestorableStateWithCoder")
//        if coder.decodeObject(forKey: "SwitchState") != nil {
//            is24hour = coder.decodeObject(forKey: "SwitchState") as! UISwitch!
//            
//        }
//        super.decodeRestorableState(with: coder)
//    }
//    
}
