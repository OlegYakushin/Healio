//
//  LikedView.swift
//  Healio
//
//  Created by Oleg Yakushin on 6/27/24.
//

import SwiftUI

struct LikedView: View {
    @State private var selected = "Health issues"
    var body: some View {
        ZStack {
            BackgroundView()
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 20  * sizeScreen()) {
                    Text("Liked")
                        .font(.custom("AveriaSerifLibre-Light", size: 40  * sizeScreen()))
                        .foregroundColor(.black)
                        .padding(.bottom, 40 * sizeScreen())
                        .padding(.horizontal, 25 * sizeScreen())
                    HStack(spacing: 0) {
                        RoundedRectangle(cornerRadius: 22 * sizeScreen())
                            .frame(width: 124 * sizeScreen(), height: 39 * sizeScreen())
                            .foregroundColor(selected == "Health issues" ? .white : .clear)
                            .overlay(
                                Text("Health issues")
                                    .font(.custom("Averta-Semibold", size: 16  * sizeScreen()))
                                    .kerning(-1.2)
                                    .foregroundColor(Color("fontDark"))
                            )
                            .onTapGesture {
                                selected = "Health issues"
                            }
                        RoundedRectangle(cornerRadius: 22 * sizeScreen())
                            .frame(width: 124 * sizeScreen(), height: 39 * sizeScreen())
                            .foregroundColor(selected == "Emotions" ? .white : .clear)
                            .overlay(
                        Text("Emotions")
                            .font(.custom("Averta-Semibold", size: 16  * sizeScreen()))
                            .kerning(-1.2)
                            .foregroundColor(Color("fontDark"))
                        )
                            .onTapGesture {
                                selected = "Emotions"
                            }
                        RoundedRectangle(cornerRadius: 22 * sizeScreen())
                            .frame(width: 124 * sizeScreen(), height: 39 * sizeScreen())
                            .foregroundColor(selected == "Affirmations" ? .white : .clear)
                            .overlay(
                        Text("Affirmations")
                            .font(.custom("Averta-Semibold", size: 16  * sizeScreen()))
                            .kerning(-1.2)
                            .foregroundColor(Color("fontDark"))
                        )
                            .onTapGesture {
                                selected = "Affirmations"
                            }
                    }
                    .padding(.horizontal, 5 * sizeScreen())
                        VStack {
                            EachLikedView(name: "Lower back")
                            EachLikedView(name: "Lower back")
                            EachLikedView(name: "Lower back")
                            EachLikedView(name: "Lower back")
                            EachLikedView(name: "Lower back")
                            EachLikedView(name: "Lower back")
                        }
                    .padding(.horizontal, 25 * sizeScreen())
                }
            }
        }
    }
}

#Preview {
    LikedView()
}
