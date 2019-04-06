//
//  SignupOptionsViewController.swift
//  MentorzLoginSignUpFlow
//
//  Created by Nishit on 03/04/19.
//  Copyright © 2019 craterzone. All rights reserved.
//

import UIKit

class SignUpOptionsViewController: UIViewController {
    //MARK:- IBOutlets and Variables
    private var userCredentialController : UserCredentialController = UserCredentialController(isRegistration: true)

    //Mark:- IBActions
    
    @IBAction func AlreadyRegisteredButtonPressed(_ sender: Any) {
       if self.navigationController?.viewControllers.count == 2
       {
            let loginScreen = Storyboard.login.instanceOf(viewController: LoginScreen.self)
            self.navigationController?.pushViewController(loginScreen!, animated: true)
        }
       else{
        self.navigationController?.popViewController(animated: true)
        }
    }
    @IBAction func SignUpButtonPressed(_ sender: Any) {
        let signUpView = Storyboard.signup.instanceOf(viewController: SignUpView.self)!
        signUpView.userCredentialController = self.userCredentialController
        self.navigationController?.pushViewController(signUpView, animated: true)
    }
    
    @IBAction func FacebookButtonPressed(_ sender: Any) {
FBManager.init().login(onViewController: self) { (userprofile, error) -> (Void) in
            if let fbuser = userprofile {
                print(fbuser.id)
            }else{
                print("errrorrrrrr",error)
            }
        }
    }
    @IBAction func LinkedinButtonPressed(_ sender: Any) {
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
