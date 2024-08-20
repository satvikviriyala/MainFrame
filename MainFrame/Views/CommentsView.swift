//
//  CommentsView.swift
//  MainFrame
//
//  Created by Satvik Viriyala on 20/08/24.
//

import Foundation
import SwiftUI

struct CommentsView: View {
    @ObservedObject var viewModel: CommentsViewModel
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationView { // Add NavigationView for a navigation bar
            List {
                ForEach(viewModel.comments) { comment in
                    CommentView(viewModel: CommentViewModel(comment: comment))
                }
            }
            .navigationTitle("Comments")
            .navigationBarTitleDisplayMode(.inline) // Makes title smaller
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                    }
                }
            }
        }
    }
} 
