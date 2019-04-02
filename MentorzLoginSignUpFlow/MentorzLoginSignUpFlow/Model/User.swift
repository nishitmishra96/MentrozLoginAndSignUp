//
//  User.swift
//  MentorzLoginSignUpFlow
//
//  Created by Nishit on 02/04/19.
//  Copyright © 2019 craterzone. All rights reserved.
//

import Foundation
import Moya
import ObjectMapper

class User : NSObject,Mappable{
    
    var hasInterests : Bool?
    var hasValues : Bool?
    var isAccountDeactivated : Bool?
    var isNumberVerified : Bool?
    var name : String?
    var phoneNumber : PhoneNumber?
    var userId : Int?
    var userProfile : UserProfile?
    
    override public init() {
        super.init()
    }
    
    required public init?(map: Map) {
        
    }
    
    init(userData : ResponseHandlerForLogin){
        self.hasInterests = userData.hasInterests
        self.hasValues = userData.hasValues
        self.isAccountDeactivated = userData.isAccountDeactivated
        self.isNumberVerified = userData.isNumberVerified
        self.name = userData.name
        self.phoneNumber = userData.phoneNumber
        self.userId = userData.userId
        self.userProfile = userData.userProfile
    }
    
    func mapping(map: Map)
    {
        hasInterests <- map["has_interests"]
        hasValues <- map["has_values"]
        isAccountDeactivated <- map["is_account_deactivated"]
        isNumberVerified <- map["is_number_verified"]
        name <- map["name"]
        phoneNumber <- map["phone_number"]
        userId <- map["user_id"]
        userProfile <- map["user_profile"]
    }
    
    
}
