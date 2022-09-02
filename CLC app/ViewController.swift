//
//  ViewController.swift
//  CLC app
//
//  Created by Daniel Vega on 5/20/22.
//

import UIKit
import FirebaseAuth
import FirebaseCore
import GoogleSignIn

class ViewController: UIViewController {
    var actionCodeSettings = ActionCodeSettings()
    
    @IBOutlet weak var textFieldOutlet: UITextField!
    
   
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

//        let provider = FUIEmailAuth(authUI: FUIAuth.defaultAuthUI()!,signInMethod: FIREmailLinkAuthSignInMethod,forceSameDevice: false,allowNewEmailAccounts: true,actionCodeSetting: actionCodeSettings)
        
    }
    
    @IBAction func clickButtonAction(_ sender: UIButton) {
        if let email = textFieldOutlet.text {
             
               // [START action_code_settings]
               let actionCodeSettings = ActionCodeSettings()
               actionCodeSettings.url = URL(string: "https://www.google.com/")
               // The sign-in operation has to always be completed in the app.
               actionCodeSettings.handleCodeInApp = true
               actionCodeSettings.setIOSBundleID(Bundle.main.bundleIdentifier!)
              
               // [END action_code_settings]
               // [START send_signin_link]
               Auth.auth().sendSignInLink(toEmail: email,
                                          actionCodeSettings: actionCodeSettings) { error in
                 // [START_EXCLUDE]
                 
                   // [END_EXCLUDE]
                   if let error = error {
                     print(error)
                     print(error.localizedDescription + " it didn't work pendejo")
                     return
                   }
                   // The link was successfully sent. Inform the user.
                   // Save the email locally so you don't need to ask the user for it again
                   // if they open the link on the same device.
                   UserDefaults.standard.set(email, forKey: "Email")
                   print("Check your email for link")
                   // [START_EXCLUDE]
                 
                 // [END_EXCLUDE]
               
               // [END send_signin_link]
             }
           } else {
             print("Email can't be empty")
           }
        
        
       
        
        
    }
    

}

