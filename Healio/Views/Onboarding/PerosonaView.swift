//
//  PerosonaView.swift
//  Healio
//
//  Created by Oleg Yakushin on 7/1/24.
//

import SwiftUI

struct PerosonaView: View {
    @State private var isLoading = false
    
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundView()
                VStack {
                    Text("Personalizing your content...")
                        .padding()
                        .foregroundColor(Color("fontDark"))
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    self.isLoading = true
                }
            }
            .navigationBarHidden(true)
            .background(NavigationLink(
                destination: BegunView().navigationBarBackButtonHidden(),
                isActive: $isLoading,
                label: {
                    EmptyView()
                })
            )
        }
    }
}

#Preview {
    PerosonaView()
}

struct SpinnerView: View {
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                ForEach(1...4, id: \.self) { index in
                    CornerView(index: index)
                }
                Spacer()
            }
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}

struct CornerView: View {
    let index: Int
    
    @State private var rotation: Double = 0
    
    var body: some View {
        Rectangle()
            .frame(width: 40, height: 40)
            .foregroundColor(Color.blue) // Adjust color as needed
            .rotationEffect(.degrees(rotation))
            .animation(Animation.linear(duration: 3).repeatForever(autoreverses: false))
            .onAppear {
                withAnimation {
                    rotation = 360
                }
            }
    }
}

struct SpinnerView_Previews: PreviewProvider {
    static var previews: some View {
        SpinnerView()
    }
}
