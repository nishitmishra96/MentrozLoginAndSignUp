import UIKit
import Foundation
import FBSDKLoginKit
import SVProgressHUD
import LinkedinSwift
class LoginScreen: UIViewController,CountryCodeDelegate{
    
    @IBOutlet weak var countryCode: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var number: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    private var phoneNumber = PhoneNumber(cc: "91", isoAlpha2Cc: "in", number: "")
    var countryCodetextField : String = ""
    private var userCredentialController : UserCredentialController = UserCredentialController(isLogin: true)
//    let linkedinHelper = LinkedinSwiftHelper(configuration:
//        LinkedinSwiftConfiguration(
//            clientId: "77tn2ar7gq6lgv",
//            clientSecret: "iqkDGYpWdhf7WKzA",
//            state: "DLKDJF45DIWOERCM",
//            permissions: ["r_basicprofile", "r_emailaddress"]
//        ),nativeAppChecker: WebLoginOnly()
//    )
    
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
        SVProgressHUD.show()
        if(/self.number.text?.count > 10)
        {
            SVProgressHUD.showError(withStatus: "Number must be of atleast 10 digits")
        }
        else if(/countryCode.titleLabel?.text!.count == 0){
            SVProgressHUD.showError(withStatus: "Please Select Country Code")
        }
        else if(/self.password.text?.count < 6)
        {
            SVProgressHUD.showError(withStatus: "Minimum Password Length is 6")
        }
        else{
        self.phoneNumber.number = self.number.text
        self.userCredentialController.phonenumber = self.phoneNumber
        self.userCredentialController.password = self.password.text
        self.userCredentialController.email = self.email.text
        userCredentialController.loginUser { (statusCode, user) in
            SVProgressHUD.dismiss()
            if statusCode == 200 {
                let homeScreen = UIStoryboard.init(name: "LoggedInUser", bundle: Bundle.main).instantiateViewController(withIdentifier: "HomeScreen") as! HomeScreen
                self.navigationController?.pushViewController(homeScreen, animated: true)
            }
            else
            {
                SVProgressHUD.showError(withStatus: "Wrong Credentials")
            }
        }
        }
    }
    @IBAction func FacebookButonPressed(_ sender: Any) {
        FBManager.init().login(onViewController: self) { (userprofile, error) -> (Void) in
            if let fbuser = userprofile {
                print(fbuser.id)
            }else{
                print("errrorrrrrr",error)
            }
        }
    }
    
    @IBAction func LinkedinButtonPressed(_ sender: Any) {
//        linkedinHelper.authorizeSuccess({ (lsToken) -> Void in
//            //Login success lsToken
//        }, error: { (error) -> Void in
//            //Encounter error: error.localizedDescription
//        }, cancel: { () -> Void in
//            //User Cancelled!
//        })
    }
    
    func didSelectCountryCode(country: Country) {
        self.countryCode.setTitle(country.code, for: .normal)
        self.phoneNumber.cc = country.code
        self.phoneNumber.isoAlpha2Cc = country.isoAlpha2Cc
    }
    
    override func viewDidLoad() {
//        let data = UserCredentials()
//        data.phoneNumber = PhoneNumber(cc: "91",isoAlpha2Cc: "in",number: "9501975529")
//        data.password = "qwerty"
//        data.deviceInfo = DeviceInfo(deviceToken: "6556",deviceType: "IOS")
//       data.email = ""
//
//        var loginAPI = LoginApiHitManager()
//        SVProgressHUD.show()
//        loginAPI.PhoneNumberLogin(dataObject: data, handler: { (statusCode,ss)  -> (Void) in
//            SVProgressHUD.dismiss()
//            SVProgressHUD.show(withStatus:(String)(statusCode))
//            SVProgressHUD.dismiss()
//        })
//        loginAPI.SocialLogin(dataObject: data, handler: { (statusCode) -> (Void) in
//        })
//        var registration = Registration()
//        var number = FirebaseManager()
//        number.phoneNumberVerifier(phoneNumber: "+918750221516")
    }
}
