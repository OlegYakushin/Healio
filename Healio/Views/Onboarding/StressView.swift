//
//  StressView.swift
//  Healio
//
//  Created by Oleg Yakushin on 6/26/24.
//

import SwiftUI

struct StressView: View {
    @State private var illness = ["Yes", "No", "I am not sure"]
    @State private var selectedIllness: String? = nil
    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                VStack(alignment: .leading) {
                    Text("Have you been")
                        .font(.custom("AveriaSerifLibre-Light", size: 34  * sizeScreen()))
                        .kerning(-1.2)
                        .foregroundColor(Color("fontDark"))
                        .multilineTextAlignment(.leading)
                        .padding(.horizontal, 20  * sizeScreen())
                    Text("experiencing feelings")
                        .font(.custom("AveriaSerifLibre-Light", size: 34  * sizeScreen()))
                        .kerning(-1.2)
                        .foregroundColor(Color("fontDark"))
                        .multilineTextAlignment(.leading)
                        .padding(.horizontal, 20  * sizeScreen())
                    Text("of failure, invalidity")
                        .font(.custom("AveriaSerifLibre-Light", size: 34  * sizeScreen()))
                        .kerning(-1.2)
                        .foregroundColor(Color("fontDark"))
                        .multilineTextAlignment(.leading)
                        .padding(.horizontal, 20  * sizeScreen())
                    Text("or unworthiness?")
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
                NavigationLink(destination: HowEmotionalView().navigationBarBackButtonHidden()) {
                    ButtonView(name: "Continue")
                }
            }
        }
    }
}
#Preview {
    StressView()
}
