//
//  SelectCurrency.swift
//  LOTR Converter
//
//  Created by David Laczkovits on 08.10.23.
//

import SwiftUI

struct SelectCurrency: View {
    
    @State var gridLayout = [GridItem(), GridItem(), GridItem()]
    
    @Binding var leftCurrency: Currency
    @Binding var rightCurrency: Currency
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            // Background Image
            Image(.parchment)
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .background(.brown)
            
            VStack {
                // Text
                Text("Select the currency you are starting with:")
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                // Currency Icon
                //CurrencyIcon(currencyImage: "copperpenny", currencyText: "Copper Penny")
                IconGrid(currency: $leftCurrency, key: "leftCurrency")
                
                // Text
                Text("Select the currency you would like to convert:")
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                // Currency Icon
                IconGrid(currency: $rightCurrency, key: "rightCurrency")
                
                // Done Button
                Button("Done") {
                    dismiss()
                }
                .font(.largeTitle)
                .padding(10)
                .foregroundColor(.white)
                .background(.brown)
                .cornerRadius(15)
            }
        }
    }
}

#Preview {
    SelectCurrency(leftCurrency: .constant(.silverPiece), rightCurrency: .constant(.goldPiece))
}
