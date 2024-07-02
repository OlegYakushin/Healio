//
//  EachOvercomeEmotionView.swift
//  Healio
//
//  Created by Oleg Yakushin on 6/28/24.
//

import SwiftUI

struct EachOvercomeEmotionView: View {
    var name: String
    @State private var isLiked = false
    var body: some View {
        RoundedRectangle(cornerRadius: 20 * sizeScreen())
            .stroke(Color("yellowButton"), lineWidth: 2  * sizeScreen())
        .frame(width: 296 * sizeScreen(), height: 274 * sizeScreen())
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
                VStack(spacing: 10  * sizeScreen()) {
                    Spacer()
                    HStack{
                        Text(name)
                            .foregroundColor(.black)
                            .font(.custom("AveriaSerifLibre-Light", size: 32  * sizeScreen()))
                            .kerning(-1.2)
                        
                        Spacer()
                    }
                    HStack{
                        Text("Can contribute to: hypertension, digestive issues, and liver problems.")
                            .foregroundColor(Color("fontDark"))
                            .font(.custom("AvertaDemoPE-Regular", size: 16  * sizeScreen()))
                            .kerning(-1.2)
                        
                        Spacer()
                    }
                }
                .padding(.horizontal, 20  * sizeScreen())
                .padding(.vertical, 15  * sizeScreen())
            }
                .padding(1)
        )
        .overlay(
            VStack {
                HStack {
                    Image("lockImage")
                    Spacer()
                }
                .padding(.leading, 20 * sizeScreen())
                Spacer()
            }
                .padding(.top, -4 * sizeScreen())
        )
    }
}

#Preview {
    EachOvercomeEmotionView(name: "Grief and sadness")
}
