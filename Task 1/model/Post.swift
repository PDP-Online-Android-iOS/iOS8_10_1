//
//  Post.swift
//  Task 1
//
//  Created by Ogabek Matyakubov on 17/01/23.
//

import Foundation

struct Post: Decodable {
    var id: Int
    var title: String
    var body: String
    var userId: Int
}
