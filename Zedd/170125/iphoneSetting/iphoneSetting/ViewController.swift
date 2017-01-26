//
//  ViewController.swift
//  iphoneSetting
//
//  Created by Zedd on 2017. 1. 23..
//  Copyright © 2017년 최송이. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//       self.restorationIdentifier = "GeneralTable"
//        self.restorationClass = GeneralTableView.self
        let backItem = UIBarButtonItem()
        backItem.title = "Back"
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.title = "설정"
    }
    
//    class func viewController(withRestorationIdentifierPath identifierComponents: [Any], coder: NSCoder) -> UIViewController? {
//
//        let myViewController = GeneralTableView(nibName:"GeneralTable",bundle: nil )
//        return myViewController
//        
//    }
    // Backup & Restore function
   

}

