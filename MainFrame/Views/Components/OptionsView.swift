//
//  OptionsView.swift
//  MainBoard
//
//  Created by Satvik Viriyala on 01/08/24.
//

import Foundation
import SwiftUI

struct OptionsView: View {
    @Environment(\.presentationMode) var presentationMode // Add this line

    var onReport: () -> Void
    var onBlock: () -> Void

    var body: some View {
        VStack {
            Button(action: onReport) {
                Text("Report")
            }

            Button(action: onBlock) {
                Text("Block")
            }

            Button("Cancel") {
                // Now you can use presentationMode
                presentationMode.wrappedValue.dismiss()
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(16)
    }
}
