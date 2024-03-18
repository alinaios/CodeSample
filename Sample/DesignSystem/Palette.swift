//
//  Palette.swift
//  Sample
//
//  Created by AH on 2024-03-18.
//

import SwiftUI

protocol PaletteProtocol {
    var darkText: Color { get }
    var lightText: Color { get }
    var subtitle: Color { get }
    var background: Color { get }
    var selected: Color { get }
    var positive: Color { get }
    var negative: Color { get }
}

struct ClassicPalette: PaletteProtocol {
    var darkText: Color = Color(.sampleDarkText)
    
    var lightText: Color = Color(.sampleLigthText)
    
    var subtitle: Color = Color(.sampleSubtitle)
    
    var background: Color = Color(.sampleBackground)
    
    var selected: Color = Color(.sampleSelected)
    
    var positive: Color = Color(.samplePositive)
    
    var negative: Color = Color(.sampleNegative)
}
