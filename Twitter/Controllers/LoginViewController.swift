//
//  LoginViewController.swift
//  Twitter
//
//  Created by Yuyu Qian on 11/6/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if UserDefaults.standard.bool(forKey: "isLoggedIn") == true {
            self.performSegue(withIdentifier: "landingPage", sender: self)
        }
        
    }
    
    @IBAction func loginButtonTap(_ sender: Any) {
        TwitterAPICaller.client?.login(url: TWITTER_Login_URL, success: {
            //perfor segue
            UserDefaults.standard.set(true, forKey: "isLoggedIn")
            self.performSegue(withIdentifier: "landingPage", sender: self)
        }, failure: {
            Error in
            print("Could not log in!")
        })
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
