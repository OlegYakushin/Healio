//
//  AffirmationDescriptionView.swift
//  Healio
//
//  Created by Oleg Yakushin on 7/15/24.
//

import SwiftUI

struct AffirmationDescriptionView: View {
    @State private var isLiked = false
    var body: some View {
        ZStack {
       Color("backgroundColor")
            .ignoresSafeArea()
            VStack {
                HStack {
                    Text("Colds (Upper-respiratory Illness)")
                    Image(isLiked ? "likeSelImage" : "likeImage")
                        .onTapGesture {
                            withAnimation {
                                isLiked.toggle()
                            }
                        }
                }
                Text("Thought patterns and feelings that can cause this disease:")
                HStack {
                    Image("pointImage")
                        .resizable()
                        .frame(width: 20 * sizeScreen(),
                               height: 20 * sizeScreen())
                    Text("Too much going on at once")
                        .font(.custom("Avenir-Roman", size: 17  * sizeScreen()))
                        .foregroundColor(Color("fontDark"))
                        .multilineTextAlignment(.leading)
                        .padding(.horizontal, 20  * sizeScreen())
                }
                .frame(width: 311 * sizeScreen(), alignment: .leading)
                HStack {
                    Image("pointImage")
                        .resizable()
                        .frame(width: 20 * sizeScreen(),
                               height: 20 * sizeScreen())
                    Text("Mental confusion, disorder")
                        .font(.custom("Avenir-Roman", size: 17  * sizeScreen()))
                        .foregroundColor(Color("fontDark"))
                        .multilineTextAlignment(.leading)
                        .padding(.horizontal, 20  * sizeScreen())
                }
                .frame(width: 311 * sizeScreen(), alignment: .leading)
                HStack {
                    Image("pointImage")
                        .resizable()
                        .frame(width: 20 * sizeScreen(),
                               height: 20 * sizeScreen())
                    Text("Small hurts")
                        .font(.custom("Avenir-Roman", size: 17  * sizeScreen()))
                        .foregroundColor(Color("fontDark"))
                        .multilineTextAlignment(.leading)
                        .padding(.horizontal, 20  * sizeScreen())
                }
                .frame(width: 311 * sizeScreen(), alignment: .leading)
                HStack {
                    Image("pointImage")
                        .resizable()
                        .frame(width: 20 * sizeScreen(),
                               height: 20 * sizeScreen())
                    Text("The believe that you always get a cold")
                        .font(.custom("Avenir-Roman", size: 17  * sizeScreen()))
                        .foregroundColor(Color("fontDark"))
                        .multilineTextAlignment(.leading)
                        .padding(.horizontal, 20  * sizeScreen())
                }
                .frame(width: 311 * sizeScreen(), alignment: .leading)
            }
        }
    }
}

#Preview {
    AffirmationDescriptionView()
}
