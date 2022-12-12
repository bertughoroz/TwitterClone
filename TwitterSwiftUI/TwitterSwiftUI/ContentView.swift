//
//  ContentView.swift
//  TwitterSwiftUI
//
//  Created by Bertuğ Horoz on 1.12.2022.
//

import SwiftUI
import Kingfisher

struct ContentView: View {
    // MARK: - PROPERTIES
    @State private var showMenu = false
    @EnvironmentObject var viewModel : AuthViewModel
    
    // MARK: - BODY
    var body: some View {
        Group {
            if viewModel.userSession == nil {
                LoginView()
            } else {
                mainInterfaceView
            }
        } //:GROUP
    }
}
// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AuthViewModel())
    }
}
extension ContentView {
    var mainInterfaceView: some View {
            ZStack(alignment: .topLeading) {
                MainTabView()
                    .offset(x: showMenu ? UIScreen.main.bounds.width/1.35 : 0)
                    .navigationBarHidden(showMenu)
                if showMenu {
                    ZStack{
                        Color(.gray)
                            .opacity(showMenu ? 0.25 : 0.0)
                    }.onTapGesture {
                        withAnimation(.easeInOut) {
                            showMenu = false
                        }
                    }
                    .ignoresSafeArea(.all)
                }
                SideMenuView()
                    .frame(width: UIScreen.main.bounds.width / 1.35)
                    .offset(x: showMenu ? 0 : -UIScreen.main.bounds.width/1.35 , y: 0)
                    .background(showMenu ? .black : .clear)
            } // : ZSTACK
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    if let user = viewModel.currentUser {
                        Button {
                            withAnimation(.easeInOut) {
                                showMenu.toggle()
                            }
                        } label: {
                            KFImage(URL(string: user.profileImageUrl))
                                .resizable()
                                .scaledToFill()
                                .frame(width: 32, height: 32)
                                .clipShape(Circle())
                            
                        }
                    }

                }
                ToolbarItem(placement: .principal) {
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 72, height: 72)
                } // : TOOLBAR LOGO
            }
            .onAppear {
                showMenu = false
            }
    }
}
