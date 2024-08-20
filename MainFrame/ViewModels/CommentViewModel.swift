//
//  CommentViewModel.swift
//  MainFrame
//
//  Created by Satvik Viriyala on 19/08/24.
//

import Foundation
import SwiftUI

class CommentViewModel: ObservableObject {
    @Published var comment: Comment
    @Published var isExpanded = false
    @Published var isReplying = false
    @Published var replyText = ""
    @Published var authorName = "Loading..."  // Start with a placeholder
    
    let onAddReply: ((Comment) -> Void)?
    
    init(comment: Comment, onAddReply: ((Comment) -> Void)? = nil) {
        self.comment = comment
        self.onAddReply = onAddReply
    }

    // (You'll need to update this to add replies correctly
    // to the right post's comments array. We'll handle this
    // when we work on PostView.)
    func addReply() {
        let newReply = Comment(
            postId: comment.postId,
            authorID: "You", userAvatar: Image(systemName: "person.circle"), // Add a placeholder image,
            commentContent: replyText,
            reactions: [:],
            replies: []
        )
        onAddReply?(newReply)
        comment.replies.append(newReply)
        replyText = ""
        isReplying = false
    }
}
