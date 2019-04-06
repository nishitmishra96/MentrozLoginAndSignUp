//
//  UserDataController.swift
//  MentorzLoginSignUpFlow
//
//  Created by Nishit on 04/04/19.
//  Copyright © 2019 craterzone. All rights reserved.
//

import UIKit

class UserCredentialController: NSObject {
    private var firebaseManager = FirebaseManager()
    private var request = UserCredentials()
    private var loginManager = LoginApiHitManager()
    override private init() {
        super.init()
    }
    convenience init(isLogin: Bool) {
        self.init()
        request.deviceInfo = DeviceInfo(deviceToken: /UIDevice.current.identifierForVendor?.uuidString, deviceType: "iOS")
        request.phoneNumber = PhoneNumber()
    }
    convenience init(isRegistration: Bool) {
        self.init()
        self.request.deviceInfo = DeviceInfo(deviceToken: /UIDevice.current.identifierForVendor?.uuidString, deviceType: "iOS")
        self.request.phoneNumber = PhoneNumber()
        self.request.userProfile = UserProfile()
    }
    var name:String?{
       get{
            return request.userProfile?.name
        }
        set{
            request.userProfile?.name = newValue
        }
    }
    var password:String?{
        get{
            return request.password
        }
        set{
            request.password = newValue
        }
    }
    var email:String?{
        get{
            return request.email
        }
        set{
            request.email = newValue
        }
    }
    var phonenumber:PhoneNumber?{
        get{
            return request.phoneNumber
        }
        set{
            request.phoneNumber = newValue
        }
    }
    
    func sendOTP(handler: @escaping ((Error?)->())){
        firebaseManager.phoneNumberVerifier(phoneNumber: /self.phonenumber) { (error) -> (Void) in
            handler(error)
        }
    }
    func verifyOTP(code:String,handler: @escaping ((Error?)->())){
        firebaseManager.OTPMatching(verificationCode: code) { (error) -> (Void) in
            handler(error)
        }
    }
    func registerUser(handler: @escaping ((Bool)->())){
        if request.socialId == nil{
            RegistrationManager.init().registerUserWithPhone(user: request) { (statusCode) -> (Void) in
                handler(statusCode == 201)
            }
        }else{
            RegistrationManager.init().registerUserWithSocial(user: request) { (statuscode) -> (Void) in
                handler(statuscode == 201)
            }
        }
    }
    func loginUser(handler: @escaping ((Int,User?)->()))
    {
        if request.socialId == nil
        {
            loginManager.PhoneNumberLogin(dataObject: request) { (statusCode, loginResponse) -> (Void) in
                
                if let response = loginResponse{
                    let newuser = User(userData: response)
                    handler(statusCode,newuser)
                }
                else{
                    handler(statusCode,nil)
                }
        }
        }
        else
            {
                loginManager.SocialLogin(dataObject: request) { (statusCode, loginResponse) -> (Void) in
                    if let response = loginResponse{
                        let newuser = User(userData: response)
                        handler(statusCode,newuser)
                    }
                    else{
                        handler(statusCode,nil)
                    }
                }
            }
    }
}
