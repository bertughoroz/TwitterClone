//
//  AuthViewModel.swift
//  TwitterSwiftUI
//
//  Created by Bertuğ Horoz on 4.12.2022.
//

import SwiftUI
import Firebase


class AuthViewModel : ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var didAuthUser = false
    @Published var currentUser : User?
    private var tempUserSession : FirebaseAuth.User?
    private let service = UserService()
    init(){
        self.userSession = Auth.auth().currentUser
        self.fetchUser()
    }
    
    func Login(withEmail email : String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Failed to signin with error \(error.localizedDescription)")
                return
            }
            guard let user = result?.user else { return }
            self.userSession = user
            self.fetchUser()
        }
        print("Login with email")
    }
    
    func Register(withEmail email :String, password: String, fullname: String, username: String) {
        // user create
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            // error message
            if let error = error {
                print("Failed to register with error \(error.localizedDescription)")
                return
            }
            guard let user = result?.user else { return }
            self.tempUserSession = user
            
            // user creation database save names
            let data = ["email": email,
                        "username": username.lowercased(),
                        "fullname": fullname,
                        "uid": user.uid]
            Firestore.firestore().collection("users")
                .document(user.uid)
                .setData(data) { _ in
                    self.didAuthUser = true
                }
            
        } //:IF LET
    } //:FUNC
    
    func signOut() {
        // sets user session to nil . we show login view
        userSession = nil
        // signs user out server
        try? Auth.auth().signOut()
    }
    
    func uploadProfileImage(_ image: UIImage) {
        guard let uid = tempUserSession?.uid else { return }
        ImageUploader.uploadImage(image: image) { profileImageUrl in
            Firestore.firestore().collection("users")
                .document(uid)
                .updateData(["profileImageUrl" : profileImageUrl]) { _ in
                    self.userSession = self.tempUserSession
                    self.fetchUser()
                }
        }
    }
    
    func fetchUser() {
        guard let uid = self.userSession?.uid else { return }
        service.fetchUser(withUid: uid) { user in
            self.currentUser = user
        }
    }
}
