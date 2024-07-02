//
//  FailureView.swift
//  Healio
//
//  Created by Oleg Yakushin on 6/26/24.
//

import SwiftUI

struct FailureView: View {
    @State private var illness = ["Yes", "No", "I am not sure"]
    @State private var selectedIllness: String? = nil
    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                Text("What is one illness you wish to overcome?")
                    .font(.custom("AveriaSerifLibre-Light", size: 34  * sizeScreen()))
                    .kerning(-1.2  * sizeScreen())
                    .foregroundColor(Color("fontDark"))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20  * sizeScreen())
                
                Text("You can select more than 1 option.")
                    .font(.custom("AveriaSerifLibre-Light", size: 16  * sizeScreen()))
                    .foregroundColor(Color("fontDark"))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20  * sizeScreen())
                
                ScrollView(showsIndicators: false) {
                    VStack {
                        ForEach(illness, id: \.self) { disease in
                            EachDiseasesView(
                                name: disease,
                                isHighlighted: selectedIllness == disease
                            )
                            .onTapGesture {
                                selectedIllness = disease
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
    FailureView()
}
