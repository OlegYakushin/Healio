//
//  EachLikedView.swift
//  Healio
//
//  Created by Oleg Yakushin on 6/30/24.
//

import SwiftUI

struct EachLikedView: View {
    var name: String
    @State private var isLiked = false
    var body: some View {
        RoundedRectangle(cornerRadius: 20 * sizeScreen())
            .stroke(Color("yellowButton"), lineWidth: 2  * sizeScreen())
        .frame(width: 343 * sizeScreen(), height: 94 * sizeScreen())
        .background(Color.white.cornerRadius(20 * sizeScreen()))
        .overlay(
            ZStack {
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
                    HStack{
                        Text(name)
                            .foregroundColor(.black)
                            .font(.custom("AveriaSerifLibre-Light", size: 22  * sizeScreen()))
                            .kerning(-1.2)
                        Spacer()
                    }
                    HStack {
                    Text("Not accepting the self. Despise of\nthe self.")
                        .foregroundColor(.black)
                        .font(.custom("AvertaDemoPE-Regular", size: 16  * sizeScreen()))
                        .kerning(-1.2)
                    Spacer()
                }
                }
                .padding(.horizontal, 20  * sizeScreen())
            }
                .padding(1)
        )
    }
}
#Preview {
    EachLikedView(name: "Lower back")
}
