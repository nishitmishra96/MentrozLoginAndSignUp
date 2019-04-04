//
//  DeviceInfo.swift
//  MentorzLoginSignUpFlow
//
//  Created by Nishit on 01/04/19.
//  Copyright © 2019 craterzone. All rights reserved.
//
//
//    RootClass.swift
//    Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
import ObjectMapper


class UserCredentials : NSObject, Mappable{
    var email : String?
    var deviceInfo : DeviceInfo?
    var password : String?
    var phoneNumber : PhoneNumber?
    var userProfile : UserProfile?
    var socialId : Int64?
    var social_source: String?
    
    override  init() {
        super.init()
    }
    
    required  init?(map: Map) {
        
    }
    func mapping(map: Map)
    {
        deviceInfo <- map["device_info"]
        password <- map["password"]
        phoneNumber <- map["phone_number"]
        userProfile <- map["user_profile"]
        socialId  <- map["social_id"]
        social_source <- map["social_source"]
        email <- map["email_id"]
    }

}
