//
//  CommunityPostView.swift
//  MainBoard
//
//  Created by Satvik Viriyala on 01/08/24.
//

import SwiftUI

struct CommunityPostView: View {
    @ObservedObject var viewModel: CommunityPostViewModel
    @State private var isReplying: Bool = false

    var body: some View {
        NavigationLink(destination: CommunityView(viewModel: CommunityViewModel(community: getCommunityForCommunityPost()))) {
            VStack(alignment: .leading) {
                HStack {
                    $viewModel.communityPost.userAvatar
                        .resizable()
                        .frame(width: 30, height: 30)
                        .clipShape(Circle())

                    $viewModel.communityPost.communityImage
                        .resizable()
                        .frame(width: 30, height: 30)
                        .clipShape(Circle())

                    VStack(alignment: .leading) {
                        Text($viewModel.communityPost.userName)
                            .font(.headline)
                            .foregroundColor(.primary)
                        Text($viewModel.communityPost.communityName)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    Spacer()
                }
                .padding(.horizontal)

                Text($viewModel.communityPost.content)
                    .font(.body)
                    .lineLimit(viewModel.isContentExpanded ? nil : 2)
                    .padding(.horizontal)

                if !viewModel.isContentExpanded && viewModel.communityPost.content.count > 100 {
                    Button(action: {
                        viewModel.isContentExpanded.toggle()
                    }) {
                        Text("See More")
                            .font(.caption)
                            .foregroundColor(.blue)
                    }
                    .padding(.horizontal)
                }

                HStack {
                    VStack(alignment: .leading) {
                        Text("Sample Comment 1")
                            .font(.caption)
                    }
                    Spacer()

                    // Note: getPostFromCommunityPost is likely unnecessary
                    NavigationLink(destination: CommentsView(viewModel: CommentsViewModel(post: getPostFromCommunityPost()))) {
                        Text("View All Comments")
                            .font(.caption)
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 8)
            }
            .padding(.vertical)
            .background(Color.white)
            .cornerRadius(10)
            .padding(.horizontal)
        }
    }

    // IMPORTANT: You MUST update the implementation of this function
    private func getCommunityForCommunityPost() -> Community {
        guard let communityIdUUID = UUID(uuidString: viewModel.communityPost.communityId) else {
            return Community(name: "Unknown", description: "", image: Image(""), memberCount: 0)
        }

        // Replace this with your actual logic to find the Community:
        if let community = SampleData.communities.first(where: { $0.id == communityIdUUID }) {
            return community
        } else {
            // Return a default or placeholder Community if it's not found
            return Community(name: "Unknown", description: "", image: Image(""), memberCount: 0)
        }
    }

    // Likely Unnecessary: Adapt if needed based on your CommunityPost-to-Post relationship
    private func getPostFromCommunityPost() -> Post {
        // ... your implementation, if necessary ...
        return Post(content: viewModel.communityPost.content,
                    userAvatar: viewModel.communityPost.userAvatar,
                    communityId: viewModel.communityPost.communityId,
                    userName: viewModel.communityPost.userName,
                    communityName: viewModel.communityPost.communityName,
                    communityImage: viewModel.communityPost.communityImage)
    }
}
