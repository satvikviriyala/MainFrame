//
//  CommunityPost.swift
//  MainFrame
//
//  Created by Satvik Viriyala on 19/08/24.
//
import SwiftUI

struct CommunityPost: Identifiable {
    let id = UUID()
    let content: String
    var userAvatar: Image
    let communityImage: Image
    let userName: String
    let communityName: String
    let communityId: String // The ID of the Community
    let timeOfPost: Date = Date()
    let hasJoinedCommunity: Bool // Example property
}
