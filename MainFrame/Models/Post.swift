//
//  Post.swift
//  MainBoard
//
//  Created by Satvik Viriyala on 01/08/24.
//

import SwiftUI

struct Post: Identifiable {
    let id = UUID()
    let content: String
    let userAvatar: Image
    let communityId: String // The ID of the parent Community
    let userName: String
    let communityName: String
    let timeOfPost: Date = Date()
}
