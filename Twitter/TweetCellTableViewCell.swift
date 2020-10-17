//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by Aditya Dixit on 10/10/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {

    @IBOutlet weak var favButton: UIButton!
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var tweetContent: UILabel!
    @IBOutlet weak var handleLabel: UILabel!
    
    
    var favorited: Bool = false
    var tweetID:Int = -1
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func retweet(_ sender: Any) {
        TwitterAPICaller.client?.retweet(tweetID: tweetID, success: {self.setRetweeted(true)}, failure: {(error) in
            print("Retweet did not suceed: \(error)")
        })    }
    
    @IBAction func favoriteTwitter(_ sender: Any) {
        let tobeFavorited = !favorited
        
        if (tobeFavorited) {
            TwitterAPICaller.client?.favoriteTweet(tweetID: tweetID, success: {self.setFavorite(true)}, failure: {(error) in
                print("Favorite did not suceed: \(error)")
            })
        }
        
        else{
            TwitterAPICaller.client?.unfavoriteTweet(tweetID: tweetID, success: {self.setFavorite(false)}, failure: {(error) in
                print("Unfavorite did not suceed: \(error)")
            })
        }
    }

    func setFavorite(_ isFavorited:Bool){
        favorited = isFavorited
        
        if (favorited)
        {
            
            favButton.setImage(UIImage(named: "favor-icon-red"), for: UIControl.State.normal)
            
        }
        
        else{
            favButton.setImage(UIImage(named: "favor-icon"), for: UIControl.State.normal)
            
        }

    }
    
    func setRetweeted(_ isRetweeted:Bool)
    {
        
        if (isRetweeted)
        {
            retweetButton.setImage(UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
            
            retweetButton.isEnabled = false
        }
        
        else{
            
            retweetButton.setImage(UIImage(named: "retweet-icon"), for: UIControl.State.normal)
            
            retweetButton.isEnabled = true
        }

    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
