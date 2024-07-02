//
//  BegunView.swift
//  Healio
//
//  Created by Oleg Yakushin on 7/1/24.
//

import SwiftUI
import Lottie

struct BegunView: View {
    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                LottieView(animation: .named("FlowerRotation"))
                    .playing(loopMode: .loop)
                    .frame(width: 40 * sizeScreen(),
                           height: 40 * sizeScreen())
                Text("Your healing journey has already begun!")
                    .font(.custom("AveriaSerifLibre-Light", size: 34  * sizeScreen()))
                    .kerning(-1.2)
                    .foregroundColor(Color("fontDark"))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20  * sizeScreen())
                    .padding(.vertical, 80  * sizeScreen())
                LottieView(animation: .named("FlowerRotation"))
                    .playing(loopMode: .loop)
                    .frame(width: 40 * sizeScreen(),
                           height: 40 * sizeScreen())
            }
                VStack {
                Spacer()
                NavigationLink(destination: TryPremiumView().navigationBarBackButtonHidden()) {
                    ButtonView(name: "Continue")
                }
              
            }
        }
    }
}

#Preview {
    BegunView()
}
