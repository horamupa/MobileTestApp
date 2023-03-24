//
//  SearchHintView.swift
//  EffectiveMobileTestApp
//
//  Created by MM on 23.03.2023.
//

import SwiftUI

struct SearchHintView: View {
    
    var text: String
    
    var body: some View {
        Text(text)
            .font(.mantserrat(.regular, size: 14))
    }
}

struct SearchHintView_Previews: PreviewProvider {
    static var previews: some View {
        SearchHintView(text: "gogo")
    }
}
