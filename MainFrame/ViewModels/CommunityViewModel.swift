//
//  CommunityViewModel.swift
//  MainBoard
//
//  Created by Satvik Viriyala on 01/08/24.
//

import SwiftUI

class CommunityViewModel: ObservableObject {
    let community: Community
    @Published var showAddPostView = false // Controls Add Post modal view
    @Published var isJoined: Bool

    init(community: Community) {
        self.community = community
        self.isJoined = false  // For sample data, we'll start not joined.
    }
}
