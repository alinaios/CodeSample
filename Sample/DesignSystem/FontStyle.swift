//
//  FontStyle.swift
//  Sample
//
//  Created by AH on 2024-03-18.
//

import SwiftUI

protocol FontStyleProtocol {
    var title1: Font { get }
    var title2: Font { get }
    var subtitle1: Font { get }
    var footer1: Font { get }
    var headline1: Font { get }
    var headline2: Font { get }
}

struct ClassicFont: FontStyleProtocol {
    var title1: Font = Font.custom("Helvetica", size: 18)
    
    var title2: Font = Font.custom("Helvetica", size: 14)
    
    var subtitle1: Font = Font.custom("Helvetica", size: 12).bold()
    
    var footer1: Font = Font.custom("Inter", size: 10)
    
    var headline1: Font = Font.custom("Helvetica", size: 24)
    
    var headline2: Font = Font.custom("Helvetica", size: 24)
}
