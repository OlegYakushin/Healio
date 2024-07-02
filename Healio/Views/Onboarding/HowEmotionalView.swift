//
//  HowEmotionalView.swift
//  Healio
//
//  Created by Oleg Yakushin on 7/1/24.
//

import SwiftUI
import Lottie

struct HowEmotionalView: View {
    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                LottieView(animation: .named("Onboarding_tree"))
                    .playing(loopMode: .loop)
                    .frame(width: 305 * sizeScreen(),
                           height: 285 * sizeScreen())
                Text("How emotional\nstress affects you")
                    .font(.custom("AveriaSerifLibre-Light", size: 34  * sizeScreen()))
                    .kerning(-1.2)
                    .foregroundColor(Color("fontDark"))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20  * sizeScreen())
                HStack {
                        Image("pointImage")
                            .resizable()
                            .frame(width: 20 * sizeScreen(),
                                   height: 20 * sizeScreen())
                    Text("It can weaken your immune system")
                        .font(.custom("AvertaDemoPE-Regular", size: 16  * sizeScreen()))
                        .foregroundColor(Color("fontDark"))
                        .padding(.leading, 10  * sizeScreen())
                }
                .frame(width: 330 * sizeScreen(), alignment: .leading)
                HStack {
                    VStack {
                        Image("pointImage")
                            .resizable()
                            .frame(width: 20 * sizeScreen(),
                                   height: 20 * sizeScreen())
                            .padding(.top, 5 * sizeScreen())
                        Spacer()
                    }
                    Text("It can heighten vulnerability to infections, illnesses, and autoimmuned isorders")
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
                    Text("It can compromise your body’s ability to defend against pathogens and maintain health")
                        .font(.custom("AvertaDemoPE-Regular", size: 16  * sizeScreen()))
                        .foregroundColor(Color("fontDark"))
                        .multilineTextAlignment(.leading)
                        .padding(.leading, 10  * sizeScreen())
                }
                .frame(width: 330 * sizeScreen(), height: 69 * sizeScreen(), alignment: .leading)
                Spacer()
                NavigationLink(destination: OvercomeView().navigationBarBackButtonHidden()) {
                    ButtonView(name: "Continue")
                }
              
            }
        }
    }
}

#Preview {
    HowEmotionalView()
}
