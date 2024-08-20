//
//  CommentsViewModel.swift
//  MainFrame
//
//  Created by Satvik Viriyala on 20/08/24.
//

import Foundation
import SwiftUI

class CommentsViewModel: ObservableObject {
    @Published var comments: [Comment] = []
    @Published var isAddingComment = false
    
    let post: Post

    init(post: Post) {
        self.post = post
        // Sample Comments
        self.comments = [
            Comment(postId: post.id,
                    authorID: "user1",
                    userAvatar: Image(systemName: "person.circle"),
                    commentContent: "Great post!",
                    reactions: ["like": 5],
                    replies: []),
            Comment(postId: post.id,
                    authorID: "user2",
                    userAvatar: Image(systemName: "person.circle"),
                    commentContent: "I have a question...",
                    reactions: ["wow": 2],
                    replies: [
                        Comment(postId: post.id,
                                authorID: "user1",
                                userAvatar: Image(systemName: "person.circle"), 
                                commentContent: "That's an interesting question!",
                                reactions: [:],
                                replies: [])
                    ])
        ]
    }
}
