//
//  CountriesViewController.swift
//  Task21
//
//  Created by ana namgaladze on 25.04.24.
//

import UIKit

class CountriesViewController: UIViewController {
    //MARK: ---Properties
    var countriesLabel: UILabel = {
        var label = UILabel()
        label.text = "Countries"
        label.font = UIFont(name: "SFPro-Bold", size: 24)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let countriesTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemBackground
        tableView.allowsSelection = true
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CountriesTableViewCell.self, forCellReuseIdentifier: CountriesTableViewCell.identifier)
        return tableView
    }()
    
    private var countriesArray = [Country]()
    var viewModel = CountriesViewModel()
    let searchController = UISearchController(searchResultsController: nil)
    var filteredCountriesArray = [Country]()
    
    //MARK: ---Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Countries"
        navigationController?.navigationBar.prefersLargeTitles = true
        setupSearchBar()
        addTableView()
        viewModel.delegate = self
        viewModel.fetchCountries()
        updateTrait()
    }
    
    
    //MARK: ---Methods
    
    func addTableView() {
        self.view.addSubview(countriesTableView)
        
        NSLayoutConstraint.activate([
            countriesTableView.topAnchor.constraint(equalTo: view.topAnchor),
            countriesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 21),
            countriesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -27),
            countriesTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -2),
        ])
        
        countriesTableView.dataSource = self
        countriesTableView.delegate = self
        
    }
    
    func setupSearchBar() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    func updateTrait() {
        registerForTraitChanges([UITraitUserInterfaceStyle.self], handler: { (self: Self, previousTraitCollection: UITraitCollection) in
            if self.traitCollection.userInterfaceStyle == .light {
                self.countriesTableView.reloadData()
            } else {
                self.countriesTableView.reloadData()
            }
        })
    }
    
}

// MARK: - CountriesViewModelDelegate
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


extension CountriesViewController: UITableViewDelegate, UITableViewDataSource {
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let country = searchController.isActive ? filteredCountriesArray[indexPath.row] : countriesArray[indexPath.row]
        viewModel.didSelectRow(country: country )
    }
    
}

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
