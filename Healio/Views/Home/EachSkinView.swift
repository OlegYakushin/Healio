//
//  EachSkinView.swift
//  Healio
//
//  Created by Oleg Yakushin on 6/28/24.
//

import SwiftUI

struct EachSkinView: View {
    var name: String
    @State private var isLiked = false
    var body: some View {
        
        RoundedRectangle(cornerRadius: 20 * sizeScreen())
            .stroke(LinearGradient(gradient: Gradient(colors: [Color("yellowOne"), Color("yellowOne").opacity(0)]),
                                   startPoint: .topLeading,
                                   endPoint: .bottomTrailing),
                    lineWidth: 2 * sizeScreen())
        .frame(width: 260 * sizeScreen(), height: 141 * sizeScreen())
        .background(Color.white.cornerRadius(20 * sizeScreen()))
        .overlay(
            ZStack {
                VStack {
                    Spacer()
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
                .padding(.vertical, 30  * sizeScreen())
                .padding(.horizontal, 15  * sizeScreen())
                VStack(spacing: 5) {
              
                    HStack{
                        Text("Colds (Upper-respiratory Illness)")
                            .foregroundColor(.black)
                            .font(.custom("AveriaSerifLibre-Light", size: 26  * sizeScreen()))
                            .kerning(-1.2)
                            .multilineTextAlignment(.leading)
                        
                        Spacer()
                    }
                    .frame(width: 226 * sizeScreen(), height: 58 * sizeScreen())
                    HStack{
                        Text("Not accepting the self. Despise of the self.")
                            .foregroundColor(Color("fontDark"))
                            .font(.custom("AvertaDemoPE-Regular", size: 16  * sizeScreen()))
                        Spacer()
                    }
                    .frame(width: 226 * sizeScreen(), height: 58 * sizeScreen())
                }
                .padding(25  * sizeScreen())
            }
        )
        .overlay(
            VStack {
                HStack {
                    Spacer()
                    Image("lockImage")
                }
                .padding(.trailing, 15 * sizeScreen())
                Spacer()
            }
                .padding(.top, -4 * sizeScreen())
        )
    }
}

#Preview {
    EachSkinView(name: "")
}
