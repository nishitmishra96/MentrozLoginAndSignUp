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
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        deviceToken = aDecoder.decodeObject(forKey: "device_token") as? String
        deviceType = aDecoder.decodeObject(forKey: "device_type") as? String
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if deviceToken != nil{
            aCoder.encode(deviceToken, forKey: "device_token")
        }
        if deviceType != nil{
            aCoder.encode(deviceType, forKey: "device_type")
        }
        
    }
    
}
