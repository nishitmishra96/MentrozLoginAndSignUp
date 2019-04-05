//
//  SignUpView.swift
//  MentorzLoginSignUpFlow
//
//  Created by Nishit on 03/04/19.
//  Copyright © 2019 craterzone. All rights reserved.
//

import UIKit
import SVProgressHUD

class SignUpView: UIViewController,CountryCodeDelegate {

    @IBOutlet weak var countryCode: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    var userCredentialController = UserCredentialController(isRegistration: true)

    private var phoneNumber = PhoneNumber(cc: "91", isoAlpha2Cc: "in", number: "")
    
    @IBAction func SignUpButtonPressed(_ sender: Any) {
        phoneNumber.number = phoneNumberTextField.text
        userCredentialController.phonenumber = self.phoneNumber
        
        userCredentialController.sendOTP { (error) in
            if let apiHitError = error {
                SVProgressHUD.showError(withStatus: apiHitError.localizedDescription)
            }
            else{
                let OTPClass = Storyboard.signup.instanceOf(viewController: OTPScreen.self)!
                OTPClass.userCredentialController = self.userCredentialController
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
        if self.navigationController?.viewControllers.count == 3
        {
            let loginScreen = Storyboard.login.instanceOf(viewController: LoginScreen.self)
            self.navigationController?.pushViewController(loginScreen!, animated: true)
        }
        else{
            self.navigationController?.popViewController(animated: true)
        }
    }
    func didSelectCountryCode(country: Country) {
        self.countryCode.setTitle(country.code, for: .normal)
        self.phoneNumber.cc = country.code
        self.phoneNumber.isoAlpha2Cc = ""
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
 
}
