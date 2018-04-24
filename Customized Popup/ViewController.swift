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
    
    let pv = CustomizedPopup()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.groupTableViewBackground
        
        let rightBarButton = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(self.rightButton))
        self.navigationItem.rightBarButtonItem = rightBarButton
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    @objc
    private func rightButton() {
        pv.hide()
    }
    
    @IBAction func alertWithImage(_ sender: UIButton) {
        pv.delegate = self
        pv.alertWithImage(image: #imageLiteral(resourceName: "default"), message: "Hey Check this is awesome na ????", showCancelButton: true)
    }
    @IBAction func simpleAlert(_ sender: UIButton) {
        pv.delegate = self
        pv.simpleAlert(title: "Hello Alert", message: "Alert and say is this a problem or not :D :D", showCancelButton: false)
    }
    func customizedOkButtonTapped(obj: UIButton) {
        print("ok button called hello")
    }
    
    @IBAction func tapButton(_ sender: Any) {
        pv.delegate = self
        pv.alertWithMapView(latitude: -27.084, longitude: 18.212)
//        pv.alertWithImage(image: #imageLiteral(resourceName: "default"), message: "Hey I just came across this stuff.. Wanna check this ?????", showCancelButton: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

