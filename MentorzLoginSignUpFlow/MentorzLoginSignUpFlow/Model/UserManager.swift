//
//  userManager.swift
//  MentorzLoginSignUpFlow
//
//  Created by Nishit on 02/04/19.
//  Copyright © 2019 craterzone. All rights reserved.
//

import Foundation
import Moya

class UserManager: NSObject{
    static var shared = UserManager()
    var user : User?
    
    func LoginWithPhoneNumber(userData: UserCredentials,handler: ((Int),(User))){
        
    }
    
    
}
