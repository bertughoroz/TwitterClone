//
//  NewTweetView.swift
//  TwitterSwiftUI
//
//  Created by Bertuğ Horoz on 3.12.2022.
//

import SwiftUI
import Kingfisher

struct NewTweetView: View {
    // MARK: - PROPERTIES
    @State private var caption = ""
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var authViewModel :AuthViewModel
    @ObservedObject var viewModel = UploadTweetViewModel()
    // MARK: - BODY
    var body: some View {
        VStack {
            HStack {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Cancel")
                        .foregroundColor(Color(.systemBlue))
                }
                Spacer()
                Button {
                    viewModel.uploadTweet(withCaption: caption)
                } label: {
                    Text("Tweet")
                        .bold()
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .background(Color(.systemBlue))
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                }
            } // : HSTACK
            .padding()
            HStack(alignment: .top, spacing: 0) {
                if let user = authViewModel.currentUser {
                    KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 64, height: 64)
                        .padding()
                }
                    
                
                TextField("What's Happening?", text: $caption, axis: .vertical)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 12)
            } // : HSTACK
            Spacer()
        } // : VSTACK
        .onReceive(viewModel.$didUploadTweet) { success in
            if success {
                presentationMode.wrappedValue.dismiss()
            } 
        }
    }
}
// MARK: - PREVIEW
struct NewTweetView_Previews: PreviewProvider {
    static var previews: some View {
        NewTweetView()
            .environmentObject(AuthViewModel())
    }
}
