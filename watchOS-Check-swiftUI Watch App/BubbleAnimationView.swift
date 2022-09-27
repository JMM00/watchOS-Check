//
//  BubbleAnimationView.swift
//  watchOS-Check-swiftUI Watch App
//
//  Created by 전지민 on 2022/09/28.
//

import SwiftUI

struct BubbleAnimationView: View {
    @ObservedObject var myTimer = MyTimer()
    var body: some View {
        ZStack {
            MorphingCircle(250, morphingRange: 50, color: Color.skyblue, duration: 2, secting: 4)
                .opacity(0.3)
                .blendMode(.screen)
            MorphingCircle(300, morphingRange: 70, color: Color.white, duration: 2)
                .opacity(0.3)
                .blendMode(.screen)
            MorphingCircle(250, morphingRange: 50, color: Color.lightpurple, duration: 2)
                .opacity(0.3)
                .blendMode(.screen)
            Text("\(self.myTimer.value)").font(.largeTitle)
        }
    }
}

struct BubbleAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        BubbleAnimationView()
    }
}
