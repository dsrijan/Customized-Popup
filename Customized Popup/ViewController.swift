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
    
    func customizedOkButtonTapped(obj: UIButton) {
        print("ok button called hello")
    }
    
    @IBAction func tapButton(_ sender: Any) {
        pv.delegate = self
        pv.alertWithMapView()
//        pv.alertWithImage(image: #imageLiteral(resourceName: "default"), message: "Hey I just came across this stuff.. Wanna check this ?????", showCancelButton: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

