//
//  TextSizeViewController.swift
//  SettingsApp
//
//  Created by LimJaemin on 2017. 1. 24..
//  Copyright © 2017년 LimJaemin. All rights reserved.
//

import UIKit

class TextSizeViewController: UIViewController {
    let defaults = UserDefaults.standard
    
    @IBOutlet var labelTop: UILabel!
    @IBOutlet var labelBottom: UILabel!
    @IBOutlet var sliderTextSize: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sliderTextSize.value = defaults.float(forKey: "textSize")
        changeLabelTextSize(size: sliderTextSize.value)
    }
    
    @IBAction func changeTextSize(_ sender: UISlider) {
        sender.setValue(Float(Int(sender.value)), animated: true)
        changeLabelTextSize(size: sender.value)
        defaults.set(sender.value, forKey: "textSize")
    }
    
    func changeLabelTextSize(size: Float){
        labelTop.font = UIFont.systemFont(ofSize: CGFloat(size))
    }
}
