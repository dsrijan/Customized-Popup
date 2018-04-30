//
//  CustomizedPopup.swift
//  CustomizedPopup
//
//  Created by Srijan on 24/04/18.
//  Copyright © 2018 Srijan. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

public enum CustomizedPopupPostion {
    case bottom
    case center
}

@objc
public protocol CustomizedPopupDelegate {
   @objc optional func customizedOkButtonTapped(obj: UIButton)
}

public class CustomizedPopup: UIView, CLLocationManagerDelegate {
    
    var topView: UIView?
   
    // Corner Radius Of View
    public var cornerRadius : CGFloat = 10.0
    
    var locationManager = CLLocationManager()
    
    private var backGroundView : UIView?
    
    // Background Color of Customized Popup
    public var backGroundColor = UIColor.white
    
    public var delegate : CustomizedPopupDelegate?
  
    // Height Of Customized Popup
    public var height : CGFloat = 180.0
    
    private var originY : CGFloat!
    
    private var isPopupShowing = false
    
    private var title = "Alert"
    
    private var message = "Customize your message as per your need, You can also set whether you want to show or not this cancel Button or not"
    
    private var okButtonTitle = "Ok"
    
    private var cancelButtonTitle = "Cancel"
    
    private var cancelButtonFlag = false
    
    public var okButtonTextColor = UIColor.darkText
    public var okButtonBackGroundColor = UIColor.clear
    public var cancelButtonTextColor = UIColor.darkText
    public var cancelButtonBackGroundColor = UIColor.clear
    public var alertTextColor = UIColor.darkText
    
    private var alertImage: UIImage?
    
    private var mapView: MKMapView?
    
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
        self.setUpSimpleAlert()
        self.showPopUp()
    }
    
    // Public Show function
    public func alertWithImage(image:UIImage, message:String, showCancelButton: Bool) {
        
        guard let rootView = UIApplication.shared.keyWindow else {
            return
        }
        self.title = ""
        self.message = message
        self.alertImage = image
        self.cancelButtonFlag = showCancelButton
        self.topView = rootView
        self.setUpBackgroundView()
        self.setUpFrame()
        self.setUpAlertWithImage()
        self.showPopUp()
    }
    
    public func alertWithMapView(latitude: Double, longitude: Double) {
        guard let rootView = UIApplication.shared.keyWindow else {
            return
        }
        self.topView = rootView
        self.setUpBackgroundView()
        setUpMapViewFrame()
        setUpMapView(lat: latitude, long: longitude)
        self.showPopUp()
    }
    
    private func setUpMapViewFrame() {
        self.originY = (self.topView?.frame.height)!
        self.frame = (self.topView?.frame)!
        self.frame.size.height = self.height
        self.backgroundColor = self.backGroundColor
        self.layer.cornerRadius = cornerRadius
        self.topView?.addSubview(self)
    }
    
    private func setUpMapView(lat: Double, long: Double) {
       
        self.backgroundColor = UIColor.clear
        mapView = MKMapView(frame:self.frame)
        mapView?.isScrollEnabled = false
        mapView?.layer.cornerRadius = self.cornerRadius
        
        let latDelta:Double = 0.05
        let lngDelta:Double = 0.05
        
        let latitude:Double = lat //37.57554038
        let longitude:Double = long //-122.40068475
        
        let locationcoordinates = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let zoomSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lngDelta)
        let region = MKCoordinateRegion(center: locationcoordinates, span: zoomSpan)
        self.mapView!.setRegion(region, animated: true)
        
        self.addSubview(mapView!)
        
        let scrollHandlingBar = UIView(frame: CGRect(x: (self.frame.width / 2) - 70.0, y: 0 , width: 140.0, height: 5.0))
        scrollHandlingBar.backgroundColor = UIColor.lightGray
        scrollHandlingBar.layer.borderWidth = 1.0
        scrollHandlingBar.layer.borderColor = UIColor.lightGray.cgColor
        scrollHandlingBar.layer.shadowColor = UIColor.lightGray.cgColor
        scrollHandlingBar.layer.shadowRadius = 5.0
        scrollHandlingBar.isUserInteractionEnabled = true
        mapView?.addSubview(scrollHandlingBar)
        
//        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(self.handleView))
//        mapView?.isUserInteractionEnabled = true
//        mapView?.addGestureRecognizer(panGesture)
       
    }
    
    @objc
    private func handleView(gesture: UIPanGestureRecognizer) {
      
        let senderView = gesture.view!
        let translation = gesture.translation(in: self.topView)
        
        switch  gesture.state {
        case .began, .changed, .ended:
            senderView.center.y = translation.y
            senderView.frame.size.height = self.height - (gesture.view?.frame.origin.y)!
        default:
            print("end")
        }
    }
    
    
    // Public Hide function
    public func hide() {
        self.hidePopUp()
    }
    
    private func setUpBackgroundView() {
        backGroundView = UIView(frame: (self.topView?.frame)!)
        backGroundView?.isHidden = true
        backGroundView?.backgroundColor = UIColor.lightGray.withAlphaComponent(0.6)
        self.topView?.addSubview(backGroundView!)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapBackgroundView))
        self.backGroundView?.addGestureRecognizer(tapGesture)
    }
    
    private func setUpAlertWithImage() {
        let imageView = UIImageView(frame: CGRect(x: (self.frame.width / 2) - 25 , y: -25.0, width: 50.0, height: 50.0))
        imageView.layer.cornerRadius = 25.0
        imageView.backgroundColor = UIColor.lightGray
        imageView.image = self.alertImage
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        self.addSubview(imageView)
        setUpSimpleAlert()
    }
    
    private func setUpSimpleAlert() {
        
        let title = UILabel(frame: CGRect(x: 10, y: 10, width: self.frame.width - 10, height: 20))
        title.text = self.title
        title.textAlignment = .center
        title.textColor = alertTextColor
        title.font = UIFont.systemFont(ofSize: 18.0)
        self.addSubview(title)
        
        let message = UILabel(frame: CGRect(x: 10, y: 35, width: self.frame.width - 10, height: 70))
        message.text = self.message
        message.textAlignment = .center
        message.numberOfLines = 3
        message.textColor = alertTextColor
        message.lineBreakMode = .byWordWrapping
        message.font = UIFont.systemFont(ofSize: 16.0)
        self.addSubview(message)
        
        let okButton = UIButton(type: .system)
        okButton.frame = CGRect(x: 0, y: self.height - 60, width: self.frame.width, height: 44)
        okButton.setTitle(self.okButtonTitle, for: .normal)
        okButton.addTarget(self, action: #selector(self.okButtonTapped), for: .touchUpInside)
        okButton.setTitleColor(okButtonTextColor, for: .normal)
        okButton.backgroundColor = okButtonBackGroundColor
        okButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16.0)
        self.addSubview(okButton)
        
        if cancelButtonFlag != false {
            okButton.frame = CGRect(x: 0, y: self.height - 60, width: self.frame.width / 2, height: 44)
            let cancelButton = UIButton(type: .system)
            cancelButton.frame = CGRect(x: self.frame.width / 2, y: self.height - 60, width: self.frame.width / 2, height: 44)
            cancelButton.setTitle(self.cancelButtonTitle, for: .normal)
            cancelButton.setTitleColor(self.cancelButtonTextColor, for: .normal)
            cancelButton.backgroundColor = cancelButtonBackGroundColor
            cancelButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16.0)
            cancelButton.addTarget(self, action: #selector(hidePopUp), for: .touchUpInside)
            self.addSubview(cancelButton)
        }
        
    }
    
    @objc private func okButtonTapped(sender: UIButton){
        if self.delegate != nil {
            self.delegate?.customizedOkButtonTapped!(obj: sender)
        }
        self.hidePopUp()
    }
    
    
    @objc private func tapBackgroundView() {
        self.hidePopUp()
    }
    
    private func setUpFrame() {
        self.originY = (self.topView?.frame.height)! - 10.0
        self.frame = CGRect(x: 10, y: (self.originY), width: (self.topView?.frame.width)! - 20, height: height)
        self.backgroundColor = self.backGroundColor
        self.layer.cornerRadius = cornerRadius
        self.topView?.addSubview(self)
    }
    
    private func showPopUp() {
    
        isPopupShowing = true
        self.isHidden = false
        self.frame.origin.y = self.originY
        UIView.animate(withDuration: 0.5, animations: {
            self.frame.origin.y -= self.height
            self.backGroundView?.alpha = 0.6
            self.backGroundView?.isHidden = false
        }) { (status) in
            self.isHidden = false
        }
        
     }

    @objc
    private func hidePopUp() {
        
        if !isPopupShowing {return}
        UIView.animate(withDuration: 0.5, animations: {
            self.frame.origin.y = (self.topView?.frame.size.height)!
            self.backGroundView?.alpha = 0.2
        }) { (status) in
            self.isHidden = true
            self.isPopupShowing = false
            self.backGroundView?.isHidden = true
            for ob in self.subviews {
                ob.removeFromSuperview()
            }
            self.removeFromSuperview()
            self.backGroundView?.removeFromSuperview()
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




