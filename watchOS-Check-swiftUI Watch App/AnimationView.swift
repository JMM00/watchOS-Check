//
//  AnimationView.swift
//  watchOS-Check-swiftUI Watch App
//
//  Created by 전지민 on 2022/09/28.
//

import SwiftUI

struct AnimationView: View {
    public init() {}
    public var body: some View {
        ZStack {
            CircleAnimationView()
                .opacity(0.3)
                .blendMode(.screen)
            CircleAnimationView()
                .blendMode(.screen)
                .blur(radius: 28)
        }
    }
}

fileprivate
struct CircleAnimationView: View {
    
    @State private var value1: CGFloat = -1
    @State private var value2: CGFloat = -1
    @State private var value3: CGFloat = 1
    
    @ObservedObject var myTimer = MyTimer()
    
    var body: some View {
        GeometryReader { proxy in
            let min = min(proxy.size.width * 0.5, proxy.size.height * 0.5)
            ZStack {
                Color.clear
                let scale2 = 1 + value2 * 0.3
                CircleView(size: min, scale: scale2, radius: min * 0.2, color: Color.mint2, value: $value2)
                    .offset(x: sin(min * scale2), y: cos(min * scale2))
                
                let scale1 = 1 + value1 * 0.3
                CircleView(size: min, scale: scale1, radius: min * 0.2, color: Color.white, value: $value1)
                    .offset(x: cos(min * scale1), y: sin(min * scale1))
                
                let scale3 = 1 + value3 * 0.3
                CircleView(size: min, scale: scale3, radius: min * 0.2, color: Color.purple2, value: $value3)
                    .offset(x: sin(min * scale3), y: cos(min * scale3))
                Text("\(self.myTimer.value)").font(.largeTitle)
            }
            .onAppear {
                DispatchQueue.main.async {
                    withAnimation(Animation.easeInOut(duration: 12.0).repeatForever(autoreverses: true)) {
                        value3 = -1
                    }
                    withAnimation(Animation.easeInOut(duration: 8.0).repeatForever(autoreverses: true)) {
                        value2 = 1
                    }
                    withAnimation(Animation.easeInOut(duration: 16.0).repeatForever(autoreverses: true)) {
                        value1 = 1
                    }
                }
            }
        }
    }
}

fileprivate
struct CircleView: View {
    
    let size: CGFloat
    let scale: CGFloat
    let radius: CGFloat
    let color: Color
    @Binding var value: CGFloat
    
    var body: some View {
        Circle()
            .fill(color)
            .frame(width: size, height: size)
            .scaleEffect(scale)
            .modifier(CircleAnimation(radius: radius * scale, value: value))
    }
}

fileprivate
struct CircleAnimation: AnimatableModifier {
    
    let radius: CGFloat
    var value: CGFloat = 0
    
    var animatableData: CGFloat {
        get {
            value
        } set {
            value = newValue
        }
    }
    
    func body(content: Content) -> some View {
        content.offset(
            x: radius * cos(value * (2 * CGFloat.pi)),
            y: radius * sin(value * (2 * CGFloat.pi))
        )
    }
}

struct AnimationView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationView()
    }
}
