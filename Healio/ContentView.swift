//
//  ContentView.swift
//  Healio
//
//  Created by Oleg Yakushin on 6/25/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showWelcomeView = false
    
    var body: some View {
        Group {
            if showWelcomeView {
                WelcomeView()
            } else {
                HelloView()
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                withAnimation {
                    showWelcomeView = true
                }
            }
        }
    }
}
#Preview {
    ContentView()
}
