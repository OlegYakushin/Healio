//
//  Welcome2View.swift
//  Healio
//
//  Created by Oleg Yakushin on 6/25/24.
//

import SwiftUI
import Lottie

struct Welcome2View: View {
    let animationDuration: Double = 1.5
    @State private var animationProgress: CGFloat = 0
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundView()
                VStack(spacing: 15  * sizeScreen()) {
                    Image("welcome2")
                        .resizable()
                        .frame(width: 348  * sizeScreen(), height: 376  * sizeScreen())
                        .overlay(
                            LottieView(animation: .named("Radialbutton-2"))
                                .playing(loopMode: .playOnce)
                                .frame(width: 250  * sizeScreen(), height: 120  * sizeScreen())
                                .offset(x: -35 * sizeScreen(), y: -10 * sizeScreen())
                        )
                    Spacer()
                    
                    Text("Find the root cause")
                        .font(.custom("AveriaSerifLibre-Light", size: 34  * sizeScreen()))
                        .kerning(-1.2  * sizeScreen())
                        .foregroundColor(Color("fontDark"))
                        .opacity(animationProgress
                        )
                    VStack(spacing: 3 * sizeScreen()) {
                        Text("Repressed emotions can weaken your")
                            .font(.custom("AvertaDemoPE-Regular", size: 16  * sizeScreen()))
                            .foregroundColor(Color("fontDark"))
                            .multilineTextAlignment(.center)
                            .opacity(animationProgress
                            )
                        Text("immune system and cause chronic pain.")
                            .font(.custom("AvertaDemoPE-Regular", size: 16  * sizeScreen()))
                            .foregroundColor(Color("fontDark"))
                            .multilineTextAlignment(.center)
                            .opacity(animationProgress
                            )
                        Text("and illness.")
                            .font(.custom("AvertaDemoPE-Regular", size: 16  * sizeScreen()))
                            .foregroundColor(Color("fontDark"))
                            .multilineTextAlignment(.center)
                            .opacity(animationProgress
                            )
                            .onAppear {
                                withAnimation(Animation.easeInOut(duration: animationDuration)) {
                                    self.animationProgress = 1
                                }
                                
                            }
                        
                    }
                    Spacer()
                    NavigationLink(destination: Welcome3View().navigationBarBackButtonHidden()) {
                        ButtonView(name: "Continue")
                    }
                    
                }
            }
            }
            

    }
}

#Preview {
    Welcome2View()
}

