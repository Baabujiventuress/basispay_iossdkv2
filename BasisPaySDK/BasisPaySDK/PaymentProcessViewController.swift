//
//  PaymentProcessViewController.swift
//  BasisPay-iOS-DemoApp
//
//  Created by Saravanan on 26/08/20.
//  Copyright © 2020 Saravanan. All rights reserved.
//

import UIKit
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
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    private func setDefaults() {
        let paymentRequestDictionary = [
             "orderReference" : "XJU4XPnBJMvwpAJvgtanhw==",
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
         
        basispayViewController = BasispayViewController()
        basispayViewController.delegate = self
        basispayViewController.paymentRequestDictionary = paymentRequestDictionary
        viewContainer.addSubview(basispayViewController.view)
    }
    
  
    
}
extension PaymentProcessViewController:BasispayDelegate {
    func onPaymentConnectError(errormessage: String) {
        print(errormessage)
    }
    
    func onCloseClicked() {
        self.navigationController?.popViewController(animated: true)
    }
    

    
}
