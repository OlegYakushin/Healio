//
//  EachSettingView.swift
//  Healio
//
//  Created by Oleg Yakushin on 6/29/24.
//

import SwiftUI

struct EachSettingView: View {
    var image: String
    var text: String
    var body: some View {
        RoundedRectangle(cornerRadius: 14 * sizeScreen())
            .foregroundColor(.white)
            .frame(width: 327 * sizeScreen(), height: 57 * sizeScreen())
            .overlay(
                HStack {
                    Image(image)
                        .resizable()
                        .frame(width: 28 * sizeScreen(), height: 28 * sizeScreen())
                    Text(text)
                        .font(.custom("Averta-Semibold", size: 16  * sizeScreen()))
                        .kerning(-1.2)
                        .foregroundColor(Color("fontDark"))
                    Spacer()
                }
                    .padding(25 * sizeScreen())
            )
    }
}

#Preview {
    EachSettingView(image: "rateImage", text: "Rate Healio on the App Store")
}
