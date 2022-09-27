//
//  StretchView.swift
//  watchOS-Check-swiftUI Watch App
//
//  Created by 전지민 on 2022/09/21.
//

import SwiftUI

struct StretchView: View {
    @State private var selection = 1
    var body: some View {
        TabView (selection: $selection) {
            TerminateView()
                .tag(0)
            StretchingView()
                .tag(1)
        }
        .tabViewStyle(PageTabViewStyle())
        .navigationBarBackButtonHidden()
    }
}

struct StretchView_Previews: PreviewProvider {
    static var previews: some View {
        StretchView()
    }
}
