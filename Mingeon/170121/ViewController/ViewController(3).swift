//
//  ViewController.swift
//  Homework
//
//  Created by MinGeon Ju on 2017. 1. 20..
//  Copyright © 2017년 MinGeon Ju. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIAlertViewDelegate {

    @IBOutlet weak var imagePickerView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
    
    private func showPicker(sourceType: UIImagePickerControllerSourceType) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = sourceType
        self.present(imagePicker, animated: true, completion: nil)
    }
    

    @IBAction func tap(_ sender: Any) {
        let controller = UIAlertController()
        controller.title = "사진소스선택"
        controller.message = "사진을 가져올 소스를 선택해 주세요"
        
        
        let libraryAction = UIAlertAction(title: "라이브러리", style: UIAlertActionStyle.default, handler: {
            action in
            self.showPicker(sourceType: .photoLibrary)
        })
        
        let albumAction = UIAlertAction(title: "사진앨범", style: UIAlertActionStyle.default){
            action in
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .savedPhotosAlbum
            self.present(imagePicker, animated: true, completion: nil)
        }
        let cancelAction = UIAlertAction(title: "취소", style: UIAlertActionStyle.cancel){
            action in
            self.dismiss(animated: true, completion: nil)
        }
        
        controller.addAction(libraryAction)
        controller.addAction(albumAction)
        controller.addAction(cancelAction)
        self.present(controller, animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imagePickerView.image = image
            imagePickerView.contentMode = UIViewContentMode.scaleAspectFit
            dismiss(animated: true, completion: nil)
            let alertView = UIAlertController(title:"이미지를 성공적으로 가져왔어요",message: nil,preferredStyle:UIAlertControllerStyle.alert)
            let okButton = UIAlertAction(title: "확인", style:UIAlertActionStyle.default){
                action in self.dismiss(animated: true, completion: nil)
            }
            alertView.addAction(okButton)
            self.present(alertView, animated: true, completion: nil)
//            let alertView = UIAlertView()
//            alertView.title = "이미지를 성공적으로 가져왔어요"
//            alertView.addButton(withTitle: "확인")
//            alertView.show()
            
        }
    }
    
}

