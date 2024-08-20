//
//  CommunityPostViewModel.swift
//  MainBoard
//
//  Created by Satvik Viriyala on 01/08/24.
//

import SwiftUI

class CommunityPostViewModel: ObservableObject {
    @Published var communityPost: CommunityPost
    @Published var isContentExpanded = false

    init(communityPost: CommunityPost) {
        self.communityPost = communityPost
    }
    
    func timeAgoDisplay(timeOfPost: Date) -> String {
        let elapsedTime = Date().timeIntervalSince(timeOfPost)
        if elapsedTime < 60 {
            return "Just now"
        } else if elapsedTime < 3600 {
            return "\(Int(elapsedTime / 60))m ago"
        } else if elapsedTime < 86400 {
            return "\(Int(elapsedTime / 3600))h ago"
        } else {
            return "\(Int(elapsedTime / 86400))d ago"
        }
    }
}
