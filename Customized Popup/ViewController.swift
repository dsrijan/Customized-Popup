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
        
        let rightBarButton = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(self.rightButton))
        self.navigationItem.rightBarButtonItem = rightBarButton
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    @objc
    private func rightButton() {
        pv.hide()
    }
    
    func okButtonTapped() {
        print("Ok button calling..yehhhhhh")
    }
    
    @IBAction func tapButton(_ sender: Any) {
        
        pv.cornerRadius = 10.0
        pv.height =  180.0
        pv.delegate = self
        pv.backGroundColor = UIColor.orange
        pv.simpleAlert(title: "Alert", message: "Do you like our product.", showCancelButton: false)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

