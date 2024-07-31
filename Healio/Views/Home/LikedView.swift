//
//  LikedView.swift
//  Healio
//
//  Created by Oleg Yakushin on 6/27/24.
//

import SwiftUI

struct LikedView: View {
    @State private var selected = "Health issues"
    @ObservedObject var likedItemsViewModel = LikedItemsViewModel()
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
                    VStack(alignment: .center, spacing: 20  * sizeScreen()) {
                        HStack(spacing: 0) {
                            RoundedRectangle(cornerRadius: 22 * sizeScreen())
                                .frame(width: 124 * sizeScreen(), height: 39 * sizeScreen())
                                .foregroundColor(selected == "Health issues" ? .white : .clear)
                                .overlay(
                                    Text("Health issues")
                                        .font(.custom("Averta-Semibold", size: 16  * sizeScreen()))
                                        .kerning(-1.2)
                                        .foregroundColor(Color("fontDark"))
                                )
                                .onTapGesture {
                                    selected = "Health issues"
                                }
                            RoundedRectangle(cornerRadius: 22 * sizeScreen())
                                .frame(width: 124 * sizeScreen(), height: 39 * sizeScreen())
                                .foregroundColor(selected == "Emotions" ? .white : .clear)
                                .overlay(
                                    Text("Emotions")
                                        .font(.custom("Averta-Semibold", size: 16  * sizeScreen()))
                                        .kerning(-1.2)
                                        .foregroundColor(Color("fontDark"))
                                )
                                .onTapGesture {
                                    selected = "Emotions"
                                }
                            RoundedRectangle(cornerRadius: 22 * sizeScreen())
                                .frame(width: 124 * sizeScreen(), height: 39 * sizeScreen())
                                .foregroundColor(selected == "Affirmations" ? .white : .clear)
                                .overlay(
                                    Text("Affirmations")
                                        .font(.custom("Averta-Semibold", size: 16  * sizeScreen()))
                                        .kerning(-1.2)
                                        .foregroundColor(Color("fontDark"))
                                )
                                .onTapGesture {
                                    selected = "Affirmations"
                                }
                        }
                        .padding(.horizontal, 5 * sizeScreen())
                        if selected == "Health issues" {
                            VStack {
                                EachLikedView(name: "Lower back")
                                EachLikedView(name: "Lower back")
                                EachLikedView(name: "Lower back")
                                EachLikedView(name: "Lower back")
                                EachLikedView(name: "Lower back")
                                EachLikedView(name: "Lower back")
                            }
                            .padding(.horizontal, 25 * sizeScreen())
                        } else if selected == "Affirmations" {
                            EachLikedAffirmayionView(text: "I allow my mind to be at peace.")
                            EachLikedAffirmayionView(text: "I realize that I have the power to control my hapyness.")
                            EachLikedAffirmayionView(text: "I am happy to be healthy and live a great life.")
                            EachLikedAffirmayionView(text: "I love myself unconditionally regardless of circumstances.")
                            EachLikedAffirmayionView(text: "I accept compliments from other’s and know they are true and this is a very long affirmation.")
                        } else if selected == "Emotions" {
                            EachLikedEmotionalView(name: "Resentment")
                            EachLikedEmotionalView(name: "Fear")
                            EachLikedEmotionalView(name: "Anger")
                            EachLikedEmotionalView(name: "Grief and sadness")
                            EachLikedEmotionalView(name: "Guilt and shame")
                            EachLikedEmotionalView(name: "Loneliness")
                            EachLikedEmotionalView(name: "Stress")
                        }
                    }
                }
            }
            .navigationTitle("Liked")
        }
    }
}

#Preview {
    LikedView()
}


struct LikedItem: Identifiable {
    let id = UUID()
    let category: String
    let name: String
}


class LikedItemsViewModel: ObservableObject {
    @Published var likedItems: [LikedItem] = []
    
    // Function to add a liked item
    func addLikedItem(category: String, name: String) {
        let newItem = LikedItem(category: category, name: name)
        likedItems.append(newItem)
    }
}
