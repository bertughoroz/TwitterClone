//
//  UploadTweetViewModel.swift
//  TwitterSwiftUI
//
//  Created by Bertuğ Horoz on 10.12.2022.
//

import Foundation

class UploadTweetViewModel : ObservableObject {
    @Published var didUploadTweet = false
    let service = TweetService()
    
    func uploadTweet(withCaption caption : String) {
        service.uploadTweet(caption: caption) { success in
            if success {
                // Dismis Screen
                self.didUploadTweet = true
            } else {
                // shpw error message to user
            }
        }
    }
}
