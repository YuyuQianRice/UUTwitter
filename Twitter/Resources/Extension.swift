//
//  Extensions.swift
//  Twitter
//
//  Created by Yuyu Qian on 11/05/20.
//

import Foundation
import UIKit

// All these following variables extended to UIView are used as abbrevition in other files
extension UIView {
    
    public var width: CGFloat {
        return self.frame.size.width
    }
    
    public var height: CGFloat {
        return self.frame.size.height
    }
    
    public var top: CGFloat {
        return self.frame.origin.y
    }
    
    public var bottom: CGFloat {
        return self.frame.size.height + self.frame.origin.y
    }
    
    public var left: CGFloat {
        return self.frame.origin.x
    }
    
    public var right: CGFloat {
        return self.frame.size.width + self.frame.origin.x
    }
}


extension Notification.Name {
    static let didLogInNotification = Notification.Name("didLogInNotification")
}

let TWITTER_Login_URL = "https://api.twitter.com/oauth/request_token"
let TWITTER_Pull_URL = "https://api.twitter.com/1.1/statuses/home_timeline.json"
let TWITTER_POST_URL = "https://api.twitter.com/1.1/statuses/update.json"
let TWITTER_LIKE_URL = "https://api.twitter.com/1.1/favorites/create.json"
let TWITTER_UNLIKE_URL = "https://api.twitter.com/1.1/favorites/destroy.json"

