//
//  WelcomeNameView.swift
//  Healio
//
//  Created by Oleg Yakushin on 6/25/24.
//

import SwiftUI

struct WelcomeNameView: View {
    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                Text("Let’s get to know each other. What is your name?")
            }
        }
    }
}

#Preview {
    WelcomeNameView()
}
