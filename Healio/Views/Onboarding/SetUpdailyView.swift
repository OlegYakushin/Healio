//
//  SetUpdailyView.swift
//  Healio
//
//  Created by Oleg Yakushin on 7/1/24.
//

import SwiftUI

struct SetUpdailyView: View {
    @State private var isOne = true
    @State private var isTwo = true
    var body: some View {
    ZStack {
        BackgroundView()
        VStack {
            VStack(alignment: .leading) {
                Text("Set up your daily\nreminders.")
                    .font(.custom("AveriaSerifLibre-Light", size: 34  * sizeScreen()))
                    .kerning(-1.2)
                    .foregroundColor(Color("fontDark"))
                    .multilineTextAlignment(.leading)
                .padding(.bottom, 20  * sizeScreen())
                Text("Consistent practice helps embed the affirmations into your subconscious mind.")
                    .font(.custom("AvertaDemoPE-Regular", size: 16  * sizeScreen()))
                    .foregroundColor(Color("fontDark"))
                    .multilineTextAlignment(.leading)
            }
            .padding(.horizontal, 20  * sizeScreen())
            Image("notifImage")
                .resizable()
                .frame(width: 375 * sizeScreen(), height: 160 * sizeScreen())
                .padding(.top, 20 * sizeScreen())
            RoundedRectangle(cornerRadius: 24 * sizeScreen())
                .stroke(Color.white, lineWidth: 2  * sizeScreen())
                .frame(width: 327 * sizeScreen(), height: 74 * sizeScreen())
                .background(Color.white.opacity(0.4).cornerRadius(24 * sizeScreen()))
                .overlay(
                    HStack {
                        RoundedRectangle(cornerRadius: 12)
                            .foregroundColor(Color("lightOne"))
                            .frame(width: 83 * sizeScreen(), height: 50 * sizeScreen())
                            .overlay(
                        Text("08:00")
                            .font(.custom("Avenir-Heavy", size: 16  * sizeScreen()))
                            .foregroundColor(Color("fontDark"))
                        )
                        Spacer()
                        Image(isOne ? "onImage" : "offImage")
                            .onTapGesture {
                                withAnimation {
                                    isOne.toggle()
                                }
                            }
                    }
                        .padding(.horizontal, 20 * sizeScreen())
                )
            RoundedRectangle(cornerRadius: 24 * sizeScreen())
                .stroke(Color.white, lineWidth: 2  * sizeScreen())
                .frame(width: 327 * sizeScreen(), height: 74 * sizeScreen())
                .background(Color.white.opacity(0.4).cornerRadius(24 * sizeScreen()))
                .overlay(
                    HStack {
                        RoundedRectangle(cornerRadius: 12)
                            .foregroundColor(Color("lightOne"))
                            .frame(width: 83 * sizeScreen(), height: 50 * sizeScreen())
                            .overlay(
                        Text("22:00")
                            .font(.custom("Avenir-Heavy", size: 16  * sizeScreen()))
                            .foregroundColor(Color("fontDark"))
                        )
                        Spacer()
                        Image(isTwo ? "onImage" : "offImage")
                            .onTapGesture {
                                withAnimation {
                                    isTwo.toggle()
                                }
                            }
                    }
                        .padding(.horizontal, 20 * sizeScreen())
                )
                .padding(.top, 20 * sizeScreen())
            Spacer()
            VStack(spacing: 0) {
                NavigationLink(destination: PerosonaView().navigationBarBackButtonHidden()) {
                    ButtonView(name: "Continue")
                }
                NavigationLink(destination: PerosonaView().navigationBarBackButtonHidden()) {
                    Text("Not now")
                        .foregroundColor(Color("fontDark"))
                        .font(.custom("Averta-Bold", size: 16  * sizeScreen()))
                        .frame(height: 62 * sizeScreen())
                }
            }
        }
    }
}
}
#Preview {
    SetUpdailyView()
}
