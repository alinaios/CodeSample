//
//  DetailCardView.swift
//  Sample
//
//  Created by AH on 2024-03-15.
//

import SwiftUI

struct DetailCardView: View {
    var body: some View {
        RoundedCardView {
            VStack (alignment: .leading, spacing: 16, content: {
                Text("Title")
                Text("Subtitle")
                Text("Status")
            }).padding(16)
        }
    }
}

struct DetailCardView_Previews: PreviewProvider {
    static var previews: some View {
        DetailCardView()
    }
}
