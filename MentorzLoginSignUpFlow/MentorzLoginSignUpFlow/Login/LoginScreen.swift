import UIKit
import Foundation
class LoginScreen: UIViewController,CountryCodeDelegate{
    
    @IBOutlet weak var countryCode: UIButton!
    var countryCodetextField : String = ""
    func didSelectCountryCode(country: Country) {
        self.countryCode.setTitle(country.code, for: .normal) 
    }
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBAction func SignUpButtonPressed(_ sender: Any) {
        let signUpOptions = Storyboard.signup.instanceOf(viewController: SignUpOptionsViewController.self)!
        
        self.navigationController?.pushViewController(signUpOptions, animated: true)
    }
    
    @IBAction func ccButtonPressed(_ sender: UIButton) {
        let cc = Storyboard.login.instanceOf(viewController: CountryCodeVC.self)!
        cc.delegate = self
        self.present(cc, animated: true , completion: nil)
    }
    @IBAction func LoginButtonPressed(_ sender: Any) {

    }
    @IBAction func OTP(_ sender: Any) {

    }
    
    override func viewDidLoad() {
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
//        var number = FirebaseManager()
//        number.phoneNumberVerifier(phoneNumber: "+918750221516")
    }
}
