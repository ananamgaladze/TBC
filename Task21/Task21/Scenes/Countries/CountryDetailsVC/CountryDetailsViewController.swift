//
//  CountryDetailsVC.swift
//  Task21
//
//  Created by ana namgaladze on 25.04.24.
//

import UIKit

class DetailsVC: UIViewController {
    var viewModel: CountryDetailsModel?
    var selectedCountry: Country?
    
    private let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.backgroundColor = .systemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var flagImageContainer: UIView = {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOpacity = 0.5
        containerView.layer.shadowOffset = CGSize(width: 0, height: 4)
        containerView.layer.shadowRadius = 4
        containerView.layer.cornerRadius = 30
        return containerView
    }()
    
    lazy var flagImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "testImage"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 30
        image.layer.masksToBounds = true
        return image
    }()
    
    let countriesLabel = UILabel.makeLabel(text: "About the flag:")
    
    lazy var flagInfoTextView: UITextView = {
        let textView = UITextView()
        textView.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed consequat, turpis ut laoreet ullamcorper, lectus est posuere libero, ac varius sem felis nec libero. Fusce a risus at risus tincidunt hendrerit. Ut ut libero in magna venenatis ultricies. Aliquam in justo enim. Morbi et eros ut justo ultrices dapibus id at nunc. Curabitur sed ipsum nec nulla vehicula rhoncus. Integer ultricies consequat est, a accumsan risus consequat id. Suspendisse potenti. Donec id nisl luctus, tincidunt est sed, rutrum risus. Nulla facilisi. Sed eget felis volutpat, bibendum tortor id, volutpat est. Vivamus ac tortor varius, fringilla neque in, cursus eros. Mauris pretium eleifend nunc id lobortis. Curabitur dignissim nunc eros, vel pharetra ex commodo eu. Nam nec ex enim. Quisque nec enim dictum, venenatis tortor sed, dapibus magna. Nullam eleifend libero nec nisl lacinia, sed tempor sapien feugiat. Aliquam erat volutpat. Integer id purus ac justo lacinia consectetur non sit amet ex. Sed dignissim sapien"
        textView.font = UIFont(name: "SFPro-Regular", size: 14)
        textView.isEditable = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    let decorativeLine = UIView.decorativeLine
    let basicInfoLabel = UILabel.makeLabel(text: "Basic information:")
    
    let nativeNameLabel = UILabel.makeInfoLabel(text: "Native name:")
    let nativeName = UILabel.makeInfoLabel(text: "საქართველო")
    let spellingLabel = UILabel.makeInfoLabel(text: "Official name:")
    let spelling = UILabel.makeInfoLabel(text: "Sakartvelo")
    
    let capitalLabel = UILabel.makeInfoLabel(text: "Capital:")
    let capital = UILabel.makeInfoLabel(text: "Tbilisi")
    
    let currencyNameLabel = UILabel.makeInfoLabel(text: "Currency:")
    let currency = UILabel.makeInfoLabel(text: "Lari, ₾")
    
    let regionNameLabel = UILabel.makeInfoLabel(text: "Region:")
    let region = UILabel.makeInfoLabel(text: "ევროპაა")
    
    let neighborsNameLabel = UILabel.makeInfoLabel(text: "Neighbors:")
    let neighbors = UILabel.makeInfoLabel(text: "ARM, AZE, TUR")
    
    let decorativeLine1 = UIView.decorativeLine
    
    let LinksLabel = UILabel.makeLabel(text: "Useful links:")
    
    let streetMapButton = UIButton.circularButton(withImage: UIImage(named: "streetMapImage"))
    let googleMapButton = UIButton.circularButton(withImage: UIImage(named: "googleMapImage"))
    
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let selectedCountry = selectedCountry else {
            print("error")
            return
        }
        viewModel = CountryDetailsModel(country: selectedCountry)
        setupUI()
        constraints()
        changedData()
        configureStreetMapButton()
        configureGoogleMapButton()
        
    }
    
    private func setupUI() {
        
        self.view.addSubview(scrollView)
        self.scrollView.addSubview(contentView)
        self.view.addSubview(flagImageContainer)
        flagImageContainer.addSubview(flagImage)
        self.view.addSubview(countriesLabel)
        self.view.addSubview(flagInfoTextView)
        self.view.addSubview(decorativeLine)
        
        self.view.addSubview(basicInfoLabel)
        
        self.view.addSubview(nativeNameLabel)
        self.view.addSubview(separatorView)
        self.view.addSubview(spellingLabel)
        self.view.addSubview(capitalLabel)
        self.view.addSubview(currencyNameLabel)
        self.view.addSubview(neighborsNameLabel)
        
        self.view.addSubview(nativeName)
        self.view.addSubview(spelling)
        self.view.addSubview(capital)
        self.view.addSubview(currency)
        self.view.addSubview(neighbors)
        
        self.view.addSubview(decorativeLine1)
        self.view.addSubview(LinksLabel)
        self.view.addSubview(streetMapButton)
        self.view.addSubview(googleMapButton)
    }
    
    func constraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: self.scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor,constant: 10),
            contentView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor,constant: -10),
            contentView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor,constant: -20),
            contentView.heightAnchor.constraint(greaterThanOrEqualTo: scrollView.heightAnchor, multiplier: 1.3),
            
            flagImageContainer.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            flagImageContainer.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            flagImageContainer.widthAnchor.constraint(equalToConstant: 343),
            flagImageContainer.heightAnchor.constraint(equalToConstant: 228),
            
            flagImage.topAnchor.constraint(equalTo: flagImageContainer.topAnchor),
            flagImage.leadingAnchor.constraint(equalTo: flagImageContainer.leadingAnchor),
            flagImage.trailingAnchor.constraint(equalTo: flagImageContainer.trailingAnchor),
            flagImage.bottomAnchor.constraint(equalTo: flagImageContainer.bottomAnchor),
            
            countriesLabel.topAnchor.constraint(equalTo: flagImage.bottomAnchor, constant: 25),
            countriesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            
            flagInfoTextView.topAnchor.constraint(equalTo: countriesLabel.bottomAnchor, constant: 15),
            flagInfoTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            flagInfoTextView.heightAnchor.constraint(equalToConstant: 85),
            flagInfoTextView.widthAnchor.constraint(equalToConstant: 325),
            
            
            decorativeLine.topAnchor.constraint(equalTo: flagInfoTextView.bottomAnchor, constant: 20),
            decorativeLine.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            basicInfoLabel.topAnchor.constraint(equalTo: decorativeLine.bottomAnchor, constant: 24),
            basicInfoLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            
            nativeNameLabel.topAnchor.constraint(equalTo: basicInfoLabel.bottomAnchor, constant: 15),
            nativeNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 24),
            
            spellingLabel.topAnchor.constraint(equalTo: nativeNameLabel.bottomAnchor, constant: 15),
            spellingLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 24),
            
            capitalLabel.topAnchor.constraint(equalTo: spellingLabel.bottomAnchor, constant: 15),
            capitalLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 24),
            
            currencyNameLabel.topAnchor.constraint(equalTo: capitalLabel.bottomAnchor, constant: 15),
            currencyNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 24),
            
            neighborsNameLabel.topAnchor.constraint(equalTo: currencyNameLabel.bottomAnchor, constant: 15),
            neighborsNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 24),
            
            
            nativeName.topAnchor.constraint(equalTo: basicInfoLabel.bottomAnchor, constant: 15),
            nativeName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -24 ),
            spelling.topAnchor.constraint(equalTo: nativeName.bottomAnchor, constant: 15),
            spelling.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -24 ),
            
            capital.topAnchor.constraint(equalTo: spelling.bottomAnchor, constant: 15),
            capital.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -24 ),
            
            currency.topAnchor.constraint(equalTo: capital.bottomAnchor, constant: 15),
            currency.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -24 ),
            
            neighbors.topAnchor.constraint(equalTo: currency.bottomAnchor, constant: 15),
            neighbors.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -24 ),
            neighbors.widthAnchor.constraint(equalToConstant: 100),
            
            
            decorativeLine1.topAnchor.constraint(equalTo: neighbors.bottomAnchor, constant: 20),
            decorativeLine1.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            LinksLabel.topAnchor.constraint(equalTo: decorativeLine1.bottomAnchor, constant: 24),
            LinksLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25),
            
            streetMapButton.topAnchor.constraint(equalTo: LinksLabel.bottomAnchor, constant: 15),
            streetMapButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 94),
            
            googleMapButton.topAnchor.constraint(equalTo: LinksLabel.bottomAnchor, constant: 15),
            googleMapButton.leadingAnchor.constraint(equalTo: streetMapButton.trailingAnchor, constant: 87),
        ])
        
        
    }
    
    func configureStreetMapButton() {
        streetMapButton.addAction(UIAction(handler: { [weak self] _ in
            self?.viewModel?.streetMapButtonTapped()
        }), for: .touchUpInside)
    }
    
    func configureGoogleMapButton() {
        googleMapButton.addAction(UIAction(handler: { [weak self] _ in
            self?.viewModel?.googleMapButtonTapped()
        }), for: .touchUpInside)
    }
    
    private func changedData() {
        guard let selectedCountryItem = selectedCountry else { return }
        flagInfoTextView.text = selectedCountryItem.flags?.alt ?? "ინფორმაციის უგარეშოდ"
        nativeName.text = selectedCountryItem.name?.common
        capital.text = selectedCountryItem.capital?.first ?? ""
        spelling.text = selectedCountryItem.name?.official
        if let currencyDict = selectedCountryItem.currencies?.first {
            let currencyD = currencyDict.value
            let currencyInfo = "\(currencyD.name ?? ""),\(currencyD.symbol ?? "")"
            currency.text = currencyInfo
        } else {
            currency.text = "No currency information"
        }
        
        neighbors.text = selectedCountryItem.borders?.joined(separator: ", ") ?? " მეზობლის უგარეშოდ"
        
        if let imageUrl = URL(string: selectedCountry?.flags?.png ?? "testImage") {
            URLSession.shared.dataTask(with: imageUrl) { data, response, error in
                if let data = data, let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.flagImage.image = image
                    }
                }
            }.resume()
        }
        
    }
    
}





