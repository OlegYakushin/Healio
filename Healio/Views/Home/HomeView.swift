//
//  HomeView.swift
//  Healio
//
//  Created by Oleg Yakushin on 6/27/24.
//

import SwiftUI

struct HomeView: View {
    @State private var emotions = ["Happiness", "Inner peace", "Gratitude", "Be present", "Excitement", "Think positive", "Confidence", "Self love", "Body positivity"]
    @State private var overcomeEmotions = ["Anger", "Fear", "Grief and sadness", "Guilt and shame", "Resentment", "Loneliness", "Stress", "Self love", "Body positivity"]
    var body: some View {
        ZStack {
            BackgroundView()
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 20  * sizeScreen()) {
                    Text("Explore")
                        .font(.custom("AveriaSerifLibre-Light", size: 40  * sizeScreen()))
                        .foregroundColor(.black)
                        .padding(.bottom, 40 * sizeScreen())
                        .padding(.leading, 25 * sizeScreen())
                    Text("Cultivate positive emotions")
                        .font(.custom("Averta-Semibold", size: 18  * sizeScreen()))
                        .foregroundColor(Color("fontDark"))
                        .padding(.leading, 25 * sizeScreen())
                  
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16 * sizeScreen()) {
                            ForEach(emotions, id: \.self) { emotion in
                                EachEmotionView(name: emotion)
                            }
                            
                        }
                        .padding(.vertical, 1)
                        .padding(.leading, 25 * sizeScreen())
                    }
                    Text("Skin")
                        .font(.custom("Averta-Semibold", size: 18  * sizeScreen()))
                        .foregroundColor(Color("fontDark"))
                        .padding(.leading, 25 * sizeScreen())
                 
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16 * sizeScreen()) {
                            EachSkinView(name: "")
                            EachSkinView(name: "")
                            EachSkinView(name: "")
                            EachSkinView(name: "")
                        }
                        .padding(.vertical, 5)
                        .padding(.leading, 25 * sizeScreen())
                    }
                    Text("Female problems")
                        .font(.custom("Averta-Semibold", size: 18  * sizeScreen()))
                        .foregroundColor(Color("fontDark"))
                        .padding(.leading, 25 * sizeScreen())
                        
                 
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16 * sizeScreen()) {
                            EachSkinView(name: "")
                            EachSkinView(name: "")
                            EachSkinView(name: "")
                            EachSkinView(name: "")
                        }
                        .padding(.vertical, 5)
                        .padding(.leading, 25 * sizeScreen())
                    }
                   Image("shareFeedback")
                        .resizable()
                        .frame(width: 327 * sizeScreen(), height: 128 * sizeScreen())
                    .padding(.leading, 25 * sizeScreen())
                    Text("Overcome repressed emotions")
                        .font(.custom("Averta-Semibold", size: 18  * sizeScreen()))
                        .foregroundColor(Color("fontDark"))
                        .padding(.leading, 25 * sizeScreen())
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(overcomeEmotions, id: \.self) { emotion in
                                EachOvercomeEmotionView(name: emotion)
                            }
                        }
                        .padding(.vertical, 5)
                        .padding(.leading, 25 * sizeScreen())
                    }
                    Text("Upper torso")
                        .font(.custom("Averta-Semibold", size: 18  * sizeScreen()))
                        .foregroundColor(Color("fontDark"))
                        .padding(.leading, 25 * sizeScreen())
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16 * sizeScreen()) {
                            EachSkinView(name: "")
                            EachSkinView(name: "")
                            EachSkinView(name: "")
                            EachSkinView(name: "")
                        }
                        .padding(.vertical, 5)
                        .padding(.leading, 25 * sizeScreen())
                    }
                    Text("Upper torso")
                        .font(.custom("Averta-Semibold", size: 18  * sizeScreen()))
                        .foregroundColor(Color("fontDark"))
                        .padding(.leading, 25 * sizeScreen())
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16 * sizeScreen()) {
                            EachSkinView(name: "")
                            EachSkinView(name: "")
                            EachSkinView(name: "")
                            EachSkinView(name: "")
                        }
                        .padding(.vertical, 5)
                        .padding(.leading, 25 * sizeScreen())
                    }
                    
                    Image("tellMore")
                         .resizable()
                         .frame(width: 327 * sizeScreen(), height: 128 * sizeScreen())
                     .padding(.leading, 25 * sizeScreen())
                    
                    Text("Upper torso")
                        .font(.custom("Averta-Semibold", size: 18  * sizeScreen()))
                        .foregroundColor(Color("fontDark"))
                        .padding(.leading, 25 * sizeScreen())
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16 * sizeScreen()) {
                            EachSkinView(name: "")
                            EachSkinView(name: "")
                            EachSkinView(name: "")
                            EachSkinView(name: "")
                        }
                        .padding(.vertical, 5)
                        .padding(.leading, 25 * sizeScreen())
                    }
                }
        
            }
        }
    }
}

#Preview {
    HomeView()
}
