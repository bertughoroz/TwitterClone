//
//  SideMenuView.swift
//  TwitterSwiftUI
//
//  Created by Bertuğ Horoz on 2.12.2022.
//

import SwiftUI
import Kingfisher

struct SideMenuView: View {
    @EnvironmentObject var authViewModel : AuthViewModel
    
    var body: some View {
        if let user = authViewModel.currentUser {
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 48, height: 48)
                    
                    VStack(alignment: .leading,spacing: 4){
                        Text(user.fullname)
                            .font(.headline)
                        Text("@\(user.username)")
                            .font(.caption)
                            .foregroundColor(.gray)
                    } // : VSTACK
                    UserStatsView()
                        .padding(.vertical, 5)
                } // : VSTACK
                .padding(.leading)
                .padding(.bottom, 10)
                ForEach(SideMenuViewModel.allCases, id: \.rawValue) { viewModel in
                    if viewModel == .profile {
                        NavigationLink {
                            ProfileView(user: user)
                        } label: {
                            SideMenuOptionRowView(viewModel: viewModel)
                        }
                    } else if viewModel == .logout {
                        Button {
                            authViewModel.signOut()
                        } label: {
                            SideMenuOptionRowView(viewModel: viewModel)
                        }

                    }else {
                        SideMenuOptionRowView(viewModel: viewModel)
                    }
                    
                } // : LOOP
                .padding(.vertical, 10)
                Spacer()
            } // : VSTACK
        } //: IF
        
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
            .environmentObject(AuthViewModel())
    }
}
