//
//  UserRowView.swift
//  TwitterSwiftUI
//
//  Created by Bertuğ Horoz on 2.12.2022.
//

import SwiftUI
import Kingfisher

struct UserRowView: View {
    let user : User
    var body: some View {
        HStack(spacing: 12){
            KFImage(URL(string: user.profileImageUrl))
                .resizable()
                .clipShape(Circle())
                .scaledToFill()
                .frame(width: 56, height: 56)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(user.fullname)
                    .font(.subheadline).bold()
                    .foregroundColor(.white)
                Text("@\(user.username)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            } // : VSTACK
            Spacer()
        } // : HSTACK
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}


