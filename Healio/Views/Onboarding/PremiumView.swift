//
//  PremiumView.swift
//  Healio
//
//  Created by Oleg Yakushin on 6/25/24.
//

import SwiftUI

struct PremiumView: View {
    var body: some View {
        ZStack{
            BackgroundView()
            VStack {
                Text("Try Helio Premium")
                HStack {
                    Text("Restore")
                    Text("Terms & Conditions")
                    Text("Privacy Policy")                }
            }
        }
    }
}

#Preview {
    PremiumView()
}
