import UIKit
import Foundation
class LoginScreen: UIViewController{
    
    @IBOutlet weak var loginButton: ButtonDesign!
    
    
    override func viewDidLoad() {
        ButtonDesign.buttonStyle(button: loginButton)
        let data = DataForJSON()
        data.phoneNumber = PhoneNumber(cc: "91",isoAlpha2Cc: "in",number: "9501975529")
        data.password = "qwerty"
        data.deviceInfo = DeviceInfo(deviceToken: "6556",deviceType: "IOS")
        data.email = ""
        
        var loginAPI = APIHitManager()
        loginAPI.RequestForPhoneNumberLogin(dataObject: data, handler: { (statuscode) -> (Void) in
        })
    }
}
