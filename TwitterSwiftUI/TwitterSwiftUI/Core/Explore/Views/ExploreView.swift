//
//  ExploreView.swift
//  TwitterSwiftUI
//
//  Created by Bertuğ Horoz on 2.12.2022.
//

import SwiftUI

struct ExploreView: View {
    @ObservedObject var viewModel = ExploreViewModel()
    
    var body: some View {
        VStack{
            SearchBar(text: $viewModel.searchText)
                .padding()
            ScrollView{
                LazyVStack{
                    ForEach(viewModel.searchableUsers) { user in
                        NavigationLink{
                                ProfileView(user: user)
                        } label: {
                            UserRowView(user: user)
                        }
                    } // : LOOP
                } // : LAZYVSTACK
            } // : SCROLL
        } // : VSTACK
        .navigationBarTitle("Explore")
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
