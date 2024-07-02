//
//  BackgroundView.swift
//  Healio
//
//  Created by Oleg Yakushin on 6/25/24.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        Color("backgroundColor")
            .ignoresSafeArea()
    }
}

#Preview {
    BackgroundView()
}
