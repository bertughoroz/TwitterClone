//
//  SideMenuOptionRowView.swift
//  TwitterSwiftUI
//
//  Created by Bertuğ Horoz on 2.12.2022.
//

import SwiftUI

struct SideMenuOptionRowView: View {
    // MARK: - PROPERTIES
    let viewModel : SideMenuViewModel
    // MARK: - BODY
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: viewModel.imageName)
                .foregroundColor(.white)
                .font(.headline)
            Text(viewModel.title)
                .foregroundColor(.white)
                .font(.title2)
                .bold()
                .frame(width: 150 ,alignment: .leading)
            Spacer()
                .padding(.vertical, 15)
                .padding(.horizontal)
        } // : HSTACK
        .padding(.leading)
    }
}

// MARK: - PREVIEW
struct SideMenuOptionRowView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuOptionRowView(viewModel: .profile)
    }
}
