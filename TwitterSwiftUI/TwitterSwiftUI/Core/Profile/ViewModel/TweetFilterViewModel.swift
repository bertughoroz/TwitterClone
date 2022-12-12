//
//  TweetFilterViewModel.swift
//  TwitterSwiftUI
//
//  Created by Bertuğ Horoz on 2.12.2022.
//

import Foundation

enum TweetFilterViewModel : Int, CaseIterable {
    case tweets
    case tweetsAndReplies
    case likes
    
    var title : String {
        switch self {
        case .tweets: return "Tweets"
        case .tweetsAndReplies: return "Replies"
        case .likes: return "Likes"
        }
    }
}
