//
//  WallpaperViewController.swift
//  iphoneSetting
//
//  Created by Zedd on 2017. 1. 24..
//  Copyright © 2017년 최송이. All rights reserved.
//

import UIKit

class WallpaperViewController: UITableViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate{

    @IBOutlet weak var imagePickerView: UIImageView!
    let imagePicker = UIImagePickerController()
    
    @IBAction func pickWallpaper(_ sender: Any) {
        
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        present(imagePicker, animated: true, completion: nil)
        

        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imagePickerView.contentMode = .scaleAspectFit
            imagePickerView.image = image
            
            
        }
        dismiss(animated: true, completion: nil)
      
        
        
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.topItem?.title = "설정"
        

        imagePickerView.image = UIImage.init(data: UserDefaults.standard.data(forKey: "imageView")!)
        
    }

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
    override func encodeRestorableState(with coder: NSCoder) {
        print("===>encodeRestorableStateWithCoder")
        coder.encode(imagePickerView.image, forKey:"imageView")
        super.encodeRestorableState(with: coder)
    }
    
    override func decodeRestorableState(with coder: NSCoder) {
        print("===>decodeRestorableStateWithCoder")
        if coder.decodeObject(forKey: "imageView") != nil {
            imagePickerView.image = coder.decodeObject(forKey: "imageView") as! UIImage
        }
        super.decodeRestorableState(with: coder)
    }
    
}
