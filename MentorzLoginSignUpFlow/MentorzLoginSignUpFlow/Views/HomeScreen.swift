//
//  Home.swift
//  MentorzLoginSignUpFlow
//
//  Created by Nishit on 05/04/19.
//  Copyright © 2019 craterzone. All rights reserved.
//

import Foundation
import UIKit
import LinkedinSwift

class HomeScreen : UIViewController{
    
    var linkedInManager : LinkedinManager?

    @IBAction func BackButtonPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func LogoutFromLinkedin(_ sender: Any) {
        linkedInManager?.linkedinHelper.logout()
    }
    
}
