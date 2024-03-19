//
//  SwitchView.swift
//  Sample
//
//  Created by AH on 2024-03-18.
//

import SwiftUI

struct FilterButton: View {
    @Binding private var isSelected: Bool
    private let title: String
    private let image: Image
    private let action:() -> Void
    
    init(isSelected: Binding<Bool>, title: String, image: Image, action: @escaping () -> Void) {
        self._isSelected = isSelected
        self.title = title
        self.image = image
        self.action = action
    }
    
    var body: some View {
        Button {
            isSelected.toggle()
            action()
        } label: {
            labelView.shadow(color: Color.black.opacity(0.1), radius: 4, x: 2, y: 0)
        }
    }
    
    private var labelView: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 24)
                .fill(isSelected ? designSystem.palette.selected : .white)
                .frame(width: 144, height: 49)
            Text(title)
                .font(designSystem.fontguide.title2)
                .foregroundColor(isSelected ? designSystem.palette.lightText : designSystem.palette.darkText)
                .offset(CGSize(width: 10.0, height: 0))
            image.offset(CGSize(width: -55.0, height: 0))
        }
    }
}

struct FilterButton_Previews: PreviewProvider {
    @State private static var isSelected = false
    static var previews: some View {
        FilterButton(isSelected: $isSelected, title: "Top Rated", image: Image(.topRated), action: {
            print("Top Rated")
        })
    }
}
