//
//  WelcomeView.swift
//  Healio
//
//  Created by Oleg Yakushin on 6/25/24.
//

import SwiftUI

struct WelcomeView: View {
    let animationDuration: Double = 1.5
    @State private var animationProgress: CGFloat = 0
    @State private var shineOffset: CGFloat = -1.0
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
                        .opacity(animationProgress
                                           )
                    VStack(spacing: 3 * sizeScreen()) {
                        Text("Use affirmations to shift the thought")
                            .multilineTextAlignment(.center)
                            .font(.custom("AvertaDemoPE-Regular", size: 16  * sizeScreen()))
                            .foregroundColor(Color("fontDark"))
                            .opacity(animationProgress
                                               )
                        Text("patterns that are making you sick.")
                             .opacity(animationProgress
                                                )
                            .multilineTextAlignment(.center)
                            .font(.custom("AvertaDemoPE-Regular", size: 16  * sizeScreen()))
                            .foregroundColor(Color("fontDark"))
                            .onAppear {
                                withAnimation(Animation.easeInOut(duration: animationDuration)) {
                                    self.animationProgress = 1
                                }
                                
                            }
                        Spacer()
                        NavigationLink(destination: Welcome2View().navigationBarBackButtonHidden()) {
                            ButtonView(name: "Get started")
                        }
                    }
                }
                .onAppear {
                    withAnimation(Animation.linear(duration: 2)) {
                        shineOffset = 1.0
                    }
                }
            }
        }
    }
}

#Preview {
    WelcomeView()
}

struct ShinyImageView: View {
    let imageName: String
    let size: CGSize

    @State private var shineOffset: CGFloat = -1.0
    
    var body: some View {
        ZStack {
            Image(imageName)
                .resizable()
                .frame(width: size.width, height: size.height)
                .clipped()

            // Shine effect
            LinearGradient(
                gradient: Gradient(colors: [Color.white.opacity(0.0), Color.white.opacity(0.3), Color.white.opacity(0.0)]),
                startPoint: .leading,
                endPoint: .trailing
            )
            .frame(width: size.width * 1.5, height: size.height)
            .rotationEffect(.degrees(45))
            .offset(x: shineOffset * size.width)
            .blur(radius: 3)
            .opacity(0.6)
            .mask(Image(imageName).resizable().frame(width: size.width, height: size.height))
        }
        .onAppear {
            withAnimation(Animation.linear(duration: 2).repeatForever(autoreverses: true)) {
                shineOffset = 1.0
            }
        }
    }
}
