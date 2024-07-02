//
//  SituationsView.swift
//  Healio
//
//  Created by Oleg Yakushin on 6/26/24.
//

import SwiftUI

struct SituationsView: View {
    @State private var illness = ["Yes", "No", "I am not sure"]
    @State private var selectedIllness: String? = nil
    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                VStack(alignment: .leading) {
                    Text("Have you faced any challenging or upsetting situations lately?")
                        .font(.custom("AveriaSerifLibre-Light", size: 34  * sizeScreen()))
                        .kerning(-1.2  * sizeScreen())
                        .foregroundColor(Color("fontDark"))
                        .padding(.horizontal, 20  * sizeScreen())
                    VStack(alignment: .leading, spacing: 3 * sizeScreen()) {
                        Text("E.g. separation, divorce, children moving")
                            .font(.custom("AvertaDemoPE-Regular", size: 16  * sizeScreen()))
                            .foregroundColor(Color("fontDark"))
                            .padding(.horizontal, 20  * sizeScreen())
                        Text("away, losing a close relative or friend, job")
                            .font(.custom("AvertaDemoPE-Regular", size: 16  * sizeScreen()))
                            .foregroundColor(Color("fontDark"))
                            .padding(.horizontal, 20  * sizeScreen())
                        Text("loss, or moving?")
                            .font(.custom("AvertaDemoPE-Regular", size: 16  * sizeScreen()))
                            .foregroundColor(Color("fontDark"))
                            .padding(.horizontal, 20  * sizeScreen())
                    }
                    .padding(.vertical, 5 * sizeScreen())
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
                .padding(.top, 5 * sizeScreen())
                NavigationLink(destination: GriefView().navigationBarBackButtonHidden()) {
                    ButtonView(name: "Continue")
                }
            }
        }
    }
}

#Preview {
    SituationsView()
}
