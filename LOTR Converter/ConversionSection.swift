//
//  ConversionSection.swift
//  LOTR Converter
//
//  Created by David Laczkovits on 12.11.23.
//

import SwiftUI

struct ConversionSection: View {
    
    @Binding var amount : String
    @Binding var otherAmount : String
    @Binding var currency: Currency
    @Binding var otherCurrency: Currency
    
    @State var side : String
    @State var amountTemp = ""
    @State var typing = false
    @State var showSelectCurrency = false
    @State var showExchangeInfo = false
    
    var body: some View {
        VStack {
            // Currency
            HStack {
                if side == "leftCurrency" {
                    // Currency image
                    Image(CurrencyImage.allCases[Currency.allCases.firstIndex(of: currency)!].rawValue)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 33, height: 33)
                }
                
                // Currency text
                Text(CurrencyText.allCases[Currency.allCases.firstIndex(of: currency)!].rawValue)
                    .font(.headline)
                    .foregroundStyle(.white)
                
                if side == "rightCurrency" {
                    // Currency image
                    Image(CurrencyImage.allCases[Currency.allCases.firstIndex(of: currency)!].rawValue)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 33, height: 33)
                }
            }
            .padding(.bottom, -5)
            .onTapGesture {
                showSelectCurrency.toggle()
            }
            .sheet(isPresented: $showSelectCurrency, content: {
                SelectCurrency(leftCurrency: side == "leftCurrency" ? $currency : $otherCurrency, rightCurrency: side == "leftCurrency" ? $otherCurrency : $currency)
            })
            // Text Field
            TextField("Amount", text: $amount, onEditingChanged: {
                typing in
                self.typing = typing
                amountTemp = amount
            })
                .background(Color(UIColor.systemGray6))
                .padding(7)
                .cornerRadius(7)
                .multilineTextAlignment(side == "leftCurrency" ? .leading : .trailing)
                .keyboardType(.decimalPad)
                .onChange(of: typing ? amount : amountTemp, { oldValue, newValue in
                    otherAmount = currency.convert(amountString: amount, to: otherCurrency)
                })
                .onChange(of: currency) { oldValue, newValue in
                    amount = otherCurrency.convert(amountString: otherAmount, to: currency)
                    UserDefaults.standard.set(currency.rawValue, forKey: side)
                }
        }
    }
}

#Preview {
    ConversionSection(amount: .constant(""), otherAmount: .constant(""), currency: .constant(.silverPiece), otherCurrency: .constant(.goldPiece), side: "leftCurrency")
}
