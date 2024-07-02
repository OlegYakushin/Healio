//
//  GriefView.swift
//  Healio
//
//  Created by Oleg Yakushin on 6/26/24.
//

import SwiftUI

struct GriefView: View {
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
                    Text("dealing with grief or")
                        .font(.custom("AveriaSerifLibre-Light", size: 34  * sizeScreen()))
                        .kerning(-1.2)
                        .foregroundColor(Color("fontDark"))
                        .multilineTextAlignment(.leading)
                        .padding(.horizontal, 20  * sizeScreen())
                    Text("feeling down lately?")
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
                NavigationLink(destination: StressView().navigationBarBackButtonHidden()) {
                    ButtonView(name: "Continue")
                }
            }
        }
    }
}

#Preview {
    GriefView()
}
