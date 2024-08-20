//
//  PostViewModel.swift
//  MainFrame
//
//  Created by Satvik Viriyala on 19/08/24.
//

import SwiftUI

class PostViewModel: ObservableObject {
    let post: Post
    @Published var isContentExpanded = false
    @Published var comments: [Comment] = []
    @Published var isReplying = false
    @Published var replyText = ""

    init(post: Post) {
        self.post = post
        self.comments = [
            Comment(postId: post.id,
                    authorID: "user123",
                    userAvatar: Image(systemName: "person.circle"),
                    commentContent: "This is a sample comment on this post.",
                    reactions: [:],
                    replies: [
                        Comment(postId: post.id,
                                authorID: "user456",
                                userAvatar: Image(systemName: "person.circle"),
                                commentContent: "A reply to the comment.",
                                reactions: [:],
                                replies: []
                        )
                    ]
            ),
            Comment(postId: post.id,
                    authorID: "user789",
                    userAvatar: Image(systemName: "person.circle"),
                    commentContent: "Another interesting comment!",
                    reactions: [:],
                    replies: [])
        ]
    }
    
    func updateReaction(for commentId: UUID, with emoji: String) {
        if let commentIndex = comments.firstIndex(where: { $0.id == commentId }) {
            comments[commentIndex].reactions[emoji, default: 0] += 1
        }
    }
    
    func totalReactions(for comment: Comment) -> Int {
        return comment.reactions.values.reduce(0, +)
    }
    
    func selectedEmoji(for comment: Comment) -> String? {
        return comment.reactions.first?.key
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

    func addReply(to parentComment: Comment, replyText: String) {
            if let parentCommentIndex = comments.firstIndex(where: { $0.id == parentComment.id }) {
                let newReply = Comment(
                    postId: post.id,
                    authorID: "You",
                    userAvatar: Image(systemName: "person.circle"), // Or your actual image
                    commentContent: replyText,
                    reactions: [:],
                    replies: []
                )

                comments[parentCommentIndex].replies.append(newReply)
                self.replyText = "" // Clear the reply text field (in PostViewModel)
                isReplying = false
            }
        }
    
    func sendReply() {
            if let lastComment = comments.last {
                addReply(to: lastComment, replyText: replyText)
            } else {
                // Handle the case where the post ID doesn't match (you'll need to
                // find the correct comment in the array if replies are nested)
            }
        }
    }
