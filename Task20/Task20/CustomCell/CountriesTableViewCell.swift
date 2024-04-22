//
//  CountriesTableViewCell.swift
//  Task20
//
//  Created by ana namgaladze on 21.04.24.
//

import UIKit

class CountriesTableViewCell: UITableViewCell {
    static let identifier = "CountriesTableViewCell"

    lazy var FlagImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "testImage")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: "SFPro-Regular", size: 14)
        label.textAlignment = .right
        label.text = "Georgia"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = .white
        clipsToBounds = true
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
        layer.cornerRadius = 25
        accessoryType = .disclosureIndicator
        
        contentView.addSubview(FlagImageView)
        contentView.addSubview(nameLabel)
        NSLayoutConstraint.activate([
            FlagImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            FlagImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            FlagImageView.heightAnchor.constraint(equalToConstant: 20),
            FlagImageView.widthAnchor.constraint(equalToConstant: 30),
            
            
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
        ])
    }
    
    public func configure(image: String?, name: String?){
        nameLabel.text = name
        if let image = URL(string: image ?? "") {
            loadImage(url: image)
        }
        
    }
    func loadImage(url: URL) {
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data, let image = UIImage(data: data), error == nil else {
                print("Error loading image: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            DispatchQueue.main.async {
                self?.FlagImageView.image = image
            }
        }.resume()
    }
    
}
