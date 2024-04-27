//
//  CountryDetailsModel.swift
//  Task21
//
//  Created by ana namgaladze on 26.04.24.
//

import UIKit


class CountryDetailsModel {
    // MARK: - Properties
    var flagImage: String?
    var nativeName: String?
    var flagInfoTextView: String?
    var capital: String?
    var currency: String?
    var googleMapsLink: String?
    var openStreetMapsLink: String?
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
        
        self.googleMapsLink = country.maps?.googleMaps
        self.openStreetMapsLink = country.maps?.openStreetMaps
    }
    
    // MARK: - Button Actions
    
    func googleMapButtonTapped() {
        if let googleMapsLink = googleMapsLink, let url = URL(string: googleMapsLink) {
            UIApplication.shared.open(url)
        }
        
    }
    
    func streetMapButtonTapped() {
        if let openStreetMapsLink = openStreetMapsLink, let url = URL(string: openStreetMapsLink) {
            UIApplication.shared.open(url)
            
        }
    }
    
}
