//
//  StoryBoards.swift
//  MentorzLoginSignUpFlow
//
//  Created by Nishit on 04/04/19.
//  Copyright © 2019 craterzone. All rights reserved.
//

import Foundation
import UIKit
enum Storyboard: String {
    case login = "Login"
    case signup = "SignUp"
    var instance: UIStoryboard {
        return UIStoryboard(name: rawValue, bundle: nil)
    }
    func instanceOf<T: UIViewController>(viewController: T.Type) -> T? {
        let x = String(describing: viewController.self)
        return instance.instantiateViewController(withIdentifier: x) as? T
    }
}
