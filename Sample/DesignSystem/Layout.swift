//
//  Layout.swift
//  Sample
//
//  Created by AH on 2024-03-18.
//

import Foundation

protocol LayoutProtocol {
    var small: CGFloat { get }
    var medium: CGFloat { get }
    var large: CGFloat { get }
}

struct ClassicLayout: LayoutProtocol {
    var small: CGFloat = 8
    var medium: CGFloat = 16
    var large: CGFloat = 24
}
