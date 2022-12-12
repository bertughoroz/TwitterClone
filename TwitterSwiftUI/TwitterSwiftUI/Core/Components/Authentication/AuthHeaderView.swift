//
//  AuthenticationHeaderView.swift
//  TwitterSwiftUI
//
//  Created by Bertuğ Horoz on 4.12.2022.
//

import SwiftUI

struct AuthHeaderView: View {
    // MARK: - PROTERTIES
    let title1 : String
    let title2 :String
    // MARK: - BODY
    var body: some View {
        VStack(alignment: .leading) {
            Text(title1)
                .font(.largeTitle)
                .fontWeight(.semibold)
            Text(title2)
                .font(.largeTitle)
                .fontWeight(.semibold)
        } //:VSTACK
        .frame(width: UIScreen.main.bounds.width-15,height: UIScreen.main.bounds.height / 3, alignment: .leading)
        .padding(.leading)
        .background(Color(.systemBlue))
        .foregroundColor(.white)
        .clipShape(RoundedShape(corners: .bottomRight))
        .ignoresSafeArea(.all)
    }
}
// MARK: - PREVIEW
struct AuthHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        AuthHeaderView(title1: "Hello", title2: "Welcome back")
    }
}
