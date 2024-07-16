//
//  EachLikedEmotionalView.swift
//  Healio
//
//  Created by Oleg Yakushin on 7/4/24.
//

import SwiftUI

struct EachLikedEmotionalView: View {
    var name: String
    @State private var isLiked = false
    var body: some View {
        RoundedRectangle(cornerRadius: 20 * sizeScreen())
            .stroke(LinearGradient(gradient: Gradient(colors: [Color("yellowOne"), Color("yellowOne").opacity(0)]),
                                   startPoint: .topLeading,
                                   endPoint: .bottomTrailing),
                    lineWidth: 2 * sizeScreen())
        .frame(width: 343 * sizeScreen(), height: 104 * sizeScreen())
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
                  
                }
                .padding(10  * sizeScreen())
                HStack {
                    Image(name)
                        .resizable()
                        .frame(width: 72, height: 88)
                        .cornerRadius(10 * sizeScreen())
                    
                    VStack(spacing: 5 * sizeScreen()) {
                        HStack{
                            Text(name)
                                .foregroundColor(.black)
                                .font(.custom("AveriaSerifLibre-Light", size: 22  * sizeScreen()))
                                .kerning(-1.2)
                            Spacer()
                        }
                        HStack {
                            Text("Can contribute to: cancer,\narthritis.")
                                .foregroundColor(.black)
                                .font(.custom("AvertaDemoPE-Regular", size: 16  * sizeScreen()))
                                .kerning(-1.2)
                            Spacer()
                        }
                        
                    }
                    .padding(.horizontal, 5  * sizeScreen())
                }
                .padding(10  * sizeScreen())
            }
                .padding(1)
        )
    }
}

#Preview {
    EachLikedEmotionalView(name: "Resentment")
}
