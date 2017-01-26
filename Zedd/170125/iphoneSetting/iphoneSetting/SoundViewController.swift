//
//  SoundViewController.swift
//  iphoneSetting
//
//  Created by Zedd on 2017. 1. 24..
//  Copyright © 2017년 최송이. All rights reserved.
//

import UIKit

class SoundViewController: UITableViewController {

    @IBAction func soundAdjustAction(_ sender: Any) {
        UserDefaults.standard.set(soundSlider.value, forKey: "soundSlider")
        
    }
    @IBOutlet weak var soundSlider: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.topItem?.title = "설정"
        
        soundSlider.value = UserDefaults.standard.float(forKey: "soundSlider")
        
        
        
        }


        // Do any additional setup after loading the view.
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
