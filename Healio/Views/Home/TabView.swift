//
//  TabsView.swift
//  Healio
//
//  Created by Oleg Yakushin on 6/27/24.
//

import SwiftUI

struct TabsView: View {
        @State private var selectedTab: Int = 1
        var body: some View {
            TabView(selection: $selectedTab) {
                HomeView()
                    .tabItem {
                        Image(selectedTab == 1 ? "homeSelMenu" : "homeMenu")
                    }
                    .tag(1)
                    .transition(.opacity)
                SearchView()
                    .tabItem {
                        Image(selectedTab == 2 ? "searchSelMenu" : "searchMenu")
                    }
                    .tag(2)
                    .transition(.opacity)
                LikedView()
                    .tabItem {
                        Image(selectedTab == 3 ? "likedSelMenu" : "likedMenu")
                    }
                    .tag(3)
                SettingsView()
                    .tabItem {
                        Image(selectedTab == 4 ? "settingsSelMenu" : "settingsMenu")
                    }
                    .tag(4)
            }
           
        }
    }

#Preview {
    TabsView()
}
