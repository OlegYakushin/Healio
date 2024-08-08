//
//  HomeView.swift
//  Healio
//
//  Created by Oleg Yakushin on 6/27/24.
//

import SwiftUI
import Lottie
import StoreKit

struct HomeView: View {
    @StateObject private var viewModel = DiseaseViewModel()
    @StateObject private var categoryViewModel = CategoryViewModel()
    @StateObject private var categoryModel = CategoryOvercomeViewModel()
    @State private var isShowing = false
    @State private var showShareFeedback = true
    
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
                    VStack(alignment: .leading, spacing: 20 * sizeScreen()) {
                        HStack {
                            Spacer()
                            LottieView(animation: .named("Home_header"))
                                .playing(loopMode: .playOnce)
                                .frame(width: 375 * sizeScreen(), height: 184 * sizeScreen())
                        }
                        .offset(y: -150 * sizeScreen())
                        .padding(.bottom, -184 * sizeScreen())
                        
                        if let categoryData = categoryViewModel.categoryData {
                            Text(categoryData.category)
                                .font(.custom("Averta-Semibold", size: 18 * sizeScreen()))
                                .foregroundColor(Color("fontDark"))
                                .padding(.leading, 25 * sizeScreen())
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 16 * sizeScreen()) {
                                    ForEach(categoryData.subcategories, id: \.self) { subcategory in
                                        NavigationLink(destination: AffirmationView(name: subcategory, text: subcategory.description).navigationBarBackButtonHidden()) {
                                            EachEmotionView(name: subcategory)
                                        }
                                    }
                                }
                                .padding(.vertical, 1)
                                .padding(.leading, 25 * sizeScreen())
                            }
                        }
                        
                        let tags = Array(viewModel.groupedByTags().keys).filter { $0 != "Unknown" }
                        ForEach(tags.indices, id: \.self) { index in
                            let tag = tags[index]
                            VStack(alignment: .leading) {
                                Text(tag)
                                    .font(.custom("Averta-Semibold", size: 18 * sizeScreen()))
                                    .foregroundColor(Color("fontDark"))
                                    .padding(.leading, 25 * sizeScreen())
                                
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack(spacing: 16 * sizeScreen()) {
                                        ForEach(viewModel.groupedByTags()[tag] ?? []) { diseaseData in
                                            NavigationLink(destination: AffirmationView(name: diseaseData.disease, text: diseaseData.disease.description).navigationBarBackButtonHidden()) {
                                                EachSkinView(name: diseaseData.disease, problemcause: diseaseData.problemCause)
                                            }
                                        }
                                    }
                                    .padding(.vertical, 5)
                                    .padding(.leading, 25 * sizeScreen())
                                }
                                
                                if index == 1 {
                                    if let categoryData = categoryModel.categoryData {
                                        Text(categoryData.category)
                                            .font(.custom("Averta-Semibold", size: 18 * sizeScreen()))
                                            .foregroundColor(Color("fontDark"))
                                            .padding(25 * sizeScreen())
                                        
                                        ScrollView(.horizontal, showsIndicators: false) {
                                            HStack(spacing: 16 * sizeScreen()) {
                                                ForEach(categoryData.subcategories, id: \.name) { subcategory in
                                                    NavigationLink(destination: AffirmationView(name: subcategory.name, text: "").navigationBarBackButtonHidden(true)) {
                                                        EachOvercomeEmotionView(name: subcategory.name, description: subcategory.description)
                                                    }
                                                }
                                            }
                                            .padding(.vertical, 1)
                                            .padding(.leading, 25 * sizeScreen())
                                        }
                                    }
                                    Image("shareFeedback")
                                        .resizable()
                                        .frame(width: 327 * sizeScreen(), height: 128 * sizeScreen())
                                        .padding(.leading, 25 * sizeScreen())
                                        .onTapGesture {
                                            if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                                                SKStoreReviewController.requestReview(in: scene)
                                            }
                                        }
                                        .onAppear {
                                            withAnimation(.easeInOut(duration: 0.7)) {
                                                isShowing = true
                                            }
                                        }
                                        .overlay(
                                            ShineEffect(isShowing: isShowing)
                                        )
                                }
                                
                                if index == 3 {
                                    Image("tellMore")
                                        .resizable()
                                        .frame(width: 327 * sizeScreen(), height: 128 * sizeScreen())
                                        .padding(.leading, 25 * sizeScreen())
                                        .onTapGesture {
                                            if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                                                SKStoreReviewController.requestReview(in: scene)
                                            }
                                        }
                                }
                            }
                        }
                    }
                }
                .navigationBarTitle(
                    Text("Explore")
                )
            }
        }
    }
}


#Preview {
    HomeView()
}

struct ShineEffect: View {
    let isShowing: Bool
    
    var body: some View {
        Rectangle()
            .fill(LinearGradient(
                gradient: Gradient(colors: [
                    Color.clear,
                    Color.clear,
                    Color.white.opacity(0.14),
                    Color.white.opacity(0.1),
                    Color.clear,
                    Color.clear,
                    Color.white.opacity(0.3),
                    Color.clear
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            ))
            .frame(width: 200, height: 250)
            .mask(
                Rectangle()
                    .fill(Color.white)
                    .offset(x: isShowing ? 200 : -200, y: isShowing ? 200 : -200)
                    .animation(.easeInOut(duration: 0.7), value: isShowing)
            )
    }
}
