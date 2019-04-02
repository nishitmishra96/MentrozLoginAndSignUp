//
//  userManager.swift
//  MentorzLoginSignUpFlow
//
//  Created by Nishit on 02/04/19.
//  Copyright © 2019 craterzone. All rights reserved.
//

import Foundation
import Moya

class UserManager: NSObject{
    static var shared = UserManager()
    var user : User?
    
    func LoginWithPhoneNumber(userData: UserCredentials,handler: @escaping ((Int,User?)->(Void))){
        if userData.social_id == nil{
        LoginApiHitManager.init().RequestForPhoneNumberLogin(dataObject: userData) { (statusCode, responseFromApiHitManager) -> (Void) in
            if let response = responseFromApiHitManager{
                let user = User(userData: response)
                self.user = user
                handler(statusCode,user)
            }
            else{
                handler(statusCode,nil)
            }
        }
    }
        else{
            LoginApiHitManager.init().RequestForSocialLogin(dataObject: userData) { (statusCode, responseFromApiHitManager) -> (Void) in
                if let response = responseFromApiHitManager{
                    let user = User(userData: response)
                    self.user = user
                    handler(statusCode,user)
                }
                else{
                    handler(statusCode,nil)
                }
            }
        }
    
    }
}
