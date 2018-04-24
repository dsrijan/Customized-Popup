//
//  CustomizedPopup.swift
//  CustomizedPopup
//
//  Created by Srijan on 24/04/18.
//  Copyright © 2018 Srijan. All rights reserved.
//

import UIKit

public enum CustomizedPopupPostion {
    case bottom
    case center
}

public protocol CustomizedPopupDelegate {
    func okButtonTapped()
}

public class CustomizedPopup: UIView {
    
    var topView: UIView?
   
    // Corner Radius Of View
    public var cornerRadius : CGFloat = 0.0
    
    private var backGroundView : UIView?
    
    // Background Color of Customized Popup
    public var backGroundColor = UIColor.darkGray
    
    public var delegate : CustomizedPopupDelegate?
    
    
    // Height Of Customized Popup
    public var height : CGFloat = 200.0
    
    private var originY : CGFloat!
    
    private var isPopupShowing = false
    
    private var title = "Alert"
    
    private var message = "Customize your message as per your need, You can also set whether you want to show or not this cancel Button or not"
    
    private var okButtonTitle = "Ok"
    
    private var cancelButtonTitle = "Cancel"
    
    private var cancelButtonFlag = false
    
    // Public Show function
    public func simpleAlert(title:String, message:String, showCancelButton: Bool) {
        
        guard let rootView = UIApplication.shared.keyWindow else {
            return
        }
        
        self.title = title
        self.message = message
        self.cancelButtonFlag = showCancelButton
        
        self.topView = rootView
        self.setUpBackgroundView()
        self.setUpFrame()
        
    }
    
    
    // Public Hide function
    public func hide() {
        self.hidePopUp()
        self.removeFromSuperview()
        self.backGroundView?.removeFromSuperview()
    }
    
    private func setUpBackgroundView() {
        backGroundView = UIView(frame: (self.topView?.frame)!)
        backGroundView?.isHidden = true
        backGroundView?.backgroundColor = UIColor.lightGray.withAlphaComponent(0.6)
        self.topView?.addSubview(backGroundView!)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapBackgroundView))
        self.backGroundView?.addGestureRecognizer(tapGesture)
    }
    
    private func setUpSimpleAlert() {
        let title = UILabel(frame: CGRect(x: 10, y: 10, width: self.frame.width - 10, height: 20))
        title.text = self.title
        title.textAlignment = .center
        title.textColor = UIColor.white
        title.font = UIFont.systemFont(ofSize: 18.0)
        self.addSubview(title)
        
        let message = UILabel(frame: CGRect(x: 10, y: 35, width: self.frame.width - 10, height: 70))
        message.text = self.message
        message.textAlignment = .center
        message.numberOfLines = 3
        message.textColor = UIColor.white
        message.lineBreakMode = .byWordWrapping
        message.font = UIFont.systemFont(ofSize: 16.0)
        self.addSubview(message)
        
        let okButton = UIButton(type: .system)
        okButton.frame = CGRect(x: 0, y: self.height - 60, width: self.frame.width, height: 44)
        okButton.setTitle(self.okButtonTitle, for: .normal)
        okButton.addTarget(self, action: #selector(self.okButtonTapped), for: .touchUpInside)
        okButton.setTitleColor(UIColor.white, for: .normal)
        okButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16.0)
        self.addSubview(okButton)
        
        if cancelButtonFlag != false {
            okButton.frame = CGRect(x: 0, y: self.height - 60, width: self.frame.width / 2, height: 44)
            let cancelButton = UIButton(type: .system)
            cancelButton.frame = CGRect(x: self.frame.width / 2, y: self.height - 60, width: self.frame.width / 2, height: 44)
            cancelButton.setTitle(self.cancelButtonTitle, for: .normal)
            cancelButton.setTitleColor(UIColor.white, for: .normal)
            cancelButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16.0)
            self.addSubview(cancelButton)
        }
        
    }
    
    @objc private func okButtonTapped(sender: UIButton){
        if self.delegate != nil {
            self.delegate?.okButtonTapped()
        }
    }
    
    
    @objc private func tapBackgroundView() {
        self.hidePopUp()
    }
    
    private func setUpFrame() {
        
        
        self.originY = (self.topView?.frame.height)!
        
        self.frame = CGRect(x: 0, y: (self.originY), width: (self.topView?.frame.width)!, height: height)
        self.backgroundColor = self.backGroundColor
        self.layer.cornerRadius = cornerRadius
        self.topView?.addSubview(self)
        setUpSimpleAlert()
        showPopUp()
    }
    
    private func showPopUp() {
    
        isPopupShowing = true
        self.isHidden = false
        self.frame.origin.y = self.originY
        UIView.animate(withDuration: 1, animations: {
            self.frame.origin.y -= self.height
            self.backGroundView?.alpha = 0.6
            self.backGroundView?.isHidden = false
        }) { (status) in
            self.isHidden = false
        }
        
     }

    private func hidePopUp() {
        
        if !isPopupShowing {return}
        
        UIView.animate(withDuration: 1, animations: {
            self.frame.origin.y += self.height
            self.backGroundView?.alpha = 0.2
        }) { (status) in
            self.isHidden = true
            self.isPopupShowing = false
            self.backGroundView?.isHidden = true
        }
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}


