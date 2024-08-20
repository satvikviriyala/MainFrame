//
//  VerticalDivider.swift
//  MainBoard
//
//  Created by Satvik Viriyala on 01/08/24.
//

import Foundation
import SwiftUI

struct VerticalDivider: View {
    var height: CGFloat = 100  // Provide a default height

    var body: some View {
        Rectangle()
            .fill(Color(red: 0.64, green: 0.64, blue: 1)) // Your divider color
            .frame(width: 1, height: height)
    }
}
