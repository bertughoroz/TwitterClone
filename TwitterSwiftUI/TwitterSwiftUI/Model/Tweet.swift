//
//  Tweet.swift
//  TwitterSwiftUI
//
//  Created by Bertuğ Horoz on 10.12.2022.
//

import Foundation
import FirebaseFirestoreSwift
import Firebase

struct Tweet: Identifiable, Decodable {
    @DocumentID var id : String?
    let caption : String
    let timestamp : Timestamp
    let uid : String
    var likes : Int
    
    var user: User?
    var didLike : Bool? = false
}
