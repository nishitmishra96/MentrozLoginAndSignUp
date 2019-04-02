//
//  DeviceInfo.swift
//  MentorzLoginSignUpFlow
//
//  Created by Nishit on 01/04/19.
//  Copyright © 2019 craterzone. All rights reserved.
//

//
//    DeviceInfo.swift
//    Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
import ObjectMapper


class DeviceInfo : NSObject, Mappable{
    
    var deviceToken : String?
    var deviceType : String?
    
    
    override public init() {
        super.init()
    }
    
    required public init?(map: Map) {
        
    }
    convenience init(deviceToken: String,deviceType: String)
    {
        self.init()
        self.deviceToken = deviceToken
        self.deviceType = deviceType
    }
    
    func mapping(map: Map)
    {
        deviceToken <- map["device_token"]
        deviceType <- map["device_type"]
        
    }
    
}
