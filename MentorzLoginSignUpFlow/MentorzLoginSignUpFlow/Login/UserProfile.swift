//
//  DeviceInfo.swift
//  MentorzLoginSignUpFlow
//
//  Created by Nishit on 01/04/19.
//  Copyright © 2019 craterzone. All rights reserved.
//
//
//    UserProfile.swift
//    Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
import ObjectMapper


class UserProfile : NSObject, Mappable{
    
    var basicInfo : String?
    var birthDate : Int?
    var chargePrice : Int?
    var followers : Int?
    var following : Int?
    var hresId : String?
    var lresId : String?
    var mentees : Int?
    var mentors : Int?
    var name : String?
    var noofpost : Int?
    var requests : Int?
    var videoBioHres : String?
    var videoBioLres : String?
    
    
    override public init() {
        super.init()
    }
    
    required public init?(map: Map) {
        
    }

    func mapping(map: Map)
    {
        basicInfo <- map["basic_info"]
        birthDate <- map["birth_date"]
        chargePrice <- map["charge_price"]
        followers <- map["followers"]
        following <- map["following"]
        hresId <- map["hres_id"]
        lresId <- map["lres_id"]
        mentees <- map["mentees"]
        mentors <- map["mentors"]
        name <- map["name"]
        noofpost <- map["noofpost"]
        requests <- map["requests"]
        videoBioHres <- map["video_bio_hres"]
        videoBioLres <- map["video_bio_lres"]
    }
  
}
