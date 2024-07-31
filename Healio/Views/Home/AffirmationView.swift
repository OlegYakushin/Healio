//
//  AffirmationView.swift
//  Healio
//
//  Created by Oleg Yakushin on 7/15/24.
//
import SwiftUI

struct Affirmation: Identifiable {
    let id = UUID()
    let text: String
    let description: [String]  
    var isLiked: Bool = false
}

struct AffirmationView: View {
    @State private var isPresented = false
    @State private var currentIndex = 0
    @Environment(\.presentationMode) var presentationMode
    
    var name = "Colds (Upper-respiratory Illness)"
    
    @State private var affirmations = [
        Affirmation(text: "I allow my mind to be at peace.", description: [
            "Too much going on at once",
            "Mental confusion, disorder",
            "Small hurts",
            "The belief that you always get a cold"
        ]),
        Affirmation(text: "I am worthy of love and respect.", description: [
            "Feeling unworthy",
            "Lack of self-acceptance",
            "Difficulty in receiving praise",
            "Overemphasis on others' opinions"
        ]),
        Affirmation(text: "I am in control of my thoughts and feelings.", description: [
            "Feeling overwhelmed by emotions",
            "Struggling with negative thoughts",
            "Lack of mental clarity",
            "Difficulty managing stress"
        ]),
        Affirmation(text: "Every day, I become more at ease with myself.", description: [
            "Self-doubt",
            "Imposter syndrome",
            "Struggles with self-acceptance",
            "Fear of judgment"
        ]),
        Affirmation(text: "I radiate positivity and confidence.", description: [
            "Fear of negative feedback",
            "Self-consciousness",
            "Difficulty in projecting confidence",
            "Negative self-talk"
        ])
    ]
    
    var body: some View {
        ZStack {
            Image("affirmationBackground")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            VStack(spacing: 0) {
                HStack {
                    Image("backButton")
                        .resizable()
                        .frame(width: 20 * sizeScreen(), height: 20 * sizeScreen())
                        .onTapGesture {
                            presentationMode.wrappedValue.dismiss()
                        }
                    Spacer()
                    Text(name)
                        .foregroundColor(Color("fontDark"))
                        .font(.custom("Averta-Semibold", size: 16 * sizeScreen()))
                    Spacer()
                }
                .padding(.top, 60 * sizeScreen())
                .padding(.horizontal, 15 * sizeScreen())
                TabView(selection: $currentIndex) {
                    ForEach(affirmations.indices, id: \.self) { index in
                        VStack(spacing: 48 * sizeScreen()) {
                            Text(affirmations[index].text)
                                .foregroundColor(Color("fontDark"))
                                .font(.custom("AveriaSerifLibre-Light", size: 40 * sizeScreen()))
                                .multilineTextAlignment(.center)
                            
                            HStack(spacing: 36 * sizeScreen()) {
                                Image("infoImage")
                                    .resizable()
                                    .frame(width: 28 * sizeScreen(), height: 28 * sizeScreen())
                                    .onTapGesture {
                                        isPresented.toggle()
                                    }
                                Image("sendImage")
                                    .resizable()
                                    .frame(width: 28 * sizeScreen(), height: 28 * sizeScreen())
                                Image(affirmations[index].isLiked ? "likesSelImage" : "likesImage")
                                    .resizable()
                                    .frame(width: 28 * sizeScreen(), height: 28 * sizeScreen())
                                    .onTapGesture {
                                        withAnimation {
                                            affirmations[index].isLiked.toggle()
                                        }
                                    }
                            }
                        }
                        .rotationEffect(.init(degrees: -90))
                        .tag(index)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .rotationEffect(.init(degrees: 90))
                .padding(.top, -60 * sizeScreen())
            }
        }
        .popover(isPresented: $isPresented, content: {
            if #available(iOS 16.0, *) {
                AffirmationDescriptionView(description: affirmations[currentIndex].description, isLiked: $affirmations[currentIndex].isLiked)
                    .presentationDetents([.fraction(3 / 5)])
            } else {
                AffirmationDescriptionView(description: affirmations[currentIndex].description, isLiked: $affirmations[currentIndex].isLiked)
            }
        })
    }
}
#Preview {
    AffirmationView()
}
