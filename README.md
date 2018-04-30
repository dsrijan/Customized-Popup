# Customized-Popoup
Customized popup : One of the most customized popup with custom view inside the popup. You can show map, image and texts inside your popup.
Easy to maintain :P

<p align="center">
  <img src="https://github.com/dsrijan/Customized-Popoup/blob/master/customizePopUpGIF.gif.gif"/>
</p>

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


## Author

Any suggestion and feedback invited:
[Facebook](https://www.facebook.com/dsrijan),
[Github](https://www.github.com/dsrijan),
[Twitter](https://www.twitter.com/asksrijan),
[LinkedIn](https://www.linkedin.com/in/srijan12345/)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE) file for details

