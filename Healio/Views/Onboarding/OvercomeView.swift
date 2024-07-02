//
//  OvercomeView.swift
//  Healio
//
//  Created by Oleg Yakushin on 7/1/24.
//

import SwiftUI

struct OvercomeView: View {
    @State private var illness = ["Somewhat important", "Important", "Critical"]
    @State private var selectedIllness: String? = nil
    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                VStack(alignment: .leading) {
                    Text("How important is it")
                        .font(.custom("AveriaSerifLibre-Light", size: 34  * sizeScreen()))
                        .kerning(-1.2)
                        .foregroundColor(Color("fontDark"))
                        .multilineTextAlignment(.leading)
                        .padding(.horizontal, 20  * sizeScreen())
                    Text("for you to overcome")
                        .font(.custom("AveriaSerifLibre-Light", size: 34  * sizeScreen()))
                        .kerning(-1.2)
                        .foregroundColor(Color("fontDark"))
                        .multilineTextAlignment(.leading)
                        .padding(.horizontal, 20  * sizeScreen())
                    Text("your health issues?")
                        .font(.custom("AveriaSerifLibre-Light", size: 34  * sizeScreen()))
                        .kerning(-1.2)
                        .foregroundColor(Color("fontDark"))
                        .multilineTextAlignment(.leading)
                        .padding(.horizontal, 20  * sizeScreen())
                }
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 20 * sizeScreen()) {
                        ForEach(illness, id: \.self) { disease in
                            EachDiseasesView(
                                name: disease,
                                isHighlighted: selectedIllness == disease
                            )
                            .onTapGesture {
                                withAnimation {
                                    selectedIllness = disease
                                }
                            }
                        }
                    }
                }
                NavigationLink(destination: ThisIsView().navigationBarBackButtonHidden()) {
                    ButtonView(name: "Continue")
                }
            }
        }
    }
}


#Preview {
    OvercomeView()
}
