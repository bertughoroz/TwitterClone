//
//  CustomInputField.swift
//  TwitterSwiftUI
//
//  Created by Bertuğ Horoz on 4.12.2022.
//

import SwiftUI

struct CustomInputField: View {
    // MARK: - PROPERTIES
    let imageName :String
    let placeholderText :String
    var isSecureField : Bool? = false
    @Binding var text :String
    // MARK: - BODY
    var body: some View {
        VStack{
            HStack{
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color(.gray))
                
                if isSecureField ?? false {
                    SecureField(placeholderText, text: $text)
                }else{
                    TextField( placeholderText, text: $text)
                }
            }//:HSTACK
            Divider()
                .background {
                    Color(.gray)
                }
        }//:VSTACK
    }
}
// MARK: - PREVIEW
struct CustomInputField_Previews: PreviewProvider {
    static var previews: some View {
        CustomInputField(imageName: "envelope",
                         placeholderText: "Email",
                         isSecureField: false ,
                         text: .constant(""))
    }
}
