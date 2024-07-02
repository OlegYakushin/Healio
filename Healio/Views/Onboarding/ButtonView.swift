//
//  ButtonView.swift
//  Healio
//
//  Created by Oleg Yakushin on 6/25/24.
//

import SwiftUI

struct ButtonView: View {
    var name:String
    var body: some View {
        RoundedRectangle(cornerRadius: 40  * sizeScreen())
            .stroke(Color("yellowButton"), lineWidth: 2  * sizeScreen())
            .frame(width: 311  * sizeScreen(), height: 62  * sizeScreen())
            .background(Color("buttonBrown").cornerRadius(40  * sizeScreen()))
            .overlay(
            Text(name)
                .foregroundColor(.white)
                .font(.custom("Averta-Bold", size: 16  * sizeScreen()))
            )
            .shadow(color: Color.black.opacity(0.3),
                               radius: 10  * sizeScreen(),
                               x: 0, y: 5  * sizeScreen())
    }
}

#Preview {
    ButtonView(name: "start")
}
