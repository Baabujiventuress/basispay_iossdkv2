# BasisPay-IOS-KIT
BasisPay_V2 IOS Payment Gateway kit for developers


## INTRODUCTION
This document describes the steps for integrating Basispay online payment gateway iOS kit.This payment gateway performs the online payment transactions with less user effort. It receives the payment details as input and handles the payment flow. Finally returns the payment response to the user. User has to import the framework manually into their project for using it
## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements
o iOS 13.0+
o Xcode 12.0+ 
o Swift 5.0+

## Installation

BasisPay_V2 is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'BasisPay_V2' , '~> 1.0.2'
```

## Step 1
Initialize your  PaymentGateway controller by importing Basispay in your project

```
import BasisPay

class PaymentProcessViewController: UIViewController {
    
    var paymentGatewayViewController: PaymentGatewayController!
    var apiKey:String?
    var returnURL:String?
    var orderReference:String?
    var secureHash:String?
    @IBOutlet weak var viewContainer: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setDefaults()
        setInputDictionary()
        checkAndGetResponse()
    }
```
## Step 2
Assign the Payment defaults in your class which you have already recieved from the Basispay organization.

```
    private func setInputDictionary() {
        guard let apiKey = apiKey,let orderReference = orderReference,let secureHash = secureHash else {
            return
        }
        let paymentRequestDictionary: NSDictionary = [
            //Required PG Params
            "apiKey" : apiKey,
            "secureHash" : secureHash,
            "orderReference" : orderReference,
            "customerName" : "xxxx",
            "customerEmail" : "xxxx",
            "customerMobile" : "xxxx",
            "address" : "xxxx",
            "postalCode" : "xxxx",
            "city" : "xxxx",
            "region" : "xxxx",
            "country" : "IND",
            //Optional Params
            "deliveryAddress" : "",
            "deliveryName" : "",
            "deliveryMobile" : "",
            "deliveryPostalCode" : "",
            "deliveryCity" : "",
            "deliveryRegion" : "",
            "deliveryCountry" : "IND"
        ]
        paymentGatewayViewController.setInputDictionary(inputDictionary: paymentRequestDictionary)
        
    }  

```

## Step 3
Pass the User Interface Connection details regarding the product which you are going to use the payment gateway in your app.

```
    private func setDefaults() {
        paymentGatewayViewController = PaymentGatewayController()
        paymentGatewayViewController.paymentDefaults = PaymentDefaults(apiKey: apiKey!, returnUrl: returnURL!, endPoint: .Testing)
        paymentGatewayViewController.delegate = self
        viewContainer.addSubview(paymentGatewayViewController.view)
    }

```

## Step 4
Delegate methods for the onPaymentSucess and onPaymentFailure  can be handled through this protocol.

```


extension PaymentProcessViewController:PaymentGatewayDelegate {

    func onPaymentSucess(reference: String, success:String) {
        self.navigationController?.popViewController(animated: true)
        print(reference)
        print(success)
        let alertController = UIAlertController(title: "SUCCESS", message: reference, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        self.view.window?.rootViewController?.present(alertController, animated: true, completion: nil)
    }
    
    func onPaymentFailure(reference: String, success:String) {
        self.navigationController?.popViewController(animated: true)
        print(reference)
        print(success)
        let alertController = UIAlertController(title: "FAILURE", message: reference, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        self.view.window?.rootViewController?.present(alertController, animated: true, completion: nil)
    }
    
    
}

```
```

```
## Author

BasisPay, basispay@gmail.com

## License

BasisPay is available under the MIT license. See the LICENSE file for more info.
