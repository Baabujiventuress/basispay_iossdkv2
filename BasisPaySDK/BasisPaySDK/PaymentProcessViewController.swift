//
//  PaymentProcessViewController.swift
//  BasisPay-iOS-DemoApp
//  BasisPay_V2 PG
//
//  Created by Saravanan on 26/08/20.
//  Modified on 25/04/24
//  Copyright © 2020 Saravanan. All rights reserved.
//

import UIKit
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
    private func setDefaults() {
        paymentGatewayViewController = PaymentGatewayController()
        paymentGatewayViewController.paymentDefaults = PaymentDefaults(apiKey: apiKey!, returnUrl: returnURL!, endPoint: .Testing)
        paymentGatewayViewController.delegate = self
        viewContainer.addSubview(paymentGatewayViewController.view)
    }
    
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
    
    @objc func checkAndGetResponse() {
        if (paymentGatewayViewController.isResponseAvailable()) {
            let responseData = paymentGatewayViewController.getResponseData()
            print(responseData)
            
        }
        else {
            perform(#selector(checkAndGetResponse), with: nil, afterDelay: 2) }
    }
    
  
    
}
extension PaymentProcessViewController:PaymentGatewayDelegate {
//    func onPaymentSucess(response: BasisPaymentResponse) {
    func onPaymentSucess(reference: String, success:String) {
        self.navigationController?.popViewController(animated: true)
        print(reference)
        print(success)
        let alertController = UIAlertController(title: "SUCCESS", message: reference, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        self.view.window?.rootViewController?.present(alertController, animated: true, completion: nil)
    }
    
//    func onPaymentFailure(response: BasisPaymentResponse) {
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

