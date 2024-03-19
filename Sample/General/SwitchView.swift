//
//  SwitchView.swift
//  Sample
//
//  Created by AH on 2024-03-18.
//

import SwiftUI

struct FilterButton: View {
    @State private var isSelected = false
    private let title: String
    private let image: Image
    private let action:() -> Void
    
    init(title: String, image: Image, action: @escaping () -> Void) {
        self.title = title
        self.action = action
        self.image = image
    }
    
    var body: some View {
        Button {
            isSelected.toggle()
            action()
        } label: {
            labelView
        }
    }
    
    private var labelView: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 24)
                .fill(isSelected ? designSystem.palette.selected : designSystem.palette.background)
                .frame(width: 144, height: 49)
            Text(title).foregroundColor(isSelected ? designSystem.palette.lightText : designSystem.palette.darkText)
                .offset(CGSize(width: 10.0, height: 0))
            image.offset(CGSize(width: -55.0, height: 0))
        }
    }
}

struct FilterButton_Previews: PreviewProvider {
    static var previews: some View {
        FilterButton(title: "Top Rated", image: Image(.topRated), action: {
            print("Top Rated")
        })
    }
}
