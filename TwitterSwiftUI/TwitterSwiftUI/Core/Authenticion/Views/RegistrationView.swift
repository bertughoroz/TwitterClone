//
//  RegistrationView.swift
//  TwitterSwiftUI
//
//  Created by Bertuğ Horoz on 4.12.2022.
//

import SwiftUI

struct RegistrationView: View {
    // MARK: - PROPERTIES
    @State private var email = ""
    @State private var username = ""
    @State private var fullname = ""
    @State private var password = ""
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel : AuthViewModel
    @State private var readyToNavigate : Bool = false
    
    // MARK: - BODY
    var body: some View {
        NavigationStack {
            VStack{
                // HEADER
                AuthHeaderView(title1: "Get started.", title2: "Create your account.")
                // TEXTFIELDS
                VStack(spacing: 40){
                    CustomInputField(imageName: "envelope", placeholderText: "Email", text: $email)
                    CustomInputField(imageName: "person", placeholderText: "Username", text: $username)
                    CustomInputField(imageName: "person", placeholderText: "Full name", text: $fullname)
                    CustomInputField(imageName: "lock", placeholderText: "Password", isSecureField: true ,text: $password)
                }//:VSTACK
                .padding(28)
                .padding(.top, -50)
                
                
                
                Button {
                    viewModel.Register(withEmail: email, password: password, fullname: fullname, username: username)
                    readyToNavigate = true
                } label: {
                    Text("Sign Up")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: UIScreen.main.bounds.width / 1.2 , height: UIScreen.main.bounds.height / 16)
                        .background(Color(.systemBlue))
                        .clipShape(Capsule())
                        .padding(.top)
                } //:BUTTON
                .shadow(color: .gray.opacity(0.5), radius: 10)
                
                Spacer()
                
                Button {
                    presentationMode.wrappedValue.dismiss()
                    
                } label: {
                    HStack {
                        Text("Already have an account?")
                            .font(.footnote)
                        Text("Sign In")
                            .font(.footnote)
                            .fontWeight(.semibold)
                    } //:HSTACK
                    .foregroundColor(Color(.systemBlue))
                    .padding(.bottom)
                } //:LABEL
            } //:VSTACK
            .navigationDestination(isPresented: $viewModel.didAuthUser) {
                ProfilePhotoSelectView()
            }
        } // NavigationStack
    } //:BODY
}
// MARK: - PREVIEW
struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
            .environmentObject(AuthViewModel())
    }
}
