//
//  ButtonDesign.swift
//  MentorzLoginSignUpFlow
//
//  Created by Nishit on 29/03/19.
//  Copyright © 2019 craterzone. All rights reserved.
//

import Foundation
import UIKit

class LoginSignUpButtonStyle : UIButton {
    override func awakeFromNib() {
        self.layer.cornerRadius = 5
        self.backgroundColor = UIColor(red: 243/255, green: 52/255, blue: 52/255, alpha: 1)
        self.setTitleColor(UIColor.white, for: .normal)
        self.titleLabel?.font = UIFont(name: "Myriad Pro", size: 17)
    }
   
    
}
