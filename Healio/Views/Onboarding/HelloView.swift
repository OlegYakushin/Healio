//
//  HelloView.swift
//  Healio
//
//  Created by Oleg Yakushin on 6/25/24.
//

import SwiftUI
import Lottie
import WebKit


struct HelloView: View {
    @State var isVisible = false
    var body: some View {
        ZStack {
            Color("startColor")
                .ignoresSafeArea()
            if isVisible {
                VStack(spacing: 16 * sizeScreen()) {
                    
                    Text("Healio")
                        .font(.custom("AveriaSerifLibre-Light", size: 40  * sizeScreen()))
                        .kerning(-1.2  * sizeScreen())
                        .foregroundColor(Color("fontDark"))
                    
                    Text("Harness the power of the\nhealing affirmations")
                        .multilineTextAlignment(.center)
                        .font(.custom("AvertaDemoPE-Regular", size: 16  * sizeScreen()))
                        .foregroundColor(Color("fontDark"))
                
                    LottieView(animation: .named("hello1"))
                        .playing(loopMode: .loop)
                        .frame(width: 250  * sizeScreen(), height: 120  * sizeScreen())
                }
                .transition (.asymmetric(
                    insertion:
                            .opacity.animation(.easeInOut.delay (0.5)),
                    removal:.opacity.animation(.easeInOut)
                ))
            }
          
        }
        .onAppear{
            withAnimation(.easeInOut.delay(isVisible ? 0.5 : 0)) {
                isVisible = true
            }
        }
    }
}

#Preview {
    HelloView()
}


