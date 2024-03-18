//
//  SwitchView.swift
//  Sample
//
//  Created by AH on 2024-03-18.
//

import SwiftUI

struct CustomSwitch: View {
    @State private var isSelected = false
    @State var title = "Top Rated"
    
    var body: some View {
        ZStack {
            Toggle(isOn: $isSelected) {
                Image(isSelected ? .topRated : .topRated)
            }
            .tint(designSystem.palette.selected)
            .toggleStyle(.button)
            .clipShape(Ellipse())
               Text(title)
           }
       }
}

struct CustomSwitch_Previews: PreviewProvider {
    static var previews: some View {
        CustomSwitch()
    }
}
