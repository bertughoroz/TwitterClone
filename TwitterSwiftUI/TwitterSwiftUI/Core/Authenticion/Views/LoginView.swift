//
//  LoginView.swift
//  TwitterSwiftUI
//
//  Created by Bertuğ Horoz on 4.12.2022.
//

import SwiftUI

struct LoginView: View {
    // MARK: - PROPERTIES
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel : AuthViewModel
    // MARK: - BODY
    var body: some View {
        // PARENT CONTAIER
        VStack {
            // HEADER VIEW
            AuthHeaderView(title1: "Hello.", title2: "Welcome back.")
            // TEXTFIELDS
            VStack(spacing: 40) {
                CustomInputField(imageName: "envelope", placeholderText: "Email", text: $email)
                CustomInputField(imageName: "lock",
                                 placeholderText: "Password",
                                 isSecureField: true,
                                 text: $password)
            } //:VSTACK
            .padding(.horizontal, 32)
            // FORGOT PASSWORD
            HStack{
                Spacer()
                NavigationLink {
                    Text("Reset password view.")
                } label: {
                    Text("Forgot Password?")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(.systemBlue))
                        .padding(.vertical)
                        .padding(.top, 5)
                        .padding(.trailing, 24)
                }
            } //:HSTACK
            // SIGNIN BUTTON
            Button {
                viewModel.Login(withEmail: email, password: password)
            } label: {
                Text("Sign In")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width / 1.2 , height: UIScreen.main.bounds.height / 16)
                    .background(Color(.systemBlue))
                    .clipShape(Capsule())
                    .padding(.top)
            } //:BUTTON
            .shadow(color: .gray.opacity(0.5), radius: 10)

            Spacer()
            
            NavigationLink {
                RegistrationView()
                    .navigationBarHidden(true)
            } label: {
                HStack {
                    Text("Don't have an account?")
                        .font(.footnote)
                    Text("Sign Up")
                        .font(.footnote)
                        .fontWeight(.semibold)
                } //:HSTACK
            }
            .foregroundColor(Color(.systemBlue))
            .padding(.bottom)

        } //:VSTACK
        .navigationBarHidden(true)
        
    }
}
// MARK: - REVIEW
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
