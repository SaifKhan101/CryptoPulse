//
//  SearchBarView.swift
//  CryptoPulse
//
//  Created by SAIF ALI KHAN on 17/11/2023.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var searchText: String
    @EnvironmentObject var vm: HomeViewModel
    let searchBarHeight: CGFloat
    var body: some View {
        HStack {
            if searchText.isEmpty {
                Image(systemName: "magnifyingglass")
                    .bold()
                    .foregroundColor(Color.theme.walkthrough)
                    .padding(.leading)
                Text("search")
                    .bold()
                    .font(.title3)
                    .foregroundColor(Color.theme.walkthrough)
            }
            TextField("", text: $searchText)
                .font(.headline)
                .frame(height: searchBarHeight)
                .padding(.leading)
//                .padding(14)
                .overlay(alignment: .trailing) {
                    Image(systemName: "xmark.circle.fill")
                        .padding()
                        .offset(x: 5)
                        .foregroundStyle(Color.theme.red)
                        .opacity(searchText.isEmpty ? 0.0 : 1.0)
                        .onTapGesture {
                            searchText = ""
                        }
                }
        }
        .background(
             RoundedRectangle(cornerRadius: 12)
                .fill(Color.theme.secondaryText.opacity(0.1))
                .shadow(color: Color.white, radius: 10, x: 0, y: 0)
        )
        .padding(.horizontal)        
    }
}

#Preview {
    SearchBarView(searchText: .constant(""), searchBarHeight: 30)
}
