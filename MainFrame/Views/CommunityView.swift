//
//  CommunityView..swift
//  MainBoard
//
//  Created by Satvik Viriyala on 01/08/24.
//

import SwiftUI

struct CommunityView: View {
    @ObservedObject var viewModel: CommunityViewModel
    @State private var isReplying = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                // Community Header Information
                HStack(alignment: .top) {
                    viewModel.community.image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())

                    VStack(alignment: .leading) {
                        Text(viewModel.community.name)
                            .font(.title)

                        Text(viewModel.community.description)
                            .font(.subheadline)

                        Text("\(viewModel.community.memberCount) members")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                }
                .padding()

                // Join Button
                Button(action: {
                    viewModel.isJoined.toggle()
                }) {
                    Text(viewModel.isJoined ? "Joined" : "Join")
                        .padding()
                        .background(viewModel.isJoined ? Color.green : Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.horizontal)

                // Display Posts (Will be populated later with real Post data)
                ForEach(viewModel.community.posts.indices, id: \.self) { index in
                    PostView(viewModel: PostViewModel(post: viewModel.community.posts[index]), isReplying: $isReplying)
                }
            }
            .navigationTitle(viewModel.community.name) // Navigation title from view model
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        viewModel.showAddPostView = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $viewModel.showAddPostView) {
                AddPostView()
                    .background(Color(red: 0.93, green: 0.93, blue: 1))
            }
        } // End ScrollView
    }
}
