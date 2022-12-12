//
//  ProfileView.swift
//  TwitterSwiftUI
//
//  Created by Bertuğ Horoz on 2.12.2022.
//

import SwiftUI
import Kingfisher

struct ProfileView: View {
    // MARK: - PROPERTIES
    @State private var selectedFilter: TweetFilterViewModel = .tweets
    @ObservedObject var viewModel : ProfileViewModel
    @Environment(\.presentationMode) var mode
    @Namespace var animation
    
    init(user : User) {
        self.viewModel = ProfileViewModel(user: user)
    }
    // MARK: - BODY
    var body: some View {
        VStack(alignment: .leading) {
            headerView
            actionButtons
            userInfoDetails
            tweetFilterBar
            tweetsView
            Spacer()
        } // : VSTACK
        .navigationBarHidden(true)
    }
}

// MARK: - PREVIEW
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User(id: NSUUID().uuidString,
                               username: "batman",
                               fullname: "Bruce Wayne",
                               profileImageUrl: "",
                               email: "batman@gmail.com"))
    }
} //:PREVIEW

// MARK: - EXTENSIONS ANF FUNCTIONS

extension ProfileView {
    // PROFILE PICTURE AND BACK IMAGE
    var headerView : some View {
        // BACKGROUND IMAGE
        ZStack(alignment: .bottomLeading) {
            Color(.systemBlue)
                .ignoresSafeArea()
            VStack {
                // BACK BUTTON
                Button {
                    mode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "arrow.left.circle.fill")
                        .resizable()
                        .symbolRenderingMode(.hierarchical)
                        .frame(width: 28, height: 28)
                        .foregroundColor(Color.white)
                        .offset(x: 16, y: 0)
                }
                // PROFILE PICTURE
                
                KFImage(URL(string: viewModel.user.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    .frame(width: 72, height: 72)
                .offset(x: 16, y: 24)
            } // : VSTACK
        } // : ZSTACK
        .frame(height: UIScreen.main.bounds.height / 8)
    }
    // EDIT PROFILE BUTTON / ACTION BUTTON
    var actionButtons: some View {
        HStack(spacing: 12) {
            Spacer()
            Button {
                
            } label: {
                Text(viewModel.actionButtonTitle)
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .frame(width: 120, height: 32)
                    
                    .overlay {
                        RoundedRectangle(cornerRadius: 20).stroke(Color.white, lineWidth: 0.75)
                    }
            } // : BUTTON
            .offset(x: 0, y: 10)
        } // : HSTACK
        .padding(.trailing)
    }
    // USER INFO AND DETAILS
    var userInfoDetails: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text(viewModel.user.fullname)
                    .font(.title2)
                    .fontWeight(.bold)
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(Color(.systemBlue))
            } // : HSTACK
            Text("@\(viewModel.user.username)")
                .font(.subheadline)
                .foregroundColor(.gray)
            Text("Son SwiftUI Bükücü.")
                .font(.subheadline)
                .padding(.vertical)
            VStack(alignment: .leading, spacing: 6) {
                HStack{
                    Image(systemName: "mappin.and.ellipse")
                    Text("Trabzon, TR")
                } // : HSTACK
                HStack{
                    Image(systemName: "link")
                    Text("myrastudios.co")
                } // : VSTACK
                UserStatsView()
                .padding(.top, 10)
            } // : HSTACK
            .font(.caption)
            .foregroundColor(.gray)
        } // : VSTACK
        .padding(.horizontal)
        .padding(.top, -15)
    }
    // TWEET FILTER BAR
    var tweetFilterBar: some View {
        HStack {
            ForEach(TweetFilterViewModel.allCases, id: \.rawValue) { item in
                VStack{
                    Text(item.title)
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(selectedFilter == item ? .white : .gray )
                    
                    if selectedFilter == item {
                        Capsule()
                            .foregroundColor(Color(.systemBlue))
                            .frame(height: 3)
                            .matchedGeometryEffect(id: "filter", in: animation)
                    } else {
                        Capsule()
                            .foregroundColor(Color(.clear))
                            .frame(height: 3)
                    } // : IF ELSE
                } // : VSTACK
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        self.selectedFilter = item
                    }
                }
            } // : LOOP
        } // : HSTACK
        .padding(.top, 4)
        .overlay(Divider().offset(x: 0, y: 16.5))
    }
    // PROFILE TWEETS
    var tweetsView: some View {
        ScrollView {
            LazyVStack {
                ForEach(viewModel.tweets(forFilter: self.selectedFilter)) { tweet in
                    TweetRowView(tweet: tweet)
                }
            }
        }
    }
}
