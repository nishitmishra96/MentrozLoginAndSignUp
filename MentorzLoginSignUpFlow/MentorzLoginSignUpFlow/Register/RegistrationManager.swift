//
//  RegistrationManager.swift
//  MentorzLoginSignUpFlow
//
//  Created by Nishit on 05/04/19.
//  Copyright © 2019 craterzone. All rights reserved.
//

import Foundation
import Moya
class RegistrationManager: NSObject {
    
    static let shared = RegistrationManager()
    let signupProvider = MoyaProvider<LoginAndSignUpApiCollection>()
    
    func registerUserWithPhone(user:UserCredentials,handler: @escaping ((Int)->(Void))) {
        signupProvider.request(.RegisterThroughPhoneNumber(dataObject: user)) {(response) in
            switch response{
            case .success(let result):
                print("good :p")
                handler(result.statusCode)
            case .failure(let error):
                print("bad :(")
                
                handler(error.response?.statusCode ?? -1000)
            }
            
        }
    }
    func registerUserWithSocial(user:UserCredentials,handler: @escaping ((Int)->(Void))) {
        signupProvider.request(.RegisterThroughSocialAccount(dataObject: user)) {(response) in
            switch response{
            case .success(let result):
                print("good :p")
                handler(result.statusCode)
            case .failure(let error):
                print("bad :(")
                
                handler(error.response?.statusCode ?? -1000)
            }
            
        }
    }
}

