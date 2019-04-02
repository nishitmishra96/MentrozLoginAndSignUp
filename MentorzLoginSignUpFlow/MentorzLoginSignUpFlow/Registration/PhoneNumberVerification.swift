//
//  PhoneNumberVerification.swift
//  MentorzLoginSignUpFlow
//
//  Created by Nishit on 02/04/19.
//  Copyright © 2019 craterzone. All rights reserved.
//

import Foundation
import FirebaseAuth

class PhoneNumberVerification {
    
    private var verificationID = ""

    func phoneNumberVerification(phoneNumber : String)
    {
    PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { (verificationID, error) in
    if let error = error {
        print("\(error.localizedDescription)")
    return
    }
    // Sign in using the verificationID and the code sent to the user
    // .
        self.verificationID = UserDefaults.standard.string(forKey: "authVerificationID")!
    }
    }
    func OTPMatching(verificationCode:String){
        let credential = PhoneAuthProvider.provider().credential(
            withVerificationID: self.verificationID,
            verificationCode: verificationCode)
        Auth.auth().signInAndRetrieveData(with: credential) { (authResult, error) in
            if let error = error {
                // ...
                return
            }
            else
            // User is signed in
            // ...
        }
    }
    
}


