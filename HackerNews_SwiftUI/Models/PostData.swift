//
//  PostData.swift
//  H4X0R_News_DC
//
//  Created by David Chester on 10/8/21.
//

import Foundation

struct Results: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    // because we need a variable called 'id' to conform to the Identifiable Protocol, we use a computed property so that when we get back the objectID from the API call, we assign that to the 'id' variable below.
    var id: String {
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
    
}
