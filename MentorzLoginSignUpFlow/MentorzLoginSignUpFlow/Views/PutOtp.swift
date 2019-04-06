//
//  PutOtp.swift
//  MentorzLoginSignUpFlow
//
//  Created by Nishit on 04/04/19.
//  Copyright © 2019 craterzone. All rights reserved.
//

import UIKit
import SVProgressHUD
class OTPScreen: UIViewController {
    
    
    @IBOutlet weak var firstTxtField: UITextField!
    @IBOutlet weak var secondTxtField: UITextField!
    @IBOutlet weak var thirdTxtField: UITextField!
    @IBOutlet weak var fourthTxtField: UITextField!
    @IBOutlet weak var fifthTxtField: UITextField!
    @IBOutlet weak var sixthTxtField: UITextField!
     @IBOutlet weak var verifyOTPbutton: UIButton!
    
    var userCredentialController:UserCredentialController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    @IBAction func verifyButtonPressed(_ sender: UIButton) {
        SVProgressHUD.show(withStatus: "Verifing OTP ....")
        userCredentialController?.verifyOTP(code: getVerificationCode(), handler: { (error) in
            SVProgressHUD.dismiss()
            if let err = error{
                SVProgressHUD.showError(withStatus: err.localizedDescription)
            }else{
                self.userCredentialController?.registerUser(handler: { (result) in
                    if result{
                    let homeScreen = UIStoryboard.init(name: "LoggedInUser", bundle: Bundle.main).instantiateViewController(withIdentifier: "HomeScreen") as! HomeScreen
                    self.navigationController?.pushViewController(homeScreen, animated: true)
                    }
                    else{
                        SVProgressHUD.showError(withStatus: "User Already Exists")
                    }
                    
                })
            }
        })
    }
    @IBAction func backButtonPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func textEditDidBegin(_ sender: UITextField) {
        print("textEditDidBegin has been pressed")
        
        if !(sender.text?.isEmpty)!{
            sender.selectAll(self)
            //buttonUnSelected()
        }else{
            print("Empty")
            sender.text = " "
            
        }
        
    }
    @IBAction func textEditChanged(_ sender: UITextField) {
        print("textEditChanged has been pressed")
        let count = sender.text?.count
        //
        if count == 1{
            
            switch sender {
            case firstTxtField:
                secondTxtField.becomeFirstResponder()
            case secondTxtField:
                thirdTxtField.becomeFirstResponder()
            case thirdTxtField:
                fourthTxtField.becomeFirstResponder()
            case fourthTxtField:
                fifthTxtField.becomeFirstResponder()
            case fifthTxtField:
                sixthTxtField.becomeFirstResponder()
            case sixthTxtField:
                sixthTxtField.resignFirstResponder()
            default:
                print("Default case")
            }
        }
        
    }
    @IBAction func ResendOTPButtonPressed(_ sender: Any) {
        userCredentialController?.sendOTP(handler: { (error) in
            if let err = error{
                SVProgressHUD.showError(withStatus: "Resend OTP")
            }
            
        })
    }
    func setUpView(){
        firstTxtField.delegate = self
        secondTxtField.delegate = self
        thirdTxtField.delegate = self
        fourthTxtField.delegate = self
        fifthTxtField.delegate = self
        sixthTxtField.delegate = self
        firstTxtField.becomeFirstResponder()
        buttonUnSelected()
    }
    
    func buttonUnSelected(){
        verifyOTPbutton.isUserInteractionEnabled = false
    }
    func checkAllFilled(){
        if (firstTxtField.text?.isEmpty)! || (secondTxtField.text?.isEmpty)! || (thirdTxtField.text?.isEmpty)! || (fourthTxtField.text?.isEmpty)! || (fifthTxtField.text?.isEmpty)! || (sixthTxtField.text?.isEmpty)!{
            buttonUnSelected()
        }else{
            buttonSelected()
        }
    }
    func buttonSelected(){
        
        verifyOTPbutton.isUserInteractionEnabled = true
    }
    func getVerificationCode()-> String
    {
        return "\(/firstTxtField.text)"+"\(/secondTxtField.text)"+"\(/thirdTxtField.text)"+"\(/fourthTxtField.text)"+"\(/fifthTxtField.text)"+"\(/sixthTxtField.text)"
    }
    
}





extension OTPScreen : UITextFieldDelegate{
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        textField.text = ""
        if textField.text == "" {
            print("Backspace has been pressed")
        }
        
        if string == ""
        {
            print("Backspace was pressed")
            switch textField {
            case secondTxtField:
                firstTxtField.becomeFirstResponder()
            case thirdTxtField:
                secondTxtField.becomeFirstResponder()
            case fourthTxtField:
                thirdTxtField.becomeFirstResponder()
            case fifthTxtField:
                fourthTxtField.becomeFirstResponder()
            case sixthTxtField:
                fifthTxtField.becomeFirstResponder()
            default:
                print("default")
            }
            textField.text = ""
            return false
        }
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        checkAllFilled()
    }
}
