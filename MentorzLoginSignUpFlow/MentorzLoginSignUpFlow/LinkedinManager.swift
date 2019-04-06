//
//  LinkedinManager.swift
//  MentorzLoginSignUpFlow
//
//  Created by Nishit on 05/04/19.
//  Copyright © 2019 craterzone. All rights reserved.
//

import UIKit
import LinkedinSwift

class LinkedinManager: UIViewController {
    
    let linkedinHelper = LinkedinSwiftHelper(configuration:
        LinkedinSwiftConfiguration(
            clientId: "77tn2ar7gq6lgv",
            clientSecret: "iqkDGYpWdhf7WKzA",
            state: "DLKDJF45DIWOERCM",
            permissions: ["r_basicprofile", "r_emailaddress"], redirectUrl: "LKSFJLKSAKD"
        ), nativeAppChecker: WebLoginOnly()
    )
    
    func LinkedinLogin()
    {
        linkedinHelper.authorizeSuccess({ (lsToken) -> Void in
            //Login success lsToken
            print("Login sucess")
        }, error: { (error) -> Void in
            print("Login error")
            //Encounter error: error.localizedDescription
        }, cancel: { () -> Void in
            //User Cancelled!
            print("Login cancel")
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
