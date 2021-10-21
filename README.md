# BasisPay-IOS-KIT
BasisPay IOS Payment Gateway kit for developers


## INTRODUCTION
This document describes the steps for integrating Basispay online payment gateway iOS kit.This payment gateway performs the online payment transactions with less user effort. It receives the payment details as input and handles the payment flow. Finally returns the payment response to the user. User has to import the framework manually into their project for using it
## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements
o iOS 13.0+
o Xcode 12.0+ 
o Swift 5.0+

## Installation

BasisPay is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'BasisPay' , '~> 1.0.0'
```

## Step 1
Initialize your  PaymentGateway controller by importing Basispay in your project

```
import BasisPay

class PaymentProcessViewController: UIViewController {
    
    var basispayViewController: BasispayViewController!
    var amount:String?
    var titleValue:String?
    var descriptionValue:String?
    @IBOutlet weak var viewContainer: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setDefaults()
    }
```
## Step 2
Assign the Payment defaults in your class which you have already recieved from the Basispay organization.

```
private func setDefaults() {
              let paymentRequestDictionary = [
             "orderReference" : "ORDER-REFERENCE-FROM-BACKEND",
             "customerName" : titleValue ?? "",
             "customerEmail" : "YXYXYX@gmail.com",
             "customerMobile" : "824835038412",
             "address" : "ZZZZZZXXXXXXX",
             "postalCode" : "ZZZXXX",
             "city" : "XXXXXX",
             "region" : "YYYYYY",
             "country" : "ZZZ",
             //// optional parameters
             "delivery[address]":"ZZZZZZXXXXXXX",
             "delivery[customerName]":"XXXXX",
             "delivery[customerMobile]":"824835038412",
             "delivery[postalCode]":"ZZZXXX",
             "delivery[city]":"XXXXXX",
             "delivery[region]":"YYYYYY",
             "delivery[country]":"ZZZ"
         ]
}    

```

## Step 3
Pass the User Interface Connection details regarding the product which you are going to use the payment gateway in your app.

```
        basispayViewController = BasispayViewController()
        basispayViewController.delegate = self
        basispayViewController.paymentRequestDictionary = paymentRequestDictionary
        viewContainer.addSubview(basispayViewController.view)

```

## Step 4
Delegate methods for the onCloseClicked and OnPaymentConnectError  can be handled through this protocol.

```


extension PaymentProcessViewController:BasispayDelegate {
    func onPaymentConnectError(errormessage: String) {
        print(errormessage)
    }
    
    func onCloseClicked() {
        self.navigationController?.popViewController(animated: true)
    }
}

```
```

```
## Author

BasisPay, basispay@gmail.com

## License

BasisPay is available under the MIT license. See the LICENSE file for more info.
