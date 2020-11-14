//
//  TweetViewController.swift
//  Twitter
//
//  Created by Yuyu Qian on 11/13/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class TweetViewController: UIViewController {
    
    @IBOutlet weak var textCountLabel: UILabel!
    
    @IBOutlet weak var tweetText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tweetText.becomeFirstResponder()
        tweetText.delegate = self
    }
    
    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tweet(_ sender: Any) {
        if (!tweetText.text.isEmpty) {
            TwitterAPICaller.client?.postTweets(tweetString: tweetText.text, success: {
                self.dismiss(animated: true, completion: nil)
            }, failure:{ (err) in
                print("Can not tweet! \(err)")
                self.dismiss(animated: true, completion: nil)
            })
        } else {
            self.dismiss(animated: true, completion: nil)
        }
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

extension TweetViewController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        // Set the max character limit
        let characterLimit = 280

        // Construct what the new text would be if we allowed the user's latest edit
        let newText = NSString(string: tweetText.text!).replacingCharacters(in: range, with: text)

        // TODO: Update Character Count Label
        textCountLabel.text = String(characterLimit - newText.count)
        
        // The new text should be allowed? True/False
        return newText.count < characterLimit
    }
}
