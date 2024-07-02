//
//  FunctionForResize.swift
//  Healio
//
//  Created by Oleg Yakushin on 6/26/24.
//

import SwiftUI

func sizeScreen() -> CGFloat {
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    let designWidth: CGFloat = 375
    let designHeight: CGFloat = 812
    
    let widthRatio = screenWidth / designWidth
    let heightRatio = screenHeight / designHeight
    
    return min(widthRatio, heightRatio)
}
