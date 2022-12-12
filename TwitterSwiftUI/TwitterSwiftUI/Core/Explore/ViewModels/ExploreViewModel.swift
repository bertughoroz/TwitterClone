//
//  ExploreViewModel.swift
//  TwitterSwiftUI
//
//  Created by Bertuğ Horoz on 9.12.2022.
//

import Foundation

class ExploreViewModel : ObservableObject {
    @Published var users = [User]()
    @Published var searchText = ""
    var searchableUsers : [User]{
        if searchText.isEmpty {
            return users
        } else {
            let lowercadesQuery = searchText.lowercased()
            return users.filter({
                $0.username.contains(lowercadesQuery) ||
                $0.fullname.lowercased().contains(lowercadesQuery)
            })
        }
    }
    let service = UserService()
    init(){
        FetchUsers()
    }
    
    func FetchUsers() {
        service.FetchUsers { users in
            self.users = users
        }
    }
}
