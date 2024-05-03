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
    
    let countriesTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemBackground
        tableView.allowsSelection = true
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CountriesTableViewCell.self, forCellReuseIdentifier: CountriesTableViewCell.identifier)
        return tableView
    }()
    
    var countriesArray = [Country]()
    var viewModel = CountriesViewModel()
    let searchController = UISearchController(searchResultsController: nil)
    var filteredCountriesArray = [Country]()
    
    //MARK: ---Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
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

