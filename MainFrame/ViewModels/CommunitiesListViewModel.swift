//
//  CommunitiesListViewModel.swift
//  MainBoard
//
//  Created by Satvik Viriyala on 01/08/24.
//
//
import SwiftUI

class CommunitiesListViewModel: ObservableObject {
    @Published var communities: [Community] = []

    init() {
        communities = SampleData.communities
    }
}
