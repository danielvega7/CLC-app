//
//  ViewController.swift
//  CLC app
//
//  Created by Daniel Vega on 5/20/22.
//

import UIKit
import FirebaseAuth
import Firebase

class ViewController: UIViewController {
    var actionCodeSettings = ActionCodeSettings()
    
   
   
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        actionCodeSettings.url = URL(string: "https://example.appspot.com")
        actionCodeSettings.handleCodeInApp = true
        actionCodeSettings.setIOSBundleID(Bundle.main.bundleIdentifier!)

        let provider = FUIEmailAuth(authUI: FUIAuth.defaultAuthUI()!,
                                    signInMethod: FIREmailLinkAuthSignInMethod,
                                    forceSameDevice: false,
                                    allowNewEmailAccounts: true,
                                    actionCodeSetting: actionCodeSettings)
        
    }
    


}

