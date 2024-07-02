//
//  EachDiseasesView.swift
//  Healio
//
//  Created by Oleg Yakushin on 6/25/24.
//

import SwiftUI

struct EachDiseasesView: View {
    var name: String
    var isHighlighted: Bool = false
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20  * sizeScreen())
            .stroke(isHighlighted ? Color("yellowButton") : Color.white, lineWidth: 2  * sizeScreen())
            .frame(width: 311  * sizeScreen(), height: 62  * sizeScreen())
            .background(isHighlighted ? Color.white.opacity(1.0).cornerRadius(20  * sizeScreen()) : Color.white.opacity(0.4).cornerRadius(20  * sizeScreen()))
            .overlay(
                HStack {
                    Text(name)
                        .font(.custom("Avenir-Heavy", size: 16  * sizeScreen()))
                        .foregroundColor(Color("fontDark"))
                    Spacer()
                }
                .padding(25  * sizeScreen())
            )
    }
}

#Preview {
  ZStack {
        Color.blue
        EachDiseasesView(name: "Diabetes", isHighlighted: true)
        EachDiseasesView(name: "Diabetes", isHighlighted: false)
    }
}
