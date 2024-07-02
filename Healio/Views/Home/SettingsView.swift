//
//  SettingsView.swift
//  Healio
//
//  Created by Oleg Yakushin on 6/27/24.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        ZStack {
            BackgroundView()
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 20  * sizeScreen()) {
                    Text("Settings")
                        .font(.custom("AveriaSerifLibre-Light", size: 40  * sizeScreen()))
                        .foregroundColor(.black)
                        .padding(.bottom, 40 * sizeScreen())
                    Text("Personal")
                        .font(.custom("Averta-Semibold", size: 18  * sizeScreen()))
                        .kerning(-1.2)
                        .foregroundColor(Color("fontDark"))
                    EachSettingView(image: "remindersImage", text: "Reminders")
                    Text("Support us")
                        .font(.custom("Averta-Semibold", size: 18  * sizeScreen()))
                        .kerning(-1.2)
                        .foregroundColor(Color("fontDark"))
                    EachSettingView(image: "shareImage", text: "Share Healio")
                    EachSettingView(image: "rateImage", text: "Rate Healio on the App Store")
                    EachSettingView(image: "suggestImage", text: "Suggest an improvement")
                    EachSettingView(image: "reportImage", text: "Report a bug")
                }
            }
        }
    }
}

#Preview {
    SettingsView()
}
