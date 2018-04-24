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

public class CustomizedPopup: UIView {
    
    var topView: UIView?
   
    // Corner Radius Of View
    public var cornerRadius : CGFloat = 0.0
    
    private var backGroundView : UIView?
    
    // Background Color of Customized Popup
    public var backGroundColor = UIColor.darkGray
    
    
    // Height Of Customized Popup
    public var height : CGFloat = 200.0
    
    
    // Public Show function
    public func show() {
        
        guard let rootView = UIApplication.shared.keyWindow else {
            return
        }
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
    
    @objc private func tapBackgroundView() {
        self.hidePopUp()
    }
    
    private func setUpFrame() {
        
        self.frame = CGRect(x: 0, y: (self.topView?.frame.height)!, width: (self.topView?.frame.width)!, height: height)
        self.backgroundColor = self.backGroundColor
        self.layer.cornerRadius = cornerRadius
        self.topView?.addSubview(self)
        showPopUp()
    }
    
    private func showPopUp() {
    
        UIView.animate(withDuration: 1, animations: {
            self.frame.origin.y -= self.height
            self.backGroundView?.alpha = 0.6
            self.backGroundView?.isHidden = false
        }) { (status) in
            self.isHidden = false
        }
        
     }

    private func hidePopUp() {
        UIView.animate(withDuration: 1, animations: {
            self.frame.origin.y += self.height
            self.backGroundView?.alpha = 0.2
        }) { (status) in
            self.isHidden = true
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


