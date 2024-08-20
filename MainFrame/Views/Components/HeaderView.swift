//
//  HeaderView.swift
//  MainBoard
//
//  Created by Satvik Viriyala on 01/08/24.
//

import Foundation
import SwiftUI

struct HeaderView: View {
    @Binding var searchText: String // Binding for two-way communication
    let title: String            // Title to be displayed
    let titleImage: Image       // Image to be displayed in the header

    var body: some View {
        VStack(spacing: 0) {
            ZStack(alignment: .top) {
                // Title background
                titleImage
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 40)
                    .edgesIgnoringSafeArea(.all)
                    .padding(.leading, -220)
                    .padding(.top, 20)
                
                // Title text and profile icon
                HStack(alignment: .top) {
                    Text(title) // Use provided title string
                        .font(.title) // Or adjust the font style
                        .bold()
                        .padding(.leading, 17)
                        .padding(.top, 20)

                    Spacer()

                    Image("profile_pic") // Keep your profile picture
                        .resizable()
                        .scaledToFit()
                        .frame(width: 37, height: 37)
                        .clipShape(Circle())
                        .padding(.trailing, 17)
                        .padding(.top, 24)
                }
            }
            
            // Separator line
            Color.gray.opacity(0.6)
                .frame(height: 1.5)
                .padding(.horizontal, 19)
                .padding(.top, 18)

            // Search Bar
            HStack {
                TextField("Find More Communities", text: $searchText)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .padding(.horizontal, 20)
                    .padding(.top, 12)
                    .padding(.bottom, 20)

                Button(action: {
                    // Handle search (call a function on a view model, for example)
                }) {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.white)
                        .padding(10)
                        .background(Color.gray.opacity(0.5))
                        .clipShape(Circle())
                        .padding(.trailing, 19)
                }
            }
        }
        .background(Color(red: 0.93, green: 0.93, blue: 1))
    }
}

// Preview
#Preview {
    HeaderView(searchText: .constant(""), title: "Communities", titleImage: Image("CommunityLinearBackground")) // Sample usage
} 
