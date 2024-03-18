//
//  DesignSystem.swift
//  Sample
//
//  Created by AH on 2024-03-18.
//

import SwiftUI

struct DesignSystem {
    var fontguide: FontStyleProtocol
    var palette: PaletteProtocol
    var spacing: LayoutProtocol
}

struct PrototypePalette: PaletteProtocol {
    var darkText: Color
    
    var lightText: Color
    
    var subtitle: Color
    
    var background: Color
    
    var selected: Color
    
    var positive: Color
    
    var negative: Color
}

enum ProjectLayout: LayoutProtocol {
    static var small: CGFloat = 8
    
    static var medium: CGFloat = 16
    
    static var large: CGFloat = 24
}
