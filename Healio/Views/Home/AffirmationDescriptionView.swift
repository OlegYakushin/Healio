//
//  AffirmationDescriptionView.swift
//  Healio
//
//  Created by Oleg Yakushin on 7/15/24.
//

import SwiftUI

struct AffirmationDescriptionView: View {
    var description: [String]
    var text: String
   @Binding var isLiked: Bool
    var body: some View {
        ZStack {
       Color("backgroundColor")
            .ignoresSafeArea()
            VStack {
                HStack {
                    Text("Colds (Upper-respiratory Illness)")
                        .font(.custom("AveriaSerifLibre-Light", size: 26 * sizeScreen()))
                        .multilineTextAlignment(.leading)
                    Spacer()
                    Image(isLiked ? "likeSelImage" : "likeImage")
                        .onTapGesture {
                            withAnimation {
                                isLiked.toggle()
                            }
                        }
                }
                .frame(width: 327 * sizeScreen())
                Text("Thought patterns and feelings that can cause this disease: \(text)")
                    .font(.custom("AvertaDemoPE-Regular", size: 18 * sizeScreen()))
               Spacer()
                        }
            .padding(.top, 20 * sizeScreen())
            
        }
    }
}

#Preview {
    AffirmationDescriptionView(description: [
        "Too much going on at once",
        "Mental confusion, disorder",
        "Small hurts",
        "The belief that you always get a cold"
    ], text: ")", isLiked: .constant(false))
}
