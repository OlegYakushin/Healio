//
//  Welcome3View.swift
//  Healio
//
//  Created by Oleg Yakushin on 6/26/24.
//

import SwiftUI

struct Welcome3View: View {
    var body: some View {
        ZStack {
            BackgroundView()
            VStack(spacing: 15  * sizeScreen()) {
                Image("welcome3")
                    .resizable()
                    .frame(width: 388  * sizeScreen(), height: 355  * sizeScreen())
                Spacer()
                Text("Healing affirmations")
                    .font(.custom("AveriaSerifLibre-Light", size: 34  * sizeScreen()))
                    .kerning(-1.2  * sizeScreen())
                    .foregroundColor(Color("fontDark"))
                VStack(spacing: 3 * sizeScreen()) {
                    Text("Practicing affirmations reprograms your")
                        .font(.custom("AvertaDemoPE-Regular", size: 16  * sizeScreen()))
                        .foregroundColor(Color("fontDark"))
                        .multilineTextAlignment(.center)
                    Text("mind, fosters healing, and promotes")
                        .font(.custom("AvertaDemoPE-Regular", size: 16  * sizeScreen()))
                        .foregroundColor(Color("fontDark"))
                        .multilineTextAlignment(.center)
                    Text("wellness.")
                        .font(.custom("AvertaDemoPE-Regular", size: 16  * sizeScreen()))
                        .foregroundColor(Color("fontDark"))
                        .multilineTextAlignment(.center)
                }
                Spacer()
                NavigationLink(destination: NameView().navigationBarBackButtonHidden()) {
                    ButtonView(name: "Continue")
                }
            }
        }
}
}


#Preview {
    Welcome3View()
}
