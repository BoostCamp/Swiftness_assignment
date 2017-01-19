//
//  ViewController.swift
//  ImagePickerAssignment
//
//  Created by LimJaemin on 2017. 1. 19..
//  Copyright © 2017년 LimJaemin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.openAlertView))
        
        imageView.addGestureRecognizer(tap)
        imageView.isUserInteractionEnabled = true
        
    }
    
    func openAlertView() {
        let controller = UIAlertController(title: "사진 소스 선택", message: "사진을 가져올 소스를 선택해 주세요",
                                           preferredStyle: UIAlertControllerStyle.actionSheet)
        
        let photoLibraryAction = UIAlertAction(title: "라이브러리", style: UIAlertActionStyle.default)
        let photoAlbumAction = UIAlertAction(title: "사진앨범", style: UIAlertActionStyle.default)
        let cancelAction = UIAlertAction(title: "취소", style: UIAlertActionStyle.cancel) { action in
            self.dismiss(animated: true, completion: nil)
        }
        
        controller.addAction(photoLibraryAction)
        controller.addAction(photoAlbumAction)
        controller.addAction(cancelAction)
        
        self.present(controller, animated: true, completion: nil)
    }
    
}

