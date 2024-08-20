//
//  Community.swift
//  MainBoard
//
//  Created by Satvik Viriyala on 01/08/24.
//
//
import SwiftUI

struct Community: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let image: Image
    let memberCount: Int
    var posts: [Post] = []  // Now stores an array of Posts
}
