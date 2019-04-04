//
//  EnterOtp.swift
//  MentorzLoginSignUpFlow
//
//  Created by Nishit on 04/04/19.
//  Copyright © 2019 craterzone. All rights reserved.
//

import UIKit

class EnterOtp: UIViewController {

    @IBOutlet weak var OTPTextField: UITextField!
    var firebase : FirebaseManager?
    @IBAction func VerifyOTP(_ sender: Any) {
        firebase?.OTPMatching(verificationCode: /OTPTextField.text) { (isOTPVerified) -> (Void) in
            print(isOTPVerified)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
