//
//  ExchangeInfo.swift
//  LOTR Converter
//
//  Created by David Laczkovits on 08.10.23.
//

import SwiftUI

struct ExchangeInfo: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            // Background Image : parchment
            Image(.parchment)
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .background(.brown)
            
            VStack {
                // Title Text
                Text("Exchange Rate")
                    .font(.largeTitle)
                // Body Text
                Text("Here at the Prancing Pony, we are happy to offer you a place where you can exchange all the known currencies in the entire world except one. We used to take Brandy Bucks, but after finding out that it was a person instead of a piece of paper, we realized it had no value to us. Below is a simple guide to our currency exchange rates:")
                    .font(.title2)
                    .padding()
                
                // Exchange Rates
                ExchangeRate(leftImage: "goldpiece", stringField: "1 Gold Piece = 4 Gold Pennies", rightImage: "goldpenny")
                ExchangeRate(leftImage: "goldpenny", stringField: "1 Gold Penny = 4 Silver Pieces", rightImage: "silverpiece")
                ExchangeRate(leftImage: "silverpiece", stringField: "1 Silver Piece = 4 Silver Pennies", rightImage: "silverpenny")
                ExchangeRate(leftImage: "silverpenny", stringField: "1 Silver Penny = 100 Copper Pennies", rightImage: "copperpenny")
                
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
            .foregroundColor(.black)
        }
    }
}

#Preview {
    ExchangeInfo()
    
}
