//
//  TabViewBoarding.swift
//  CryptoPulse
//
//  Created by SAIF ALI KHAN on 13/11/2023.
//

import SwiftUI



struct TabViewBoarding: View {
    @State private var currentPage = 0    
    var body: some View {
//        NavigationStack {
            ZStack {
                RadialGradient(gradient: Gradient(colors: [Color("BackgroundColor"), Color.accentColor]), center: .topLeading, startRadius: 5, endRadius: 420).ignoresSafeArea()
                TabView(selection: $currentPage) {
                    Walkthrough2()
                        .tabItem { EmptyView() }
                        .tag(0)
                    Walkthrough3()
                        .tabItem { EmptyView() }
                        .tag(1)
                    SegmentedTabView()
                        .tabItem { EmptyView() }
                        .tag(2)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .overlay(
                    overlayView
                    ,alignment: .bottom
                    )
                .navigationTitle("")
                .navigationBarHidden(true)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        EmptyView()
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        EmptyView()
                    }
                }
                .edgesIgnoringSafeArea([.top, .bottom])
            }
//        }
    }
}
#Preview {
    TabViewBoarding()
}

extension TabViewBoarding {
    private var overlayView: some View {
        HStack(spacing: 10) {
            if currentPage < 2 {
                ForEach(0..<2) { index in
                    Circle()
                        .fill(index == currentPage ? Color.gray : Color.secondary)
                        .frame(width: 7, height: 7)
                }
            }
        }
            .padding()
            .padding(.bottom)
            
    }
}
