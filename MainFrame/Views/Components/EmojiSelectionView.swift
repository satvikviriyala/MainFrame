//
//  EmojiSelectionView.swift
//  MainBoard
//
//  Created by Satvik Viriyala on 01/08/24.
//

import Foundation
import SwiftUI

struct EmojiSelectionView: View {
    let emojiOptions: [(emoji: String, description: String)]
    var onEmojiSelected: ((String) -> Void) // A closure for handling selection

    var body: some View {
        HStack {
            ForEach(emojiOptions, id: \.emoji) { option in
                Button(action: {
                    onEmojiSelected(option.emoji)
                }) {
                    Text(option.emoji)
                        .font(.system(size: 20))
                        .frame(width: 30, height: 30)
                        .background(Color.white)
                        .clipShape(Circle())
                        .shadow(color: .black.opacity(0.2), radius: 1, x: 0, y: 1)
                }
            }
        }
        .padding(5)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.3), radius: 4, x: 0, y: 2)
    }
}
