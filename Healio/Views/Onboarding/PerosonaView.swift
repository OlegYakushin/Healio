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
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
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
   // RotatingCornersView()
    ParticleView()
        .background(Color.black.edgesIgnoringSafeArea(.all))
}

struct RotatingCornersView: View {
    @State private var rotation: Double = 0
    
    let animationDuration: Double = 3.0
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .strokeBorder(Color.clear, lineWidth: 1)
                .frame(width: 60, height: 60)
                .onAppear {
                    withAnimation(Animation.linear(duration: animationDuration).repeatForever(autoreverses: false)) {
                        rotation = 360
                    }
                }
            
            CornerView(rotation: $rotation, cornerRadius: 10, color: Color.blue)
                .frame(width: 60, height: 60)
        }
    }
}

struct CornerView: View {
    @Binding var rotation: Double
    var cornerRadius: CGFloat
    var color: Color
    
    var body: some View {
        ZStack {
            // Уголки
            ForEach(0..<4) { index in
                Rectangle()
                    .fill(color)
                    .frame(width: 20, height: 20)
                    .clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
                    .rotationEffect(.degrees(rotation), anchor: index == 0 ? .topLeading : index == 1 ? .topTrailing : index == 2 ? .bottomLeading : .bottomTrailing)
                    .offset(x: index % 2 == 0 ? -30 : 30, y: index < 2 ? -30 : 30)
                    .animation(.linear(duration: 3).repeatForever(autoreverses: false), value: rotation)
            }
        }
    }
}
struct Particle {
    var x: CGFloat
    var y: CGFloat
    var vx: CGFloat
    var vy: CGFloat
    var radius: CGFloat
    var color: Color

    mutating func update(in size: CGSize) {
        x += vx
        y += vy

        if x < 0 || x > size.width {
            vx = -vx
        }
        if y < 0 || y > size.height {
            vy = -vy
        }
    }
}
struct ParticleView: View {
    @State private var particles: [Particle] = []
    @State private var size: CGSize = .zero

    let particleCount = 100
    let timer = Timer.publish(every: 1/60, on: .main, in: .common).autoconnect()

    var body: some View {
        GeometryReader { geometry in
            Canvas { context, size in
                for particle in particles {
                    context.fill(Path(ellipseIn: CGRect(x: particle.x, y: particle.y, width: particle.radius * 2, height: particle.radius * 2)),
                                  with: .color(particle.color))
                }
            }
            .onAppear {
                size = geometry.size
                initializeParticles()
            }
            .onChange(of: geometry.size) { newSize in
                size = newSize
                initializeParticles()
            }
            .onReceive(timer) { _ in
                updateParticles()
            }
        }
    }

    private func initializeParticles() {
        particles = (0..<particleCount).map { _ in
            Particle(
                x: CGFloat.random(in: 0..<size.width),
                y: CGFloat.random(in: 0..<size.height),
                vx: CGFloat.random(in: -0.3...0.3),
                vy: CGFloat.random(in: -0.3...0.3),
                radius: CGFloat.random(in: 2...3),
                color: Color("particalColor").opacity(Double.random(in: 0...1))
            )
        }
    }

    private func updateParticles() {
        for index in particles.indices {
            particles[index].update(in: size)
        }
    }
}
