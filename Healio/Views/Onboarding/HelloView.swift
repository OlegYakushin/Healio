//
//  HelloView.swift
//  Healio
//
//  Created by Oleg Yakushin on 6/25/24.
//

import SwiftUI
import AVKit

struct HelloView: View {
    @State var isVisible = false
    let animationDuration: Double = 1.5
    @State private var animationProgress: CGFloat = 0
    
    var body: some View {
        ZStack {
          //  Color("startColor")
            //    .ignoresSafeArea()
            VideoPlayerView(videoName: "Dandelion")
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            VStack(spacing: 16 * sizeScreen()) {
                
                Text("Healio")
                    .font(.custom("AveriaSerifLibre-Light", size: 40  * sizeScreen()))
                    .kerning(-1.2  * sizeScreen())
                    .foregroundColor(Color("fontDark"))
                    .opacity(animationProgress)
                
                Text("Harness the power of the\nhealing affirmations")
                    .multilineTextAlignment(.center)
                    .font(.custom("AvertaDemoPE-Regular", size: 16  * sizeScreen()))
                    .foregroundColor(Color("fontDark"))
                    .opacity(animationProgress)
                
              
                 
            }
            .padding(.bottom, 140 * sizeScreen())
        }
        .onAppear {
            withAnimation(.easeInOut.delay(isVisible ? 0.5 : 0)) {
                isVisible = true
            }
        }
        .onAppear {
            withAnimation(Animation.easeInOut(duration: animationDuration)) {
                self.animationProgress = 1
            }
        }
    }
}

struct VideoPlayerView: UIViewRepresentable {
    var videoName: String
    
    func makeUIView(context: Context) -> UIView {
        return LoopingPlayerUIView(videoName: videoName)
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {}
}

class LoopingPlayerUIView: UIView {
    private let playerLayer = AVPlayerLayer()
    private var playerLooper: AVPlayerLooper?
    
    init(videoName: String) {
        super.init(frame: .zero)
        guard let path = Bundle.main.path(forResource: videoName, ofType: "mov") else {
            return
        }
        let url = URL(fileURLWithPath: path)
        let asset = AVAsset(url: url)
        let playerItem = AVPlayerItem(asset: asset)
        
        let player = AVQueuePlayer(playerItem: playerItem)
        playerLayer.player = player
        playerLayer.videoGravity = .resizeAspectFill
        layer.addSublayer(playerLayer)
        
        playerLooper = AVPlayerLooper(player: player, templateItem: playerItem)
        player.play()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = bounds
    }
}

#Preview {
    HelloView()
}
