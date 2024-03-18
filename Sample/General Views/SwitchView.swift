//
//  SwitchView.swift
//  Sample
//
//  Created by AH on 2024-03-18.
//

import SwiftUI

struct CustomSwitch: View {
    @State private var isSelected = false
    private let title: String
    private let action:() -> Void
    
    init(title: String, action: @escaping () -> Void) {
        self.title = title
        self.action = action
    }
    var body: some View {
        ZStack {
            Toggle(isOn: $isSelected) {
                Image(isSelected ? .topRated : .topRated)
            }
            .tint(designSystem.palette.selected)
            .toggleStyle(.button)
            .clipShape(Ellipse())
            Text(title)
                .foregroundColor(isSelected ? designSystem.palette.lightText : designSystem.palette.darkText)
           }
       }
}

struct CustomSwitch_Previews: PreviewProvider {
    static var previews: some View {
        CustomSwitch(title: "Top Rated", action: {})
    }
}
