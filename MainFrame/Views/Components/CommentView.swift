//
//  CommentView.swift
//  MainBoard
//
//  Created by Satvik Viriyala on 01/08/24.
//

import SwiftUI

struct CommentView: View {
    @ObservedObject var viewModel: CommentViewModel
    @State private var showReplies: Bool = false

    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                viewModel.comment.userAvatar
                    .resizable()
                    .frame(width: 35, height: 35)
                    .clipShape(Circle())
                
                VStack(alignment: .leading) {
                    Text("@\(viewModel.authorName)")
                        .font(.system(size: 14))
                        .foregroundColor(Color(red: 0.592, green: 0.592, blue: 0.592))
                    
                    Text(viewModel.comment.commentContent)
                        .font(.system(size: 14))
                        .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.357))
                        .lineLimit(viewModel.isExpanded ? nil : 2)
                    
                    if !viewModel.isExpanded && viewModel.comment.commentContent.count > 100 {
                        Button("See More") {
                            viewModel.isExpanded.toggle()
                        }
                        .font(.system(size: 14))
                        .foregroundColor(Color(red: 0.48, green: 0.48, blue: 1))
                    }
                }
            }
            
            // Reactions and Replies Section
            HStack {
                ReactionsReplyView(comment: viewModel.comment,
                                   isReplying: $viewModel.isReplying)
                                   // Ensure this initializer matches what you have in ReactionsReplyView
                                   // If `onReactionUpdate` isn't needed, remove it
                Spacer()
                Button(action: {
                    showReplies.toggle() // Toggle the reply section
                }) {
                    Text("Reply")
                        .font(.caption)
                }
            }
            // Replies Display
            if showReplies {
                            ForEach(viewModel.comment.replies) { reply in
                                CommentView(viewModel: CommentViewModel(comment: reply)) // Corrected line
                                    .padding(.leading, 20)
                            }

                // Reply Input (for adding replies)
                if viewModel.isReplying {
                    HStack {
                        TextField("Write a reply...", text: $viewModel.replyText)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        Button("Send") {
                            viewModel.addReply()
                        }
                    }
                    .padding(.leading, 50)
                }
            }
        }
        .padding(10)
        .background(Color.white)
        .cornerRadius(10)
    }
}
