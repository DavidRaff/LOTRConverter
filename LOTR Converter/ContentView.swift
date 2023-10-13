//
//  ContentView.swift
//  LOTR Converter
//
//  Created by David Laczkovits on 08.10.23.
//

import SwiftUI

struct ContentView: View {
    
    @State var leftAmount : String = ""
    @State var rightAmount : String = ""
    
    @State var leftCurrency: Currency = Currency(rawValue: UserDefaults.standard.double(forKey: "leftCurrency")) ?? .silverPiece
    @State var rightCurrency: Currency = Currency(rawValue: UserDefaults.standard.double(forKey: "rightCurrency")) ?? .goldPiece
    
    @State var showSelectCurrency = false
    @State var showExchangeInfo = false
    
//    @State var leftAmountTemp = ""
//    @State var rightAmountTemp = ""
//    @State var leftTiping = false
//    @State var rightTiping = false
    
    var body: some View {
        ZStack {
            // Background
            Image(.background)
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                // Image
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                

                
                // Currency Text
                Text("Currency Exchange")
                    .foregroundStyle(.white)
                    .font(.largeTitle)
                

                
                // Currency conversion section
                HStack {
                    // Left conversion section
                    
                    ConversionSection(amount: $leftAmount, otherAmount: $rightAmount, currency: $leftCurrency, otherCurrency: $rightCurrency)
                    
                    Spacer()
                    
                    // Equal sign
                    Image(systemName: "equal")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                    
                    Spacer()
                    
                    // Right conversion section
                    
                    ConversionSection(amount: $rightAmount, otherAmount: $leftAmount, currency: $rightCurrency, otherCurrency: $leftCurrency)
                    
                }
                .padding()
                .background(.black.opacity(0.5))
                .cornerRadius(50)
                
                Spacer()
                // Info Stack
                HStack {
                    Spacer()
                    
                    Button {
                        // Display exchange
                        showExchangeInfo.toggle()
                    } label: {
                        Image(systemName: "info.circle.fill")
                    }
                    .foregroundStyle(.white)
                    .font(.largeTitle)
                    .padding(.trailing)
                    .sheet(isPresented: $showExchangeInfo) {
                        ExchangeInfo()
                    }
                }
                
            }
        }
//        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
