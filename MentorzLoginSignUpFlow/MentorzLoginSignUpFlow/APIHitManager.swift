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
class APIHitManager: NSObject{
    
    let loginAndSignUpApi = MoyaProvider<LoginAndSignUpApiCollection>()
    
    func RequestForPhoneNumberLogin(dataObject: DataForJSON,handler:@escaping ((Int)->(Void))){
        loginAndSignUpApi.request(.LoginThroughPhoneNumber(dataObject: dataObject)) { (response) in
            switch response{
            case .success(let result):
                let responseString = String(data: result.data, encoding: String.Encoding.ascii) ?? ""
                let res = ResponseHandler(JSONString: responseString)
                    //DataForJSON(JSONString: responseString)
    //            print(res?.phoneNumber?.number as Any)
                
                print(result.statusCode,"Statuscode from phone login")
                handler(result.statusCode)
            
            case .failure(let error):
                handler(error.response?.statusCode ?? -1000)
                print(error)
            }
        }
    }
    func RequestForSocialLogin(dataObject: DataForJSON,handler:@escaping ((Int)->(Void))){
        loginAndSignUpApi.request(.LoginThroughSocialAccount(dataObject: dataObject)) { (response) in
            switch response{
            case .success(let result):
                let responseString = String(data: result.data, encoding: String.Encoding.ascii) ?? ""
                let res = ResponseHandler(JSONString: responseString)
                //DataForJSON(JSONString: responseString)
                print(res?.phoneNumber?.number as Any)
                
                print(result.statusCode,"Status code from social")
                handler(result.statusCode)
                
            case .failure(let error):
                handler(error.response?.statusCode ?? -1000)
                print(error)
            }
        }
    }
}
