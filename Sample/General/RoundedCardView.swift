//
//  RoundedCardView.swift
//  Sample
//
//  Created by AH on 2024-03-15.
//

import SwiftUI

struct RoundedCardView<Content: View>: View {
    var content: Content
    var corners: UIRectCorner
    var height: CGFloat

    init(corners: UIRectCorner, height: CGFloat = 220, @ViewBuilder content: () -> Content) {
        self.content = content()
        self.corners = corners
        self.height = height
     }

     var body: some View {
         VStack(alignment: .leading, spacing: 0) {
             RoundedRectangle(cornerRadius: 0)
                 .fill(.white)
                 .frame(height: height)
                 .cornerRadius(12, corners: corners)
                 .overlay(content)
                 .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 4)
         }
     }
 }

 struct RoundedCardView_Previews: PreviewProvider {
     static var previews: some View {
         RoundedCardView (corners: [.topLeft, .topRight], content: {
             Text("No items to display")
         })
     }
 }
