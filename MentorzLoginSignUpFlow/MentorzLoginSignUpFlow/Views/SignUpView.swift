//
//  SignUpView.swift
//  MentorzLoginSignUpFlow
//
//  Created by Nishit on 03/04/19.
//  Copyright © 2019 craterzone. All rights reserved.
//

import UIKit

class SignUpView: UIViewController,CountryCodeDelegate {

    @IBOutlet weak var countryCode: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    var firebase = FirebaseManager()
    var name : String = ""
    var cc : String = ""
    var phoneNumber : String = ""
    var password : String = ""
    var OTP = "222"
    @IBAction func SignUpButtonPressed(_ sender: Any) {
        self.name = self.nameTextField?.text ?? ""
        self.phoneNumber = self.phoneNumberTextField?.text ?? ""
        self.password = self.passwordTextField?.text ?? ""
        cc = countryCode.titleLabel?.text ?? "+91"
        cc = cc.replacingOccurrences(of: "\\", with: "")
        cc = getPhoneNumber()
        self.firebase.phoneNumberVerifier(phoneNumber: cc) { (isOTPSent) -> (Void) in
            if isOTPSent {
                print("OTP SENDING FAILED")
            }
            else{
                let OTPClass = Storyboard.signup.instanceOf(viewController: EnterOtp.self)!
                OTPClass.firebase = self.firebase
                self.navigationController?.pushViewController(OTPClass, animated: true)
            }
        }
    }
    @IBAction func ccButtonPressed(_ sender: Any) {
        let cc = Storyboard.login.instanceOf(viewController: CountryCodeVC.self)!
        cc.delegate = self
        self.present(cc, animated: true , completion: nil)
    }
    @IBAction func AlreadyRegisteredButtonPressed(_ sender: Any) {
        for vc in self.navigationController?.viewControllers ?? [UIViewController](){
            if vc is LoginScreen{
                self.navigationController?.popToViewController(vc, animated: true)
                return;
            }
        }
        self.navigationController?.popViewController(animated: true)
    }
    func didSelectCountryCode(country: Country) {
        self.countryCode.setTitle(country.code, for: .normal)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func getPhoneNumber()-> String
    {
        return "\(String(describing: cc))"+"\(String(describing: phoneNumber))"
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
