//
//  Welcome3View.swift
//  Healio
//
//  Created by Oleg Yakushin on 6/26/24.
//

import SwiftUI

struct Welcome3View: View {
    let animationDuration: Double = 1.5
    @State private var animationProgress: CGFloat = 0
    var body: some View {
        NavigationView {
        ZStack {
            BackgroundView()
            VStack(spacing: 15  * sizeScreen()) {
                Image("welcome3")
                    .resizable()
                    .frame(width: 388  * sizeScreen(), height: 373  * sizeScreen())
                    .overlay(
                        ParticleView()
                    )
                Spacer()
                Text("Healing affirmations")
                    .font(.custom("AveriaSerifLibre-Light", size: 34  * sizeScreen()))
                    .kerning(-1.2  * sizeScreen())
                    .foregroundColor(Color("fontDark"))
                    .opacity(animationProgress
                                       )
                VStack(spacing: 3 * sizeScreen()) {
                    Text("Practicing affirmations reprograms your")
                        .font(.custom("AvertaDemoPE-Regular", size: 16  * sizeScreen()))
                        .foregroundColor(Color("fontDark"))
                        .opacity(animationProgress
                                           )
                        .multilineTextAlignment(.center)
                    Text("mind, fosters healing, and promotes")
                        .font(.custom("AvertaDemoPE-Regular", size: 16  * sizeScreen()))
                        .foregroundColor(Color("fontDark"))
                        .opacity(animationProgress
                                           )
                        .multilineTextAlignment(.center)
                    Text("wellness.")
                        .font(.custom("AvertaDemoPE-Regular", size: 16  * sizeScreen()))
                        .foregroundColor(Color("fontDark"))
                        .opacity(animationProgress
                                           )
                        .multilineTextAlignment(.center)
                }
                Spacer()
                NavigationLink(destination: NameView().navigationBarBackButtonHidden()) {
                    ButtonView(name: "Continue")
                }
            }
            .onAppear {
                withAnimation(Animation.easeInOut(duration: animationDuration)) {
                    self.animationProgress = 1
                }
            }
            }

        }
}
}


#Preview {
    Welcome3View()
}
