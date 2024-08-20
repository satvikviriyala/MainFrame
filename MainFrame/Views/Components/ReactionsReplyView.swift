//
//  ReactionsReplyView.swift
//  MainBoard
//
//  Created by Satvik Viriyala on 01/08/24.
//

import SwiftUI

struct ReactionsReplyView: View {
    let comment: Comment
    @Binding var isReplying: Bool
    @State private var showEmojiPicker = false

    // Replace this with your array of emojis and their descriptions:
    let emojiOptions: [(emoji: String, description: String)] = [
        ("❤️", ""), ("🌟", ""), ("🫂", ""), ("😢", ""), ("👏", "")
    ]

    var body: some View {
        HStack {
            // Reaction Button
            Button(action: {
                // This button's action might be more complex in the final app
                // to handle things like long-press or toggling between selected/unselected emojis
                showEmojiPicker.toggle()
            }) {
                HStack {
                    // Placeholder for the reaction image/emoji:
                    Image(systemName: "heart.fill")
                        .foregroundColor(.red)

                    Text("0") // Placeholder for reaction count
                }
                .padding(.vertical, 5)
                .padding(.horizontal, 10)
                .background(Color.white)
                .cornerRadius(15)
                .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color(red: 0.48, green: 0.48, blue: 1), lineWidth: 1))
            }
            
            // Inline Emoji Picker (shows when showEmojiPicker is true)
            if showEmojiPicker {
                EmojiSelectionView(emojiOptions: emojiOptions, onEmojiSelected: { selectedEmoji in
                    // Call a function on a view model here to handle reaction updates:
                    // viewModel.updateReaction(with: selectedEmoji)
                    print("Selected Emoji: \(selectedEmoji)")

                    // Update the count label
                    // ...

                    showEmojiPicker = false // Hide the picker after selection
                })
            }
            
            Spacer()

            // Reply Button
            Button(action: {
                isReplying.toggle() // Trigger the display of the reply text field
            }) {
                Image("Share")  // Replace with the appropriate image for "Reply"
                    .renderingMode(.original)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
            }
        }
        .padding(.horizontal, 10)
    }
}
