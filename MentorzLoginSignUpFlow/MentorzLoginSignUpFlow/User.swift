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


class User : NSObject, Mappable{
    
    var basicInfo : String?
    var birthDate : String?
    var name : String?
    var videoBioHres : String?
    var lres_id: String?
    var hres_id: String?
    var basic_info: String?
    var video_bio_lres: String?
    var video_bio_hres: String?
    
    
    override public init() {
        super.init()
    }
    
    required public init?(map: Map) {
        
    }

    func mapping(map: Map)
    {
        basicInfo <- map["basic_info"]
        birthDate <- map["birth_date"]
        name <- map["name"]
        videoBioHres <- map["video_bio_hres"]
        lres_id <- map["lres_id"]
        hres_id <- map["hres_id"]
        basic_info <- map["basic_info"]
        video_bio_lres <- map["video_bio_lres"]
        video_bio_hres <- map["video_bio_hres"]
    }
  
}
