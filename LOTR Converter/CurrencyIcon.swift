//
//  CurrencyIcon.swift
//  LOTR Converter
//
//  Created by David Laczkovits on 08.10.23.
//

import SwiftUI

struct CurrencyIcon: View {
    
    @State var currencyImage = ""
    @State var currencyText = ""
    
    var body: some View {
        ZStack {
            // Currency Imag
            Image(currencyImage)
                .resizable()
                .scaledToFit()
            
            // Currency Text
            VStack {
                Spacer()
                Text(currencyText)
                    .padding(3)
                    .font(.caption)
                    .background(.brown.opacity(0.75))
            }
            
        }
        .padding(3)
        .frame(width: 100, height: 100)
        .background(.brown)
        .cornerRadius(25)
    }
}

#Preview {
    CurrencyIcon(currencyImage: "copperpenny", currencyText: "Copper Penny")
        .previewLayout(.sizeThatFits)
}
