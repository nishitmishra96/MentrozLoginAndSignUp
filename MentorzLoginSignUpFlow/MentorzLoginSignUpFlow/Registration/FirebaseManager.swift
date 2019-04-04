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

    func phoneNumberVerifier(phoneNumber : PhoneNumber,handler: @escaping ((Error?)->(Void)))
    {
    PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber.getPhoneNumber(), uiDelegate: nil) { (verificationID, error) in

        self.verificationID = /verificationID
        handler(error)
    }
    }
    func OTPMatching(verificationCode:String,handler: @escaping ((Error?)->(Void))){
        let credential = PhoneAuthProvider.provider().credential(
            withVerificationID: self.verificationID,
            verificationCode: verificationCode)
        Auth.auth().signInAndRetrieveData(with: credential) { (authResult, error) in
                handler(error)
        }
    }
}

