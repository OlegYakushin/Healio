//
//  ThisIsView.swift
//  Healio
//
//  Created by Oleg Yakushin on 7/1/24.
//

import SwiftUI
import Lottie

struct ThisIsView: View {
    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
               // Onboarding_tree
                LottieView(animation: .named("Onboarding_dondalion"))
                    .playing(loopMode: .playOnce)
                    .frame(width: 305 * sizeScreen(),
                           height: 285 * sizeScreen())
                Text("This is how Helio\ncan help you")
                    .font(.custom("AveriaSerifLibre-Light", size: 34  * sizeScreen()))
                    .kerning(-1.2)
                    .foregroundColor(Color("fontDark"))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20  * sizeScreen())
                    .padding(.top, 30 * sizeScreen())
                HStack {
                    VStack {
                        Image("pointImage")
                            .resizable()
                            .frame(width: 20 * sizeScreen(),
                                   height: 20 * sizeScreen())
                            .padding(.top, 5 * sizeScreen())
                        Spacer()
                    }
                    Text("Identifying any negative or limiting beliefs that might be contributing to your illness")
                        .font(.custom("AvertaDemoPE-Regular", size: 16  * sizeScreen()))
                        .foregroundColor(Color("fontDark"))
                        .multilineTextAlignment(.leading)
                        .padding(.leading, 10  * sizeScreen())
                }
                .frame(width: 330 * sizeScreen(), height: 69 * sizeScreen(), alignment: .leading)
                HStack {
                    VStack {
                        Image("pointImage")
                            .resizable()
                            .frame(width: 20 * sizeScreen(),
                                   height: 20 * sizeScreen())
                            .padding(.top, 5 * sizeScreen())
                        Spacer()
                    }
                    Text("Replacing negative beliefs with positive affirmations")
                        .font(.custom("AvertaDemoPE-Regular", size: 16  * sizeScreen()))
                        .foregroundColor(Color("fontDark"))
                        .multilineTextAlignment(.leading)
                        .padding(.leading, 10  * sizeScreen())
                }
                .frame(width: 330 * sizeScreen(), height: 46 * sizeScreen(), alignment: .leading)
                HStack {
                    Text("Consistent repetition of affirmations helps reprogram your mind.")
                        .font(.custom("AvertaDemoPE-Regular", size: 16  * sizeScreen()))
                        .foregroundColor(Color("fontDark"))
                        .multilineTextAlignment(.center)
                        .padding(.leading, 10  * sizeScreen())
                        .padding(.top, 20 * sizeScreen())
                }
                .frame(width: 330 * sizeScreen(), alignment: .leading)
                Spacer()
                NavigationLink(destination: SetUpdailyView().navigationBarBackButtonHidden()) {
                    ButtonView(name: "Continue")
                }
              
            }
        }
    }
}
#Preview {
    ThisIsView()
}
