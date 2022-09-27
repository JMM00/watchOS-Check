//
//  terminateView.swift
//  watchOS-Check-swiftUI Watch App
//
//  Created by 전지민 on 2022/09/21.
//

import SwiftUI

struct TerminateView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        VStack {
            Button () {
                self.presentationMode.wrappedValue.dismiss()
            } label: {
                Image(systemName: "xmark")
                    .font(.system(size: 40))
            }
            .padding(.horizontal, 50)
            .tint(Color.red)
            Text("종료")
                .fontWeight(.bold)
        }

    }
}

struct TerminateView_Previews: PreviewProvider {
    static var previews: some View {
        TerminateView()
    }
}
