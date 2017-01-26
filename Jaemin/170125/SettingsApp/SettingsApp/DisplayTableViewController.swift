//
//  DisplayViewController.swift
//  SettingsApp
//
//  Created by LimJaemin on 2017. 1. 24..
//  Copyright © 2017년 LimJaemin. All rights reserved.
//

import UIKit

class DisplayTableViewController: UITableViewController {
    let defaults = UserDefaults.standard

    @IBOutlet var sliderDisplayBrightness: UISlider!
    @IBOutlet var switchAutoBrightness: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sliderDisplayBrightness.value = defaults.float(forKey: "brightness")
        switchAutoBrightness.isOn = defaults.bool(forKey: "autoBrightness")
    }

    @IBAction func changeDisplayBrightness(_ sender: UISlider) {
        UIScreen.main.brightness = CGFloat(sender.value)
        defaults.set(sender.value, forKey: "brightness")
    }

    @IBAction func changeAutoBrightness(_ sender: UISwitch) {
        UIScreen.main.wantsSoftwareDimming = Bool(sender.isOn)
        defaults.set(sender.isOn, forKey: "autoBrightness")
    }
}

