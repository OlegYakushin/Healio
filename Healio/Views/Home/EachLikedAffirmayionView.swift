//
//  EachLikedAffirmayionView.swift
//  Healio
//
//  Created by Oleg Yakushin on 7/15/24.
//

import SwiftUI

struct EachLikedAffirmayionView: View {
    var text: String
    @State private var isLiked = false
    var body: some View {
        RoundedRectangle(cornerRadius: 20 * sizeScreen())
            .stroke(LinearGradient(gradient: Gradient(colors: [Color("yellowOne"), Color("yellowOne").opacity(0)]),
                                   startPoint: .topLeading,
                                   endPoint: .bottomTrailing),
                    lineWidth: 2 * sizeScreen())
        .frame(width: 343 * sizeScreen(), height: 70 * sizeScreen())
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
                        HStack{
                            Text(text)
                                .foregroundColor(Color("fontDark"))
                                .font(.custom("AvertaDemoPE-Regular", size: 16  * sizeScreen()))
                                .kerning(-1.0 * sizeScreen())
                            Spacer()
                        
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
    EachLikedAffirmayionView(text: "I allow my mind to be at peace.")
}
