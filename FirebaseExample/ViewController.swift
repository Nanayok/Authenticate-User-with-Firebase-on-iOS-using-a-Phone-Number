//
//  ViewController.swift
//  FirebaseExample
//
//  Created by MACBOOK PRO on 5/5/19.
//  Copyright © 2019 example. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: Properties
    
    @IBOutlet weak var phoneNumberTextField: UITextField!
    var phoneNumber: String = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
         phoneNumberTextField.delegate = self
    }

    //MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        phoneNumber = phoneNumberTextField.text!
    }
    
    //MARK: Actions
    
    @IBAction func submitButton(_ sender: UIButton) {
        
        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { (verificationID, error) in
            
            if error == nil {
                //registration successful
                self.view.showToast(toastMessage: "registration successful", duration: 1.5)
                
            }else{
                //registration failure
                self.view.showToast(toastMessage: "registration failed", duration: 1.5)
            }
            
            // Sign in using the verificationID and the code sent to the user
            // ...

        }
        
        
    }
    


}

