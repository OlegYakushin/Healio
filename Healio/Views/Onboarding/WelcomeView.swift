//
//  WelcomeView.swift
//  Healio
//
//  Created by Oleg Yakushin on 6/25/24.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundView()
                VStack(spacing: 15  * sizeScreen()) {
                    Image("welcome1")
                        .resizable()
                        .frame(width: 329  * sizeScreen(), height: 349  * sizeScreen())
                    Spacer()
                    Text("Welcome to Healio")
                        .font(.custom("AveriaSerifLibre-Light", size: 34  * sizeScreen()))
                        .kerning(-1.2  * sizeScreen())
                        .foregroundColor(Color("fontDark"))
                    VStack(spacing: 3 * sizeScreen()) {
                        Text("Use affirmations to shift the thought")
                            .multilineTextAlignment(.center)
                            .font(.custom("AvertaDemoPE-Regular", size: 16  * sizeScreen()))
                            .foregroundColor(Color("fontDark"))
                        Text("patterns that are making you sick.")
                            .multilineTextAlignment(.center)
                            .font(.custom("AvertaDemoPE-Regular", size: 16  * sizeScreen()))
                            .foregroundColor(Color("fontDark"))
                    }
                    Spacer()
                    NavigationLink(destination: Welcome2View().navigationBarBackButtonHidden()) {
                        ButtonView(name: "Get started")
                    }
                }
            }
        }
    }
}

#Preview {
    WelcomeView()
}
