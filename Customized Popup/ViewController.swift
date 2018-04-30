//
//  ViewController.swift
//  Customized Popup
//
//  Created by Srijan on 24/04/18.
//  Copyright © 2018 Srijan. All rights reserved.
//

import UIKit
import CustomizedPopup

class ViewController: UIViewController, CustomizedPopupDelegate {
    
    let alertController = CustomizedPopup()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.groupTableViewBackground
        
        let rightBarButton = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(self.rightButton))
        self.navigationItem.rightBarButtonItem = rightBarButton
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    @objc
    private func rightButton() {
        alertController.hide()
    }
    
    @IBAction func alertWithImage(_ sender: UIButton) {
        alertController.delegate = self
        alertController.height = 200.0
        alertController.alertTextColor = UIColor.darkGray
        alertController.cancelButtonBackGroundColor = UIColor.red
        alertController.cancelButtonTextColor = UIColor.white
        alertController.cornerRadius = 20.0
        alertController.okButtonTextColor = UIColor.white
        alertController.backGroundColor = UIColor.lightGray
        alertController.okButtonBackGroundColor = UIColor.darkGray
        alertController.alertWithImage(image: #imageLiteral(resourceName: "default"), message: "Hey Check this is awesome na ???? Something looks too cool bro. Ohh this is popup", showCancelButton: true)
    }
    @IBAction func simpleAlert(_ sender: UIButton) {
        alertController.delegate = self
        alertController.simpleAlert(title: "Hello Alert", message: "Alert and say is this a problem or not :D :D", showCancelButton: false)
    }
    func customizedOkButtonTapped(obj: UIButton) {
        print("ok button called hello")
    }
    
    @IBAction func tapButton(_ sender: Any) {
        alertController.delegate = self
        alertController.alertWithMapView(latitude: 37.57554038, longitude: -122.40068475)
//        alertController.alertWithImage(image: #imageLiteral(resourceName: "default"), message: "Hey I just came across this stuff.. Wanna check this ?????", showCancelButton: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

