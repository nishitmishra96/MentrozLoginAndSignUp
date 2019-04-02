//
//  ButtonDesign.swift
//  MentorzLoginSignUpFlow
//
//  Created by Nishit on 29/03/19.
//  Copyright © 2019 craterzone. All rights reserved.
//

import Foundation
import UIKit

class ButtonDesign : UIButton {
    
    class func buttonStyle(button: UIButton)
    {
        button.layer.cornerRadius = 5
        button.backgroundColor = UIColor(red: 243/255, green: 52/255, blue: 52/255, alpha: 1)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Myriad Pro", size: 17)
    }
    
}
