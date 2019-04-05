//
//  Country.swift
//  MentorzLoginSignUpFlow
//
//  Created by Nishit on 03/04/19.
//  Copyright © 2019 craterzone. All rights reserved.
//
//


import UIKit

class Country: NSObject {
    
    var name:String?
    var code:String?
    var isoAlpha2Cc:String?
    var isSelected:Bool = false
    
    init(name:String , code:String , isoAlpha2Cc:String) {
        self.name = name;
        self.code = code;
        self.isoAlpha2Cc = isoAlpha2Cc
        
        super.init();
    }
    
}
struct XML {
    
    private init(){}
    
    static let fileExtension:String = "xml"
    static let countries:String = "countries"
    
    struct Tag {
        
        private init(){}
        
        static let country = "country"
        
        struct Attribute {
            
            private init(){}
            
            static let name = "name"
            static let phoneCode = "phoneCode"
            static let isoAlpha2Cc = "code"
        }
        
        
    }
    
}
