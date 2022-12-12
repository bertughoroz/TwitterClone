//
//  ProfileViewModel.swift
//  TwitterSwiftUI
//
//  Created by Bertuğ Horoz on 11.12.2022.
//

import Foundation

class ProfileViewModel : ObservableObject {
    @Published var tweets = [Tweet]()
    @Published var likedTweets = [Tweet]()
    private let userService = UserService()
    private let service = TweetService()
    let user : User
    
    init(user: User) {
        self.user = user
        self.fetchUserTweets()
        self.fetchLikedTweet()
    }
    var actionButtonTitle : String {
        return user.isCurrentUser ? "Edit Profile" : "Follow"
    }
    
    
    func tweets(forFilter filter : TweetFilterViewModel) -> [Tweet] {
        switch filter {
        case .tweets:
            return tweets
        case .tweetsAndReplies:
            return tweets
        case .likes:
            return likedTweets
        }
    }
    
    func fetchUserTweets() {
        guard let uid = user.id else { return }
        service.fetchTweets(forUid: uid) { tweets in
            self.tweets = tweets
            
            for i in 0 ..< tweets.count {
                self.tweets[i].user = self.user
            }
        }
    }
    
    func fetchLikedTweet() {
        guard let uid = user.id else { return }
        service.fetchLikedTweets(forUid: uid) { tweets in
            self.likedTweets = tweets
            
            for i in 0 ..< tweets.count {
                let uid = tweets[i].uid
                
                self.userService.fetchUser(withUid: uid) { user in
                    self.likedTweets[i].user = user
                }
            }
        }
    }
    
}
