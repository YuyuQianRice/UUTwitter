//
//  ProfileViewController.swift
//  Twitter
//
//  Created by Yuyu Qian on 11/14/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    var userProfile:NSDictionary = [:]

    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var followingLabel: UILabel!
    
    @IBOutlet weak var followerLabel: UILabel!
    
    @IBOutlet weak var tweetsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getUserProfile()
    }
    
    func getUserProfile() {
        TwitterAPICaller.client?.getUser(url: TWITTER_GETUSER_URL, parameters: [String: Any](), success: {
            (user: NSDictionary) in
            self.userProfile = user
            print(user["followers_count"])
        }, failure: {
            (Error) in
            print("Failed to fetch user profile")
        })
    }

}
