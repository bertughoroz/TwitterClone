//
//  SideMenuViewModel.swift
//  TwitterSwiftUI
//
//  Created by Bertuğ Horoz on 2.12.2022.
//

import Foundation

enum SideMenuViewModel : Int, CaseIterable {
    case profile
    case liste
    case bookmark
    case logout
    
    var title : String {
        switch self {
        case .profile: return "Profile"
        case .liste: return "Lists"
        case .bookmark: return "Bookmarks"
        case .logout: return "Logout"
        }
    }
    
    var imageName : String {
        switch self {
        case .profile: return "person"
        case .liste: return "list.bullet"
        case .bookmark: return "bookmark"
        case .logout: return "arrow.left.square"
        }
    }
}
