//
//  Comment.swift
//  MainBoard
//
//  Created by Satvik Viriyala on 01/08/24.
//
//
import SwiftUI

struct Comment: Identifiable { // Remove Hashable for now
    let id = UUID()
    let postId: UUID
//    let userName: String
    let authorID: String
    let userAvatar: Image
    let timestamp: Date = Date()
    let commentContent: String
    var reactions: [String: Int] = [
        "like": 0, "love": 0, "wow": 0, "sad": 0, "angry": 0
    ]
    var replies: [Comment] = []
}
// need to update documentation

