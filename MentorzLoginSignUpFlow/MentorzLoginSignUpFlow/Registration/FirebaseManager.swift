//
//  PhoneNumberVerification.swift
//  MentorzLoginSignUpFlow
//
//  Created by Nishit on 02/04/19.
//  Copyright © 2019 craterzone. All rights reserved.
//

import Foundation
import FirebaseAuth

class FirebaseManager {
    
    private var verificationID = ""

    func phoneNumberVerifier(phoneNumber : PhoneNumber,handler: @escaping ((Bool)->(Void)))
    {
    PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber.getPhoneNumber(), uiDelegate: nil) { (verificationID, error) in
    if let error = error {
        print("\(error.localizedDescription)")
        handler(false)
    return
    }
    // Sign in using the verificationID and the code sent to the user
    // .
//        UserDefaults.standard.set(verificationID, forKey: "authVerificationID")
        self.verificationID = /verificationID
        print(verificationID)
        handler(true)
    }
    }
    func OTPMatching(verificationCode:String,handler: @escaping ((Bool)->(Void))){
        let credential = PhoneAuthProvider.provider().credential(
            withVerificationID: self.verificationID,
            verificationCode: verificationCode)
        Auth.auth().signInAndRetrieveData(with: credential) { (authResult, error) in
            if let error = error {
                // ...
                handler(false)
                print("OTP NOT VERIFIED")
                return
            }
            else{
            // User is signed in
            // ...
                handler(true)
                print("HEY OTP VERIFIED")
        }
    }
}
}

