//
//  UserStatsView.swift
//  TwitterSwiftUI
//
//  Created by Bertuğ Horoz on 2.12.2022.
//

import SwiftUI

struct UserStatsView: View {
    var body: some View {
        HStack(spacing: 10){
            HStack{
                Text("125").bold().foregroundColor(.white).font(.subheadline)
                Text("Following").font(.subheadline)
            } //: HSTACK
            HStack{
                Text("465").bold().foregroundColor(.white).font(.subheadline)
                Text("Followers").font(.subheadline)
            } //: HSTACK
        } //: HSTACK
    }
}

struct UserStatsView_Previews: PreviewProvider {
    static var previews: some View {
        UserStatsView()
    }
}
