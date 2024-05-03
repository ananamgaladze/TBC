//
//  CountriesVCExtensions.swift
//  Task21
//
//  Created by ana namgaladze on 28.04.24.
//

import UIKit

// MARK: --- CountriesViewModelDelegate
extension CountriesViewController: CountriesViewModelDelegate {
    
    func countriesFetched(_ countries: [Country]) {
        self.countriesArray = countries
        DispatchQueue.main.async {
            self.countriesTableView.reloadData()
        }
    }
    
    func navigateToDetailsVC(country: Country) {
        let detailVC = DetailsVC()
        detailVC.modalPresentationStyle = .fullScreen
        detailVC.selectedCountry = country
        
        navigationController?.navigationBar.prefersLargeTitles = false
        detailVC.navigationItem.title = country.name?.common
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.darkGray]
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.tintColor = UIColor.darkGray
        self.navigationController?.pushViewController(detailVC, animated: false)
    }
}

//MARK: --- UITableViewDataSource
extension CountriesViewController:  UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        searchController.isActive ? filteredCountriesArray.count : countriesArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CountriesTableViewCell.identifier, for: indexPath) as? CountriesTableViewCell
        else {
            fatalError("error") }
        
        let country = searchController.isActive ? filteredCountriesArray[indexPath.row] : countriesArray[indexPath.row]
        cell.configure(image: country.flags?.png, name: country.name?.common)
        return cell
    }
    
}

//MARK: ---UITableViewDelegate
extension CountriesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let country = searchController.isActive ? filteredCountriesArray[indexPath.row] : countriesArray[indexPath.row]
        viewModel.didSelectRow(country: country)
    }
}

//MARK: ---extension: UISearchResultsUpdating
extension CountriesViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text, !searchText.isEmpty else {
            filteredCountriesArray.removeAll()
            countriesTableView.reloadData()
            return
        }
        
        filteredCountriesArray = countriesArray.filter { country in
            if let countryName = country.name?.common {
                return countryName.lowercased().contains(searchText.lowercased())
            } else {
                return false
            }
        }
        countriesTableView.reloadData()
    }
}
