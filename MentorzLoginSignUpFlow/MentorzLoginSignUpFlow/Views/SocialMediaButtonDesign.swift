//
//  SocialMediaButtonDesign.swift
//  MentorzLoginSignUpFlow
//
//  Created by Nishit on 03/04/19.
//  Copyright © 2019 craterzone. All rights reserved.
//

import UIKit

class SocialMediaButtonDesign: UIButton {

    
    override func awakeFromNib() {
        self.layer.cornerRadius = 5
        self.setTitleColor(UIColor.white, for: .normal)
        self.titleLabel?.font = UIFont(name: "Myriad Pro", size: 17)
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
