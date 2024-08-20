//
//  EmojiView.swift
//  MainBoard
//
//  Created by Satvik Viriyala on 01/08/24.
//

import Foundation
import SwiftUI

struct EmojiView: View {
    let emoji: String

    var body: some View {
        Text(emoji)
            .font(.system(size: 20))
            .frame(width: 30, height: 30)
            .background(Color.white)
            .clipShape(Circle())
            .shadow(color: .black.opacity(0.2), radius: 1, x: 0, y: 1)
    }
}
