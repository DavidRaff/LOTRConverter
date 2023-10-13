//
//  IconGrid.swift
//  LOTR Converter
//
//  Created by David Laczkovits on 08.10.23.
//

import SwiftUI

struct IconGrid: View {
    
    @State var gridLayout = [GridItem(), GridItem(), GridItem()]
    @Binding var currency: Currency
    @State var key : String
    
    var body: some View {
        LazyVGrid(columns: gridLayout) {
            ForEach(0..<6) { i in
                if Currency.allCases[i] == currency {
                    CurrencyIcon(currencyImage: CurrencyImage.allCases[i].rawValue, currencyText: CurrencyText.allCases[i].rawValue)
                        .overlay(RoundedRectangle(cornerRadius: 25).stroke(lineWidth: 3).opacity(0.5)).shadow(color: .black, radius: 9)
                } else {
                    CurrencyIcon(currencyImage: CurrencyImage.allCases[i].rawValue, currencyText: CurrencyText.allCases[i].rawValue)
                        .onTapGesture {
                            currency = Currency.allCases[i]
                        }
                }
            }
        }
        .padding([.bottom, .leading, .trailing])
    }
}


#Preview {
    IconGrid(currency: .constant(.silverPiece), key: "leftCurrency")
}
