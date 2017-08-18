//
//  ViewController.swift
//  EatingAlone
//
//  Created by ktds 20 on 2017. 8. 18..
//  Copyright © 2017년 CJON, Inc. All rights reserved.
//

import UIKit

protocol AddUserInfoDelegate {
    func sendUserInfo(userInfo:UserInfo)
}

class ViewController: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource {

    var delegate : AddUserInfoDelegate?
    
    @IBOutlet weak var userLocalPickerView: UIPickerView!
    
    @IBOutlet weak var userTimePickerView: UIPickerView!
    
    @IBOutlet weak var userImageView: UIImageView!
    
    var localPickerData:[String] = [String]()
    var timePickerData:[String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.userLocalPickerView.delegate = self
        self.userLocalPickerView.dataSource = self
        
        self.localPickerData = ["홍대", "종로", "강남", "상암"]
        
        self.userTimePickerView.delegate = self
        self.userTimePickerView.dataSource = self
        
        self.timePickerData = ["아침", "점심", "저녁"]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == userLocalPickerView {
            return localPickerData.count
        }else if pickerView == userTimePickerView {
            return timePickerData.count
        }
        
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == userLocalPickerView {
            return localPickerData[row]
        } else if pickerView == userTimePickerView {
            return timePickerData[row]
        }
        return nil
    }
}

extension ViewController : UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        var resultImage:UIImage?
        if let editedImage = info[UIImagePickerControllerEditedImage] as? UIImage {
            resultImage = editedImage
            self.userImageView.image = resultImage
        }
        picker.dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}

extension ViewController : UIGestureRecognizerDelegate {
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        
        let imagePickerController = UIImagePickerController()
        
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.allowsEditing = true
        imagePickerController.delegate = self
        
        self.present(imagePickerController, animated: true)
        return true
        
    }
}




