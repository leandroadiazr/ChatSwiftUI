//
//  TabBarView.swift
//  ChatUI
//
//  Created by Leandro A diaz R on 9/7/21.
//

import SwiftUI

struct TabBarView: View {
    @State private var selectedView = 0
        var body: some View {
            NavigationView {
                TabView(selection: $selectedView) {
                    HomeView()
                        .onTapGesture {
                            selectedView = 0
                        }
                        .tabItem {
                            Image(systemName: "house")
                            Text("Home")
                        }.tag(0)
                    
                    ChatView()
                        .onTapGesture {
                            selectedView = 1
                        }
                        .tabItem {
                            Image(systemName: "bubble.left.and.bubble.right")
                            Text("Chat")
                        }.tag(1)
                    
                    SettingsView()
                        .onTapGesture {
                            selectedView = 2
                        }
                        .tabItem {
                            Image(systemName: "gear")
                                
                            Text("Settings")
                        }.tag(2)
    
                }
                .accentColor(.green)
                .navigationTitle(tabTitle)
            }
            
      
    }
    
    var tabTitle: String {
        switch selectedView {
        case 0: return "Home"
        case 1: return "Chat"
        case 2: return "Settings"
        default: return "Home"
        }
    }
    
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}

//enum TabTitle: CaseIterable {
//
//}
