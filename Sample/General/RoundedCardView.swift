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
             RoundedRectangle(cornerRadius: 0)
                 .fill(.white)
                 .frame(height: 220)
                 .cornerRadius(12, corners: [.topLeft, .topRight])
                 .overlay(content)
                 .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 4)
         }
     }
 }

 struct RoundedCardView_Previews: PreviewProvider {
     static var previews: some View {
         RoundedCardView {
             Text("No items to display" )
         }.preferredColorScheme(.light)
     }
 }
