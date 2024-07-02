//
//  IllnessView.swift
//  Healio
//
//  Created by Oleg Yakushin on 6/25/24.
//

import SwiftUI

struct IllnessView: View {
    @State private var illness = ["Hypertension", "Heart Disease", "Diabetes", "Obesity", "Arthritis", "Anxiety", "Depression", "Asthma", "Cancer", "Chronic Pain", "Stroke", "Alzheimer", "Chronic Kidney Disease", "Influenza and Pneumonia", "Liver Disease", "Osteoporosis", "Chronic Fatigue Syndrome", "HIV/AIDS", "Autoimmune Disease", "AlcoholISM and Drug Abuse"]
    
    @State private var selectedIllnesses = Set<String>()
    
    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                VStack(alignment: .leading) {
                    Text("What is one illness")
                        .font(.custom("AveriaSerifLibre-Light", size: 34  * sizeScreen()))
                        .kerning(-1.2)
                        .foregroundColor(Color("fontDark"))
                        .padding(.horizontal, 20  * sizeScreen())
                    Text("you wish to")
                        .font(.custom("AveriaSerifLibre-Light", size: 34  * sizeScreen()))
                        .kerning(-1.2)
                        .foregroundColor(Color("fontDark"))
                        .padding(.horizontal, 20  * sizeScreen())
                    Text("overcome?")
                        .font(.custom("AveriaSerifLibre-Light", size: 34  * sizeScreen()))
                        .kerning(-1.2)
                        .foregroundColor(Color("fontDark"))
                        .padding(.horizontal, 20  * sizeScreen())
                    Text("You can select more than 1 option.")
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
                                
                                isHighlighted: selectedIllnesses.contains(disease)
                            )
                            .onTapGesture {
                                if selectedIllnesses.contains(disease) {
                                   
                                        selectedIllnesses.remove(disease)
                                    
                                } else {
                                        selectedIllnesses.insert(disease)

                                }
                            }
                        }
                    }
                }
                .padding(.top, 10 * sizeScreen())
                NavigationLink(destination: EmotionalView().navigationBarBackButtonHidden()) {
                    ButtonView(name: "Continue")
                }
            }
        }
    }
}

#Preview {
    IllnessView()
}
