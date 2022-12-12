//
//  ProfilePhotoSelectView.swift
//  TwitterSwiftUI
//
//  Created by Bertuğ Horoz on 4.12.2022.
//

import SwiftUI

struct ProfilePhotoSelectView: View {
    @State private var showImagePicker = false
    @State private var selectedImage : UIImage?
    @State private var profileImage : Image?
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        
        VStack {
            AuthHeaderView(title1: "Setup account", title2: "Add a profile photo")
            Button {
                showImagePicker.toggle()
            } label: {
                if let profileImage = profileImage {
                    profileImage
                        .resizable()
                        .foregroundColor(Color(.systemBlue))
                        .scaledToFit()
                        .clipShape(Circle())
                        .frame(width: 230, height: 230)
                        
                } else {
                    Image(systemName: "plus.circle")
                        .resizable()
                        .foregroundColor(Color(.systemBlue))
                        .scaledToFit()
                        .frame(width: 180, height: 180)
                        .padding(.top)
                        
                }
            }
            .sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
                imagePicker(selectedImage: $selectedImage)
            }
            
            if let selectedImage = selectedImage {
                Button {
                    viewModel.uploadProfileImage(selectedImage)
                } label: {
                    Text("Continue")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: UIScreen.main.bounds.width / 1.2 , height: UIScreen.main.bounds.height / 16)
                        .background(Color(.systemBlue))
                        .clipShape(Capsule())
                        .padding(.top ,80)
                } //:BUTTON
                .shadow(color: .gray.opacity(0.5), radius: 10)
            }
            
            Spacer()
        } //:VSTACK
    }
    
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        profileImage = Image(uiImage: selectedImage)
    }
    
}



struct ProfilePhotoSelectView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectView()
    }
}
