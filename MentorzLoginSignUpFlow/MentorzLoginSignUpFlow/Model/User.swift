//
//  User.swift
//  MentorzLoginSignUpFlow
//
//  Created by Nishit on 02/04/19.
//  Copyright © 2019 craterzone. All rights reserved.
//

import Foundation

class User{
    
    var hasInterests : Bool?
    var hasValues : Bool?
    var isAccountDeactivated : Bool?
    var isNumberVerified : Bool?
    var name : String?
    var phoneNumber : PhoneNumber?
    var userId : Int?
    var userProfile : UserProfile?
    
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
    
    
}
