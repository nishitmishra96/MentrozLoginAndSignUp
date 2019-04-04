//
//  APIHitManager.swift
//  MentorzLoginSignUpFlow
//
//  Created by Nishit on 01/04/19.
//  Copyright © 2019 craterzone. All rights reserved.
//

import Foundation
import Moya
import ObjectMapper
class LoginApiHitManager: NSObject{
    let loginAndSignUpApi = MoyaProvider<LoginAndSignUpApiCollection>()
    
    func PhoneNumberLogin(dataObject: UserCredentials,handler:@escaping ((Int,ResponseHandlerForLogin?)->(Void))){
        loginAndSignUpApi.request(.PhoneNumberLogin(dataObject: dataObject)) { (response) in
            switch response{
            case .success(let result):
                let responseString = String(data: result.data, encoding: String.Encoding.ascii) ?? ""
                handler(result.statusCode,ResponseHandlerForLogin(JSONString: responseString))
            
            case .failure(let error):
                handler(error.response?.statusCode ?? -1000,nil)
                print(error)
            }
        }
    }
    func SocialLogin(dataObject: UserCredentials,handler:@escaping ((Int,ResponseHandlerForLogin?)->(Void))){
        loginAndSignUpApi.request(.SocialLogin(dataObject: dataObject)) { (response) in
            switch response{
            case .success(let result):
                let responseString = String(data: result.data, encoding: String.Encoding.ascii) ?? ""
                handler(result.statusCode,ResponseHandlerForLogin(JSONString: responseString))
                
            case .failure(let error):
                handler(error.response?.statusCode ?? -1000,nil)
                print(error)
            }
        }
    }
}
