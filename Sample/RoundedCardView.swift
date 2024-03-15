//
//  RoundedCardView.swift
//  Sample
//
//  Created by AH on 2024-03-15.
//

import SwiftUI


struct RoundedCardView<Content: View>: View {
     var content: Content

     init(@ViewBuilder content: () -> Content) {
         self.content = content()
     }

     var body: some View {
         VStack(alignment: .leading, spacing: 0) {
             RoundedRectangle(cornerRadius: 12)
                 .fill(.white)
                 .frame(height: 220)
                 .shadow(color: Color.black.opacity(0.1),
                         radius: 12,
                         x: 0,
                         y: 4)
                 .overlay(content)
         }
         .padding(8)
     }
 }

 struct RoundedRectangleWrapper_Previews: PreviewProvider {
     static var previews: some View {
         RoundedCardView {
             Text("Glasses")
         }.preferredColorScheme(.light)
         RoundedCardView {
             Text("Sample")
         }.preferredColorScheme(.dark)
     }
 }
