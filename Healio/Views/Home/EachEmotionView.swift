//
//  EachEmotionView.swift
//  Healio
//
//  Created by Oleg Yakushin on 6/27/24.
//

import SwiftUI

struct EachEmotionView: View {
    var name: String
    @State private var isLiked = false
    var body: some View {
        RoundedRectangle(cornerRadius: 20 * sizeScreen())
            .stroke(Color("yellowButton"), lineWidth: 2  * sizeScreen())
        .frame(width: 296 * sizeScreen(), height: 240 * sizeScreen())
        .background(Color.white.cornerRadius(20 * sizeScreen()))
        .overlay(
            ZStack {
                VStack {
                    Image(name)
                        .resizable()
                        .frame(width: 288 * sizeScreen(), height: 154 * sizeScreen())
                    Spacer()
                }
                VStack {
                    HStack {
                        Spacer()
                        Image(isLiked ? "likeSelImage" : "likeImage")
                            .onTapGesture {
                                withAnimation {
                                    isLiked.toggle()
                                }
                            }
                    }
                    Spacer()
                }
                .padding(10  * sizeScreen())
                VStack {
                    Spacer()
                    HStack{
                        Text(name)
                            .foregroundColor(.black)
                            .font(.custom("AveriaSerifLibre-Light", size: 32  * sizeScreen()))
                            .kerning(-1.2)
                        Spacer()
                    }
                }
                .padding(20  * sizeScreen())
            }
                .padding(1)
        )
    }
}

#Preview {
    EachEmotionView(name: "Happiness")
}
