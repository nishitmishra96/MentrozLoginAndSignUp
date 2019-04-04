//
//  DeviceInfo.swift
//  MentorzLoginSignUpFlow
//
//  Created by Nishit on 01/04/19.
//  Copyright © 2019 craterzone. All rights reserved.
//
//
//    PhoneNumber.swift
//    Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
import ObjectMapper


public class PhoneNumber : NSObject, Mappable{
    
    var cc : String?
    var isoAlpha2Cc : String?
    var number : String?
    
    
    override public init() {
        super.init()
    }
    
    required public init?(map: Map) {
        
    }
    convenience init(cc: String,isoAlpha2Cc: String,number: String)
    {
        self.init()
        self.cc = cc
        self.isoAlpha2Cc = isoAlpha2Cc
        self.number = number
    }
    
    public func mapping(map: Map)
    {
        cc <- map["cc"]
        isoAlpha2Cc <- map["iso_alpha_2_cc"]
        number <- map["number"]
    }
    
    func getPhoneNumber()-> String
    {
        return "\(/cc)"+"\(/number)"
    }
}
