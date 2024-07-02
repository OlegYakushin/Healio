//
//  NameView.swift
//  Healio
//
//  Created by Oleg Yakushin on 6/26/24.
//

import SwiftUI

struct NameView: View {
    @State private var name: String = ""
    
    var body: some View {
        ZStack {
           BackgroundView()
            
            VStack(spacing: 20  * sizeScreen()) {
                VStack(alignment: .leading, spacing: 20  * sizeScreen()) {
                    VStack(alignment: .leading) {
                        Text("Let’s get to know")
                            .font(.custom("AveriaSerifLibre-Light", size: 34  * sizeScreen()))
                            .kerning(-1.2  * sizeScreen())
                            .foregroundColor(Color("fontDark"))
                            .multilineTextAlignment(.leading)
                        Text("each other. What is")
                            .font(.custom("AveriaSerifLibre-Light", size: 34  * sizeScreen()))
                            .kerning(-1.2  * sizeScreen())
                            .foregroundColor(Color("fontDark"))
                            .multilineTextAlignment(.leading)
                        Text("your name?")
                            .font(.custom("AveriaSerifLibre-Light", size: 34  * sizeScreen()))
                            .kerning(-1.2  * sizeScreen())
                            .foregroundColor(Color("fontDark"))
                            .multilineTextAlignment(.leading)
                        
                        
                        
                        Text("This information will only be used")
                            .font(.custom("AvertaDemoPE-Regular", size: 16  * sizeScreen()))
                            .foregroundColor(Color("fontDark"))
                            .multilineTextAlignment(.leading)
                            .padding(.top, 12 * sizeScreen())
                        Text("personalize your content.")
                            .font(.custom("AvertaDemoPE-Regular", size: 16  * sizeScreen()))
                            .foregroundColor(Color("fontDark"))
                            .multilineTextAlignment(.leading)
                            .padding(.bottom, 12 * sizeScreen())
                        TextField("Your name", text: $name)
                            .padding(.top, 20  * sizeScreen())
                            .background(Color.clear)
                            .font(.custom("Avenir-Roman", size: 34  * sizeScreen()))
                     
                    }
                    .frame(width: 330 * sizeScreen())
                     
                }
                
              
                Spacer()
                if name.isEmpty {
                    RoundedRectangle(cornerRadius: 40  * sizeScreen())
                        .frame(width: 311  * sizeScreen(), height: 62  * sizeScreen())
                        .foregroundColor(Color("grayOne"))
                        .overlay(
                        Text("Continue")
                            .foregroundColor(.white)
                            .font(.custom("Averta-Bold", size: 16  * sizeScreen()))
                        )
                        .padding(.top, 20  * sizeScreen())
                        .padding(.bottom, 10  * sizeScreen())
                }else{
                    NavigationLink(destination:  IllnessView().navigationBarBackButtonHidden()) {
                        ButtonView(name: "Continue")
                    }
                    
                    .padding(.top, 20  * sizeScreen())
                    .padding(.bottom, 10  * sizeScreen())
                }
            }
            .padding(.top, 30  * sizeScreen())
        }
    }
}

#Preview {
    NameView()
}
