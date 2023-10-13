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
    
    @State var leftCurrency: Currency = .silverPiece
    @State var rightCurrency: Currency = .goldPiece
    
    @State var showSelectCurrency = false
    @State var showExchangeInfo = false
    
    @State var leftAmountTemp = ""
    @State var rightAmountTemp = ""
    @State var leftTiping = false
    @State var rightTiping = false
    
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
                    
                    VStack {
                        // Currency
                        HStack {
                            // Currency image
                            Image(CurrencyImage.allCases[Currency.allCases.firstIndex(of: leftCurrency)!].rawValue)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 33, height: 33)
                            // Currency text
                            Text(CurrencyText.allCases[Currency.allCases.firstIndex(of: leftCurrency)!].rawValue)
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                        .padding(.bottom, -5)
                        .onTapGesture {
                            showSelectCurrency.toggle()
                        }
                        .sheet(isPresented: $showSelectCurrency, content: {
                            SelectCurrency(leftCurrency: $leftCurrency, rightCurrency: $rightCurrency)
                        })
                        // Text Field
                        TextField("Amount", text: $leftAmount, onEditingChanged: {
                            tiping in
                            leftTiping = tiping
                            leftAmountTemp = leftAmount
                        })
                            .background(Color(UIColor.systemGray6))
                            .padding(7)
                            .cornerRadius(7)
                            .keyboardType(.decimalPad)
                            .onChange(of: leftTiping ? leftAmount : leftAmountTemp, { oldValue, newValue in
                                rightAmount = leftCurrency.convert(amountString: leftAmount, to: rightCurrency)
                            })
                            .onChange(of: leftCurrency) { oldValue, newValue in
                                leftAmount = rightCurrency.convert(amountString: rightAmount, to: leftCurrency)
                            }
                    }
                    Spacer()
                    
                    // Equal sign
                    Image(systemName: "equal")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                    
                    Spacer()
                    
                    // Right conversion section
                
                    VStack {
                        // Currency
                        HStack {
                            // Currency text
                            Text(CurrencyText.allCases[Currency.allCases.firstIndex(of: rightCurrency)!].rawValue)
                                .font(.headline)
                                .foregroundStyle(.white)
                            
                            // Currency image
                            Image(CurrencyImage.allCases[Currency.allCases.firstIndex(of: rightCurrency)!].rawValue)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 33, height: 33)
                            
                        }
                        .padding(.bottom, -5)
                        .onTapGesture {
                            showSelectCurrency.toggle()
                        }
                        .sheet(isPresented: $showSelectCurrency, content: {
                            SelectCurrency(leftCurrency: $leftCurrency, rightCurrency: $rightCurrency)
                        })
                        
                        // Text Field
                        TextField("Amount", text: $rightAmount)
                            .background(Color(UIColor.systemGray6))
                            .padding(7)
                            .cornerRadius(7)
                            .multilineTextAlignment(.trailing)
                            .keyboardType(.decimalPad)
                            .onChange(of: rightTiping ? rightAmount : rightAmountTemp, { oldValue, newValue in
                                leftAmount = rightCurrency.convert(amountString: rightAmount, to: leftCurrency)
                            })
                            .onChange(of: rightCurrency) { oldValue, newValue in
                                rightAmount = leftCurrency.convert(amountString: leftAmount, to: rightCurrency)
                            }
                        
                    }
                    
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
