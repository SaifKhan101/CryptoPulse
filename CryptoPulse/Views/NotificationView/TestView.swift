//
//  TestView.swift
//  CryptoPulse
//
//  Created by SAIF ALI KHAN on 05/12/2023.
//

import SwiftUI

struct TestView: View {
    @EnvironmentObject var vm: HomeViewModel
    var body: some View {
        TabView {
//            HomeScreen()
            Text("Home")
                .badge("!")
                .tabItem {
                    Image(systemName: "bag")
                }
                
            Text("es")
                .badge(1)
                .tabItem {
                    Label("", systemImage: "bell")
                        
                }
        }        
    }
}

struct testView_previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            TestView()
                .environmentObject(dev.homeVM)
        }
    }
}
