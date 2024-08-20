//
//  CommunitiesListView.swift
//  MainBoard
//
//  Created by Satvik Viriyala on 01/08/24.
//
import SwiftUI

struct CommunitiesListView: View {
    @ObservedObject var viewModel = CommunitiesListViewModel()
    @State private var searchText = ""

    var body: some View {
        NavigationView {
            VStack {
                // Search Bar (Embedded in a VStack for potential future additions)
                HeaderView(searchText: $searchText, title: "Communities", titleImage: Image("communityimage"))

                // Community List
                List {
                    ForEach(searchResults) { community in
                        NavigationLink(destination: CommunityView(viewModel: CommunityViewModel(community: community))) {
                            CommunityPostView(viewModel: CommunityPostViewModel(post: community.posts.first!)) // Use a placeholder Post
                        }
                    }
                }
            }
            .navigationTitle("Communities")
        }
    }
    
    // Filter communities based on search text
    var searchResults: [Community] {
        if searchText.isEmpty {
            return viewModel.communities
        } else {
            return viewModel.communities.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
} 
