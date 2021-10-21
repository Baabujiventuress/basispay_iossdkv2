Pod::Spec.new do |s|
  s.name          = "BasisPay_V2"
  s.version       = "1.0.0"
  s.summary       = "Payment gateway framework by Basispay team"
  s.description   = "iOS SDK kit for payment gateway transactions"
  s.homepage      = "https://github.com/Baabujiventuress/basispay_iossdkv2"
  s.license       = "MIT"
  s.author        = "Basis Pay"
  s.platform      = :ios, "13.0"
  s.vendored_frameworks = 'BasisPaySDK/BasisPay.xcframework'
  s.swift_version = "5.0"
  s.source        = {
    :git => "https://github.com/Baabujiventuress/basispay_iossdkv2.git",
    :tag => "#{s.version}"
  }
 end