//
//  Spinner.swift
//  Sample
//
//  Created by AH on 2024-03-18.
//

import SwiftUI

struct ActivityView: View {
    @Binding var isAnimating: Bool

    init(isAnimating: Binding<Bool>) {
        self._isAnimating = isAnimating
    }
    var body: some View {
        ZStack {
            Circle()
                .trim(from: 0, to: 0.7)
                .stroke(Color.blue, lineWidth: 4)
                .frame(width: 50, height: 50)
                .rotationEffect(.degrees(isAnimating ? 360 : 0))
                .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false), value: 2)
        }
    }
}


extension View {
    func eraseToAnyView() -> AnyView { AnyView(self) }
}
