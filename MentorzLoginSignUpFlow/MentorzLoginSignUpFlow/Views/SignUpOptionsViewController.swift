//
//  SignupOptionsViewController.swift
//  MentorzLoginSignUpFlow
//
//  Created by Nishit on 03/04/19.
//  Copyright © 2019 craterzone. All rights reserved.
//

import UIKit

class SignUpOptionsViewController: UIViewController {
    //MARK:- IBOutlets
    
    @IBOutlet weak var signUpButton: UIButton!
    
    //Mark:- IBActions
    
    @IBAction func LoginButtonPressed(_ sender: Any) {
        let loginScreen = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "LoginScreen") as! LoginScreen
        self.present(loginScreen, animated: true, completion: nil)
    }
    
    @IBAction func SignUpButtonPressed(_ sender: Any) {
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ButtonDesign.buttonStyle(button: signUpButton)

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
