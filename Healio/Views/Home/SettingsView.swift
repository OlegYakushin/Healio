//
//  SettingsView.swift
//  Healio
//
//  Created by Oleg Yakushin on 6/27/24.
//

import SwiftUI
import StoreKit


struct SettingsView: View {
    init() {
        let appear = UINavigationBarAppearance()

        let atters: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: "AveriaSerifLibre-Light", size: 40)!
        ]
        let atters2: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: "AveriaSerifLibre-Light", size: 20)!
        ]
        appear.largeTitleTextAttributes = atters
        appear.titleTextAttributes = atters2
        UINavigationBar.appearance().standardAppearance = appear
      
     }
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundView()
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 20  * sizeScreen()) {
                        Text("Personal")
                            .font(.custom("Averta-Semibold", size: 18  * sizeScreen()))
                            .kerning(-1.2)
                            .foregroundColor(Color("fontDark"))
                        NavigationLink(destination:RemindersView().navigationBarBackButtonHidden()) {
                            EachSettingView(image: "remindersImage", text: "Reminders")
                        }
                        Text("Support us")
                            .font(.custom("Averta-Semibold", size: 18  * sizeScreen()))
                            .kerning(-1.2)
                            .foregroundColor(Color("fontDark"))
                        EachSettingView(image: "shareImage", text: "Share Healio")
                        EachSettingView(image: "rateImage", text: "Rate Healio on the App Store")
                            .onTapGesture {                // Action to trigger App Store rating
                                                  if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                                                      SKStoreReviewController.requestReview(in: scene)
                                                  }
                                              }
                        EachSettingView(image: "suggestImage", text: "Suggest an improvement")
                            .onTapGesture {
                               
                                        UIApplication.shared.open(URL(string: "mailto: example@gmail.com")!, options: [:], completionHandler: nil)
                                    
                            }
                        EachSettingView(image: "reportImage", text: "Report a bug")
                            .onTapGesture {
                               
                                        UIApplication.shared.open(URL(string: "mailto: example@gmail.com")!, options: [:], completionHandler: nil)
                                    
                            }
                    }
                }
                .navigationBarTitle(
                    Text("Settings")
                )
            }
        }
    }
}

#Preview {
    SettingsView()
}
