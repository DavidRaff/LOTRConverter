//
//  ExchangeRate.swift
//  LOTR Converter
//
//  Created by David Laczkovits on 08.10.23.
//

import SwiftUI

struct ExchangeRate: View {
    
    @State var leftImage = ""
    @State var stringField = ""
    @State var rightImage = ""
    
    var body: some View {
        // Exchange Rates
        HStack {
            // Left Currency Image
            Image(leftImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            
            // Exchange rate text
            Text(stringField)
            
            // Right Currency Image
            Image(rightImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
        }
    }
}

#Preview {
    ExchangeRate(leftImage: "goldpiece", stringField: "1 Gold Piece = 4 Gold Pennies", rightImage: "goldpenny")
        .previewLayout(.sizeThatFits)

}
