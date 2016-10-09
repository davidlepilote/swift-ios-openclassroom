//
//  Login.swift
//  FirstApp
//
//  Created by David Fournier on 08/10/16.
//  Copyright © 2016 David Fournier. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class Login : UIViewController, FBSDKLoginButtonDelegate{
    
    override func viewDidLoad() {
        let facebookLoginButton = FBSDKLoginButton()
        facebookLoginButton.delegate = self
        facebookLoginButton.readPermissions = ["public_profile", "email"]
        facebookLoginButton.center = self.view.center
        
        view.addSubview(facebookLoginButton)
    }
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        if(error != nil){
            // Handle error
            print(error)
        } else {
            if !result.isCancelled{
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let navigationBar = storyboard.instantiateViewControllerWithIdentifier("nav") as! UINavigationController
                presentViewController(navigationBar, animated: true, completion: {})
            }
        }
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        
    }
}
