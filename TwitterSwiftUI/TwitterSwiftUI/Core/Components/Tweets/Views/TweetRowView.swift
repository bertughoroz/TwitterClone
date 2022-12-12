//
//  TweetRowView.swift
//  TwitterSwiftUI
//
//  Created by Bertuğ Horoz on 1.12.2022.
//

import SwiftUI
import Kingfisher
struct TweetRowView: View {
    @ObservedObject var viewModel : tweetRowViewModel
    
    init(tweet: Tweet) {
        self.viewModel = tweetRowViewModel(tweet: tweet)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            // PROFILE IMAGE AND USER INFO
            if let user = viewModel.tweet.user {
                HStack(alignment: .top, spacing: 12){
                    KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 56, height: 56)
                    // USER INFO AND TWEET CAPTION
                    VStack(alignment: .leading, spacing: 4) {
                        // USER INFO
                        HStack {
                            Text(user.fullname)
                                .font(.subheadline)
                                .fontWeight(.bold)
                            Text("@\(user.username)")
                                .foregroundColor(.gray)
                                .font(.subheadline)
                            Text("2h")
                                .foregroundColor(.gray)
                                .font(.subheadline)
                        } // : HSTACK
                        // TWEET CAPTION
                        Text(viewModel.tweet.caption)
                            .font(.subheadline)
                            .multilineTextAlignment(.leading)
                    } // : VSTACK
                } // : HSTACK
            }
            // ACTION BUTTONS
            HStack {
                Button {
                    
                } label: {
                    Image(systemName: "bubble.left")
                        .font(.subheadline)
                }
                Spacer()
                Button {
                    
                } label: {
                    Image(systemName: "arrow.2.squarepath")
                        .font(.subheadline)
                }
                Spacer()
                Button {
                    viewModel.tweet.didLike ?? false ? viewModel.unlikeTweet() : viewModel.likeTweet()
                } label: {
                    Image(systemName: viewModel.tweet.didLike ?? false ? "heart.fill" : "heart" )
                        .font(.subheadline)
                        .foregroundColor(viewModel.tweet.didLike ?? false ? Color(.systemRed) : Color(.systemGray) )
                }
                Spacer()
                Button {
                    
                } label: {
                    Image(systemName: "square.and.arrow.up")
                        .font(.subheadline)
                }
            } // : HSTACK
            .foregroundColor(.gray)
            .padding()
            
            Divider()
                .offset(y: -15)
            
        } // : VSTACK
        .padding()
        .padding(.top, -10)
        .padding(.bottom, -30)
    }
}

