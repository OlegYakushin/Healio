//
//  SwitchView.swift
//  Healio
//
//  Created by Oleg Yakushin on 7/24/24.
//

import SwiftUI

struct SwitchView: View {
    @State private var isOn = false
    var body: some View {
        VStack {
                   Toggle(isOn: $isOn) {
                   }
                   .toggleStyle(CustomToggleStyle())
                   .padding()
               }
    }
}

#Preview {
    SwitchView()
}


struct CustomToggleStyle: ToggleStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .fill(configuration.isOn ? Color("yellowButton") : Color.gray)
                    .frame(width: 51, height: 31)
                
                Circle()
                    .fill(Color.white)
                    .frame(width: 27, height: 27)
                    .offset(x: configuration.isOn ? 9 : -9)
                    .shadow(radius: 4)
                    .animation(Animation.easeInOut(duration: 0.2))
            }
            .onTapGesture {
                configuration.isOn.toggle()
            }
        }
    }
}
