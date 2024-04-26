//
//  MainVC.swift
//  Task20
//
//  Created by ana namgaladze on 21.04.24.
//Family: SF Pro Font names: ["SFPro-Regular", "SFPro-Ultralight", "SFPro-Thin", "SFPro-Light", "SFPro-Medium", "SFPro-Semibold", "SFPro-Bold", "SFPro-Heavy", "SFPro-Black"]

//import UIKit
//
//class MainVC: UIViewController {
//    //MARK: ---Properties
//    var countriesLabel: UILabel = {
//        var label = UILabel()
//        label.text = "Countries"
//        label.font = UIFont(name: "SFPro-Bold", size: 24)
//        label.textColor = .label
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//    
//    private let countriesTableView: UITableView = {
//        let tableView = UITableView()
//        tableView.backgroundColor = .systemBackground
//        tableView.allowsSelection = true
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//        tableView.register(CountriesTableViewCell.self, forCellReuseIdentifier: CountriesTableViewCell.identifier)
//        return tableView
//    }()
//    var countriesArray = [Country]()
//    
//    //MARK: ---Lifecycle
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        addTitle()
//        addTableView()
//        getData()
//    }
//    
//    
//    //MARK: ---Methods
//    func addTitle() {
//        view.addSubview(countriesLabel)
//        NSLayoutConstraint.activate([
//            countriesLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 66),
//            countriesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
//            countriesLabel.widthAnchor.constraint(equalToConstant: 110),
//            countriesLabel.heightAnchor.constraint(equalToConstant: 29)
//        ])
//    }
//    
//    func addTableView() {
//        self.view.addSubview(countriesTableView)
//        
//        NSLayoutConstraint.activate([
//            countriesTableView.topAnchor.constraint(equalTo: countriesLabel.bottomAnchor,constant: 14),
//            countriesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 21),
//            countriesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -27),
//            countriesTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -2),
//        ])
//        
//        countriesTableView.rowHeight = 50
//        countriesTableView.dataSource = self
//        countriesTableView.delegate = self
//        
//    }
//    
//    func getData() {
//        let urlString = "https://restcountries.com/v3.1/all#"
//        guard let url = URL(string: urlString) else {
//            print("Invalid URL")
//            return
//        }
//        
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            if let error = error {
//                print("Error fetching data:", error)
//                return
//            }
//            
//            guard let data = data else {
//                print("No data received")
//                return
//            }
//            
//            do {
//                let responseData = try JSONDecoder().decode([Country].self, from: data)
//                DispatchQueue.main.async {
//                    self.countriesArray = responseData
//                    self.countriesTableView.reloadData()
//                }
//                
//            } catch {
//                print("Error decoding JSON:", error)
//            }
//        }.resume()
//    }
//}
//
//extension MainVC: UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        1
//        
//    }
//    func numberOfSections(in tableView: UITableView) -> Int {
//        countriesArray.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: CountriesTableViewCell.identifier, for: indexPath) as? CountriesTableViewCell
//        else {
//            fatalError("error") }
//        cell.configure(image: countriesArray[indexPath.section].flags?.png, name: countriesArray[indexPath.section].name?.common)
//        return cell
//    }
//    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 1
//    }
//    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let headerView = UIView()
//        headerView.backgroundColor = .clear
//        return headerView
//    }
//    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//        let country = countriesArray[indexPath.section]
//        let detailVC = DetailsVC()
//        detailVC.modalPresentationStyle = .fullScreen
//        detailVC.selectedCountry = country
//        
//        navigationController?.navigationBar.prefersLargeTitles = false
//        detailVC.navigationItem.title = country.name?.common
//        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.darkGray]
//        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
//        navigationController?.navigationBar.tintColor = UIColor.darkGray
//        self.navigationController?.pushViewController(detailVC, animated: false)
//        
//    }
//    
//    
//}

import UIKit

class MainVC: UIViewController {

    //MARK: ---Properties
    private let countriesTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemBackground
        tableView.allowsSelection = true
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.register(CountriesTableViewCell.self, forCellReuseIdentifier: CountriesTableViewCell.identifier)
        return tableView
    }()
    
    let searchController = UISearchController(searchResultsController: nil)
    var filteredCountriesArray = [Country]()
    
    var countriesArray = [Country]()
    
    //MARK: ---Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addTableView()
        setupSearchBar()
        fetchData()
    }
    
    
    //MARK: ---Methods
    
    func addTableView() {
        self.view.addSubview(countriesTableView)
        
        NSLayoutConstraint.activate([
            countriesTableView.topAnchor.constraint(equalTo: view.topAnchor),
            countriesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            countriesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            countriesTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
//        countriesTableView.rowHeight = 50
        countriesTableView.dataSource = self
        countriesTableView.delegate = self
    }
    

    func setupSearchBar() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.title = "Countries"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    func fetchData() {
        Networking.fetchData { [weak self] countries, error in
            guard let self = self else { return }
            if let error = error {
                print("Error fetching data:", error)
                return
            }

            if let countries = countries {
                DispatchQueue.main.async {
                    self.countriesArray = countries
                    self.countriesTableView.reloadData()
                }
            }
        }
    }

}

extension MainVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchController.isActive ? filteredCountriesArray.count : countriesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CountriesTableViewCell.identifier, for: indexPath) as? CountriesTableViewCell
        else {
            fatalError("error") }
        
        let country = searchController.isActive ? filteredCountriesArray[indexPath.row] : countriesArray[indexPath.row]
        cell.configure(image: country.flags?.png, name: country.name?.common)
        return cell
    }
    
    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 1
//    }
//    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let headerView = UIView()
//        headerView.backgroundColor = .clear
//        return headerView
//    }
//    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let country = searchController.isActive ? filteredCountriesArray[indexPath.row] : countriesArray[indexPath.row]
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


extension MainVC: UISearchResultsUpdating {
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

