//
//  ccButtonDesign.swift
//  MentorzLoginSignUpFlow
//
//  Created by Nishit on 03/04/19.
//  Copyright © 2019 craterzone. All rights reserved.
//

import Foundation
import UIKit
class ccButtonDesign : UIButton{
    override func awakeFromNib() {
        self.layer.cornerRadius = 5
        self.setTitleColor(UIColor.black, for: .normal)
        self.titleLabel?.font = UIFont(name: "Myriad Pro", size: 17)
    }
}
