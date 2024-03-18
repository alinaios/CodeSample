//
//  Layout.swift
//  Sample
//
//  Created by AH on 2024-03-18.
//

import Foundation

protocol LayoutProtocol {
    static var small: CGFloat { get }
    static var medium: CGFloat { get }
    static var large: CGFloat { get }
}

struct ClassicLayout: LayoutProtocol {
    static var small: CGFloat = 8
    
    static var medium: CGFloat = 16
    
    static var large: CGFloat = 24
}
