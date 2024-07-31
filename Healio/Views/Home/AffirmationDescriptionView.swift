//
//  AffirmationDescriptionView.swift
//  Healio
//
//  Created by Oleg Yakushin on 7/15/24.
//

import SwiftUI

struct AffirmationDescriptionView: View {
    var description: [String]
   @Binding var isLiked: Bool
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
                VStack(alignment: .leading, spacing: 10 * sizeScreen()) {
                                ForEach(description, id: \.self) { item in
                                    HStack {
                                        Image("pointImage")
                                            .resizable()
                                            .frame(width: 20 * sizeScreen(), height: 20 * sizeScreen())
                                        Text(item)
                                            .font(.custom("Avenir-Roman", size: 17 * sizeScreen()))
                                            .foregroundColor(Color("fontDark"))
                                            .multilineTextAlignment(.leading)
                                            .padding(.horizontal, 20 * sizeScreen())
                                    }
                                    .frame(width: 311 * sizeScreen(), alignment: .leading)
                                }
                            }
                            .padding()
                        }
            
        }
    }
}

#Preview {
    AffirmationDescriptionView(description: [
        "Too much going on at once",
        "Mental confusion, disorder",
        "Small hurts",
        "The belief that you always get a cold"
    ], isLiked: .constant(false))
}
