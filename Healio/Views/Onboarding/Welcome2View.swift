//
//  Welcome2View.swift
//  Healio
//
//  Created by Oleg Yakushin on 6/25/24.
//

import SwiftUI

struct Welcome2View: View {
    var body: some View {
            ZStack {
                BackgroundView()
                VStack(spacing: 15  * sizeScreen()) {
                    Image("welcome2")
                        .resizable()
                        .frame(width: 348  * sizeScreen(), height: 376  * sizeScreen())
                    Spacer()
                    Text("Find the root cause")
                        .font(.custom("AveriaSerifLibre-Light", size: 34  * sizeScreen()))
                        .kerning(-1.2  * sizeScreen())
                        .foregroundColor(Color("fontDark"))
                    VStack(spacing: 3 * sizeScreen()) {
                        Text("Repressed emotions can weaken your")
                            .font(.custom("AvertaDemoPE-Regular", size: 16  * sizeScreen()))
                            .foregroundColor(Color("fontDark"))
                            .multilineTextAlignment(.center)
                        Text("immune system and cause chronic pain.")
                            .font(.custom("AvertaDemoPE-Regular", size: 16  * sizeScreen()))
                            .foregroundColor(Color("fontDark"))
                            .multilineTextAlignment(.center)
                        Text("and illness.")
                            .font(.custom("AvertaDemoPE-Regular", size: 16  * sizeScreen()))
                            .foregroundColor(Color("fontDark"))
                            .multilineTextAlignment(.center)
                    }
                    Spacer()
                    NavigationLink(destination: Welcome3View().navigationBarBackButtonHidden()) {
                        ButtonView(name: "Continue")
                    }
                }
            }
    }
}

#Preview {
    Welcome2View()
}
