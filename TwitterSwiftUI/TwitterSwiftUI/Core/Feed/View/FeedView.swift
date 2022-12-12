//
//  FeedView.swift
//  TwitterSwiftUI
//
//  Created by Bertuğ Horoz on 1.12.2022.
//

import SwiftUI

struct FeedView: View {
    // MARK: - PROPERTIES
    @State private var showNewTweet = false
    @ObservedObject var viewModel = FeedViewModel()
    // MARK: - BODY
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                LazyVStack{
                    ForEach(viewModel.tweets) { tweet in
                        TweetRowView(tweet: tweet)
                    } // : LOOP
                } // : LAZYVSTACK
            } // : SCROLL
            Button {
                showNewTweet.toggle()
            } label: {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 52 , height: 52)
            }
            .background(Color(.white))
            .foregroundColor(.blue)
            .clipShape(Circle())
            .padding()
            .fullScreenCover(isPresented: $showNewTweet) {
                NewTweetView()
            }

        } // : ZSTACK
    }
}
// MARK: - PREVIEW
struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
