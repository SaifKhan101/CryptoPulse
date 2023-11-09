//
//  SegmentedTabView.swift
//  CryptoPulse
//
//  Created by SAIF ALI KHAN on 13/11/2023.
//

import SwiftUI

struct SegmentedTabView: View {
    @State private var selectedTab = 0
    var body: some View {
            VStack {
                Spacer()
                TopBarView(selectedTab: self.$selectedTab)
                if selectedTab == 0 {
                    LogIn()
                } else {
                    Register()
                }
                
                
            }
            .background(Color.accentColor)
            .navigationTitle("")
            .navigationBarHidden(true)
            .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        EmptyView()
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        EmptyView()
                    }
                }
    }
}
#Preview {
    SegmentedTabView()
}
