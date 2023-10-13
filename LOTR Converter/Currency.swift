//
//  CurrencyModel.swift
//  LOTR Converter
//
//  Created by David Laczkovits on 08.10.23.
//

import Foundation

enum Currency: Double, CaseIterable {
    case copperPenny = 640
    case silverPenny = 64
    case silverPiece = 16
    case goldPenny = 4
    case goldPiece = 1
    case euro = 0.1
    
    func convert(amountString: String, to currency: Currency) -> String {
        guard let startAmount = Double(amountString) else {
            return ""
        }
        let convertedAmount = startAmount / self.rawValue * currency.rawValue
        
        if convertedAmount > 0 {
            return String(format: "%.2f", convertedAmount)
        } else {
            return ""
        }
    }
    
    func storeData(currency: Currency, key: String) -> Bool {
        do {
            let encodedData = try NSKeyedArchiver.archivedData(withRootObject: currency, requiringSecureCoding: false)
            let userDefaults = UserDefaults.standard
            if key == "leftCurrency" {
                userDefaults.set(encodedData, forKey: "leftCurrency")
            } else {
                userDefaults.set(encodedData, forKey: "rightCurrency")
            }
            return true
        } catch {
            print(error)
            return false
        }
    }
    
    func getData(key: String) -> Currency? {
        var currencyAny : Any
        if key == "leftCurrency" {
            currencyAny = UserDefaults.standard.object(forKey: "leftCurrency")!
        } else {
            currencyAny = UserDefaults.standard.object(forKey: "rightCurrency")!
        }
        
        if let currency = currencyAny as? Currency {
            return currency
        }
        return nil
    }
}

enum CurrencyText: String, CaseIterable {
    case copperPenny = "Copper Penny"
    case silverPenny = "Silver Penny"
    case silverPiece = "Silver Piece"
    case goldPenny = "Gold Penny"
    case goldPiece = "Gold Piece"
    case euro = "Euro"
}

enum CurrencyImage:String, CaseIterable {
    case copperPenny = "copperpenny"
    case silverPenny = "silverpenny"
    case silverPiece = "silverpiece"
    case goldPenny = "goldpenny"
    case goldPiece = "goldpiece"
    case euro = "euro"
}
