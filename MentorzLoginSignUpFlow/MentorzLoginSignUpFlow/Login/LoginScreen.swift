import UIKit
import Foundation
class LoginScreen: UIViewController{
    
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBAction func OTP(_ sender: Any) {
        var number = PhoneNumberVerification()
        number.phoneNumberVerifier(phoneNumber: "+918750221516")
    }
    
    override func viewDidLoad() {
//        ButtonDesign.buttonStyle(button: loginButton)
//        let data = UserCredentials()
//        data.phoneNumber = PhoneNumber(cc: "91",isoAlpha2Cc: "in",number: "9501975529")
//        data.password = "qwerty"
//        data.deviceInfo = DeviceInfo(deviceToken: "6556",deviceType: "IOS")
//        data.email = ""
//
//        var loginAPI = LoginApiHitManager()
//        loginAPI.RequestForPhoneNumberLogin(dataObject: data, handler: { (statusCode) -> (Void) in
//        })
//        loginAPI.RequestForSocialLogin(dataObject: data, handler: { (statusCode) -> (Void) in
//        })
//        var registration = Registration()
  
    }
}
