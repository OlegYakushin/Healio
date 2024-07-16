//
//  AffirmationView.swift
//  Healio
//
//  Created by Oleg Yakushin on 7/15/24.
//

import SwiftUI

struct AffirmationView: View {
    @State private var isLiked = false
    @State private var isPresented = false
    var name = "Colds (Upper-respiratory Illness)"
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack {
            Image("affirmationBackground")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            VStack {
                ZStack {
                    HStack {
                        Image("backButton")
                            .resizable()
                            .frame(width: 20 * sizeScreen(), height: 20 * sizeScreen())
                            .onTapGesture {
                                presentationMode.wrappedValue.dismiss()
                            }
                        Spacer()
                    }
                    Text(name)
                        .foregroundColor(Color("fontDark"))
                        .font(.custom("Averta-Semibold", size: 16  * sizeScreen()))
                }
                Spacer()
                
            }
            .padding(.top, 60  * sizeScreen())
            .padding(.horizontal, 15 * sizeScreen())
            VStack(spacing: 48 * sizeScreen()) {
                Text("I allow my mind to be at peace.")
                    .foregroundColor(Color("fontDark"))
                    .font(.custom("AveriaSerifLibre-Light", size: 40  * sizeScreen()))
                    .multilineTextAlignment(.center)
                HStack(spacing: 36 * sizeScreen()) {
                    Image("infoImage")
                        .resizable()
                        .frame(width: 28 * sizeScreen(), height: 28 * sizeScreen())
                        .onTapGesture {
                            isPresented.toggle()
                        }
                    Image("sendImage")
                        .resizable()
                        .frame(width: 28 * sizeScreen(), height: 28 * sizeScreen())
                    Image(isLiked ? "likesSelImage" : "likesImage")
                        .resizable()
                        .frame(width: 28 * sizeScreen(), height: 28 * sizeScreen())
                        .onTapGesture {
                            withAnimation {
                                isLiked.toggle()
                            }
                        }
                }
            }
            .popover(isPresented: $isPresented, content: {
                if #available(iOS 16.0, *) {
                    AffirmationDescriptionView()
                        .presentationDetents([.fraction(3 / 5)])
                } else {
                    AffirmationDescriptionView()
                }
               
            })
        }
    }
}

#Preview {
    AffirmationView()
}
