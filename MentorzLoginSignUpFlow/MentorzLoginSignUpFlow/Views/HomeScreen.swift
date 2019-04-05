//
//  Home.swift
//  MentorzLoginSignUpFlow
//
//  Created by Nishit on 05/04/19.
//  Copyright © 2019 craterzone. All rights reserved.
//

import Foundation
import UIKit

class HomeScreen : UIViewController{
    
    @IBAction func BackButtonPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
