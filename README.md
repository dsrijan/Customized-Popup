# Customized-Popup
Customized popup : One of the most customized popup with custom view inside the popup. You can show map, image and texts inside your popup.
Easy to maintain :P

<p align="center">
  <img src="https://github.com/dsrijan/Customized-Popoup/blob/master/customizePopUpGIF.gif"/>
</p>

## Installation

You want to add pod 

```
pod 'Customized-Popup', '~> 0.1'

 ```
in your podfile

```
pod install

 ```
inside your terminal, or from CocoaPods.app.

## Prerequisites

Xcode 9 and Swift 4


## Getting Started

Bunch of useful alert popups:

```
let alertController = CustomizedPopup()
```

1. Show Alert with Map

```
alertController.alertWithMapView(latitude: 37.57554038, longitude: -122.40068475)
```

This will show an alert view with provided map view having latitude and longitude provided.


2. Show Alert with Text and Images

```

alertController.alertWithImage(image: #imageLiteral(resourceName: "default"), message: "Hey Check this is awesome na ????",showCancelButton: true) 

```
This will show an alert view with provided text and image in a customized view


3. Show Alert with only Text and Message

```

alertController.simpleAlert(title: "Hello Alert", message: "Alert or Not ??", showCancelButton: false)

```

This will show an alert view with simple text and message in the alert view.

Apart from these, you can handle actions inside your own view controller or model/view files using delegate **CustomizedPopupDelegate**

```
func customizedOkButtonTapped(obj: UIButton) {
        print("ok button called hello")
}

```

## Customizations


```
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

```

A wide range of customization which makes your app look and feel awesome according to your requirements.

<p align="center">
<img src="https://github.com/dsrijan/Customized-Popoup/blob/master/customizedAlert.jpeg" width="200" height="400" />
</p>
  
## Author

Any suggestion and feedback invited:
[Facebook](https://www.facebook.com/dsrijan),
[Github](https://www.github.com/dsrijan),
[Twitter](https://www.twitter.com/asksrijan),
[LinkedIn](https://www.linkedin.com/in/srijan12345/)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE) file for details

