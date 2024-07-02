//
//  EmotionalView.swift
//  Healio
//
//  Created by Oleg Yakushin on 6/26/24.
//

import SwiftUI

struct EmotionalView: View {
    @State private var illness = ["Yes", "No", "I am not sure"]
    @State private var selectedIllness: String? = nil
    
    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                VStack(alignment: .leading) {
                    Text("Have you felt more")
                        .font(.custom("AveriaSerifLibre-Light", size: 34  * sizeScreen()))
                        .kerning(-1.2)
                        .foregroundColor(Color("fontDark"))
                        .padding(.horizontal, 20  * sizeScreen())
                    Text("emotional stress")
                        .font(.custom("AveriaSerifLibre-Light", size: 34  * sizeScreen()))
                        .kerning(-1.2)
                        .foregroundColor(Color("fontDark"))
                        .padding(.horizontal, 20  * sizeScreen())
                    Text("lately?")
                        .font(.custom("AveriaSerifLibre-Light", size: 34  * sizeScreen()))
                        .kerning(-1.2)
                        .foregroundColor(Color("fontDark"))
                        .padding(.horizontal, 20  * sizeScreen())
                    Text("E.g. conflicts with family or financial/job insecurity.")
                        .font(.custom("AvertaDemoPE-Regular", size: 16  * sizeScreen()))
                        .foregroundColor(Color("fontDark"))
                        .padding(.horizontal, 20  * sizeScreen())
                        .padding(.vertical, 5  * sizeScreen())
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
                NavigationLink(destination: SituationsView().navigationBarBackButtonHidden()) {
                    ButtonView(name: "Continue")
                }
            }
        }
    }
}

#Preview {
    EmotionalView()
}
