//
//  CompleteView.swift
//  watchOS-Check-swiftUI Watch App
//
//  Created by 전지민 on 2022/09/21.
//

import SwiftUI

struct CompleteView: View {
    var body: some View {
        VStack(spacing: 22) {
            ZStack {
                Circle()
                    .foregroundColor(Color.mainColor)
                    .opacity(0.25)
                Circle()
                    .foregroundColor(Color.mainColor)
                    .padding(6)
                Image(systemName: "figure.cooldown")
                    .font(.system(size: 54))
                    .foregroundColor(Color.black)
            }
            Text("스트레칭이 완료되었습니다")
                .font(.system(size: 20))
                .fontWeight(.medium)
        }
    }
}

struct CompleteView_Previews: PreviewProvider {
    static var previews: some View {
        CompleteView()
    }
}
