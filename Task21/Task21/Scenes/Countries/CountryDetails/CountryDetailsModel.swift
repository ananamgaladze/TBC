//
//  CountryDetailsModel.swift
//  Task21
//
//  Created by ana namgaladze on 26.04.24.
//

import Foundation


class CountryDetailsModel {
    // MARK: - Properties
    var flagImage: String?
    var nativeName: String?
    var flagInfoTextView: String?
    var capital: String?
    var currency: String?
    var spelling: String?
    var neighbors: String?
    
    // MARK: - Initialization
    init(country: Country) {
        self.flagImage = country.flags?.png
        self.nativeName = country.name?.common
        self.flagInfoTextView = country.flags?.alt
        self.capital = country.capital?.first
        self.spelling = country.name?.official
        if let currency = country.currencies, let firstCurrencyKey = currency.keys.first {
            if let currency = currency[firstCurrencyKey] {
                self.currency = currency.symbol
            }
        } 
        self.neighbors = country.borders?.joined(separator: ", ")
    }
    
  
    
}
