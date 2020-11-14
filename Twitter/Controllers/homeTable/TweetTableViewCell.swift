//
//  TweetTableViewCell.swift
//  Twitter
//
//  Created by Yuyu Qian on 11/6/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class TweetTableViewCell: UITableViewCell {
      
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var tweetContentLabel: UILabel!
    
    @IBOutlet weak var retweetButton: UIButton!
    
    @IBOutlet weak var likeButton: UIButton!
    
    var isLikedVar: Bool = false
    
    var tweetId: Int = -1

    @IBAction func likeTweet(_ sender: Any) {
        if (tweetId != -1) {
//            print("\(self.tweetId)")
            if (isLikedVar) {
                TwitterAPICaller.client?.unlikeTweets(tweetId: self.tweetId, success: {
                    self.setLike(false)
                }, failure: {
                    (err) in
                    print("Can not unlike tweet \(err)")
                })
            } else {
                TwitterAPICaller.client?.likeTweets(tweetId: self.tweetId, success: {
                    self.setLike(true)
                }, failure: {
                    (err) in
                    print("Can not like tweet \(err)")
                })
            }
        }
        
    }
    
    func setLike (_ isLiked: Bool) {
        isLikedVar = isLiked
        if (isLikedVar) {
            likeButton.setImage(UIImage(named: "favor-icon-red"), for: UIControl.State.normal)
        } else {
            likeButton.setImage(UIImage(named: "favor-icon"), for: UIControl.State.normal)
        }
    }
    
    var isRetweetedVar: Bool = false
    
    @IBAction func retweetTweet(_ sender: Any) {
        if (tweetId != -1) {
//            print("\(self.tweetId)")
            if (isRetweetedVar) {
                TwitterAPICaller.client?.unretweets(tweetId: self.tweetId, success: {
                    self.setRetweet(false)
                }, failure: {
                    (err) in
                    print("Can not retweet \(err)")
                })
            } else {
                TwitterAPICaller.client?.retweets(tweetId: self.tweetId, success: {
                    self.setRetweet(true)
                }, failure: {
                    (err) in
                    print("Can not unretweet \(err)")
                })
            }
        }
    }
    
    func setRetweet (_ isRetweeted: Bool) {
        isRetweetedVar = isRetweeted
        if (isRetweetedVar) {
            retweetButton.setImage(UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
        } else {
            retweetButton.setImage(UIImage(named: "retweet-icon"), for: UIControl.State.normal)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
