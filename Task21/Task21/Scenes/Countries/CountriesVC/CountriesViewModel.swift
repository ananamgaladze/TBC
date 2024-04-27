//
//  CountriesViewModel.swift
//  Task21
//
//  Created by ana namgaladze on 25.04.24.
//

import UIKit

protocol CountriesViewModelDelegate: AnyObject {
    func countriesFetched(_ countries: [Country])
    func navigateToDetailsVC(country: Country)
}



class CountriesViewModel {
    weak var delegate: CountriesViewModelDelegate?
    private var countriesArray: [Country] = []
    
    func didSelectRow( country: Country ) {
        delegate?.navigateToDetailsVC(country: country)
    }
    
    func fetchCountries() {
        Networking.fetchData { [weak self] countries, error in
            guard let self = self else { return }

            if let error = error {
                print("Error fetching data:", error)
                return
            }

            if let countries = countries {
                self.countriesArray = countries
                self.delegate?.countriesFetched(countries)
            }
        }
    }
}

