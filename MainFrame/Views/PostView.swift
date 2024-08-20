//
//  PostView.swift
//  MainBoard
//
//  Created by Satvik Viriyala on 01/08/24.
//

import SwiftUI

struct PostView: View {
    @ObservedObject var viewModel: PostViewModel
    @Binding var isReplying: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(alignment: .center) {
                viewModel.post.userAvatar
                    .resizable()
                    .frame(width: 42, height: 42)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(Color.white, lineWidth: 2)
                    )

                VStack(alignment: .leading) {
                    Text(viewModel.post.userName)
                        .font(.system(size: 20))
                        .foregroundColor(Color(red: 0.592, green: 0.592, blue: 0.592))

                    Text(viewModel.timeAgoDisplay(timeOfPost: viewModel.post.timeOfPost))
                        .font(.system(size: 9))
                        .foregroundColor(Color(red: 0.69, green: 0.69, blue: 0.792))
                }

                Spacer()
            }
            .padding(.leading, 16)
            .padding(.top, 16)

            Text(viewModel.post.content)
                .font(.system(size: 14))
                .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.357))
                .lineLimit(viewModel.isContentExpanded ? nil : 2)
                .padding(.horizontal, 16)
                .padding(.top, 12)

            if !viewModel.isContentExpanded && viewModel.post.content.count > 100 {
                Button("See More") {
                    viewModel.isContentExpanded.toggle()
                }
                .font(.system(size: 14))
                .foregroundColor(Color(red: 0.48, green: 0.48, blue: 1))
                .padding(.horizontal, 10)
            }
            Divider()
                .padding(.horizontal, 16)
                .padding(.top, 10)

            // Reactions and Replies:
            if !viewModel.comments.isEmpty {
                ReactionsReplyView(comment: viewModel.comments.first!,
                                   isReplying: $viewModel.isReplying)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 10)

                ForEach(viewModel.comments) { comment in
                    CommentView(viewModel: CommentViewModel(comment: comment, onAddReply: { reply in // Corrected line
                        viewModel.addReply(to: comment, replyText: reply.commentContent) // Corrected to pass the reply text
                    }))
                    .padding(.leading, 16)
                }
                // Comment Input Field
                if viewModel.isReplying {
                        HStack {
                            TextField("Write a reply...", text: $viewModel.replyText)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            Button("Send") {
                                viewModel.sendReply() // No need to pass postId here
                            }
                        }
                        .padding(.leading, 50)
                    }
            }
        } // End of VStack
        .background(Color.white)
        .cornerRadius(10)
        .padding(.horizontal, 16)
        .padding(.bottom, 16)
    }
}
