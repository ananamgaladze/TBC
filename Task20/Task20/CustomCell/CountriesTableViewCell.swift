//
//  CountriesTableViewCell.swift
//  Task20
//
//  Created by ana namgaladze on 21.04.24.
//

//import UIKit
//
//class CountriesTableViewCell: UITableViewCell {
//    static let identifier = "CountriesTableViewCell"
//    
//    lazy var rectangleView: UIView = {
//        let view = UIView()
//        view.backgroundColor = .clear
//        view.layer.borderColor = UIColor.darkGray.cgColor
//        view.layer.cornerRadius = 15
//        view.layer.borderWidth = 1
//        view.layer.masksToBounds = true
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
//    
//    lazy var flagImageView: UIImageView = {
//        let image = UIImageView()
//        image.contentMode = .scaleAspectFit
//        image.image = UIImage(named: "testImage")
//        image.translatesAutoresizingMaskIntoConstraints = false
//        return image
//    }()
//    
//    lazy var nameLabel: UILabel = {
//        let label = UILabel()
//        label.textColor = .label
//        label.font = UIFont(name: "SFPro-Regular", size: 14)
//        label.textAlignment = .right
//        label.text = "Georgia"
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//    
//    lazy var arrowSymbol: UIImageView = {
//        let imageView = UIImageView()
//        imageView.tintColor = .label
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.image = UIImage(systemName: "chevron.right")
//        return imageView
//    }()
//    
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        self.setupUI()
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    private func setupUI() {
//        backgroundColor = .systemBackground
//        clipsToBounds = true
//        layer.borderWidth = 1
//        layer.borderColor = UIColor.systemBackground.cgColor
//        layer.cornerRadius = 30
////        accessoryType = .disclosureIndicator
//        contentView.addSubview(rectangleView)
//        rectangleView.addSubview(flagImageView)
//        rectangleView.addSubview(nameLabel)
//        rectangleView.addSubview(arrowSymbol)
//        NSLayoutConstraint.activate([
//                    rectangleView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
//                    rectangleView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
//                    rectangleView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
//                    rectangleView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
//                    rectangleView.heightAnchor.constraint(equalToConstant: 60),
//                    
//                    nameLabel.leadingAnchor.constraint(equalTo: rectangleView.leadingAnchor, constant: 10),
//                    nameLabel.centerYAnchor.constraint(equalTo: rectangleView.centerYAnchor),
//                    
//                    flagImageView.trailingAnchor.constraint(equalTo: arrowSymbol.leadingAnchor, constant: -10),
//                    flagImageView.centerYAnchor.constraint(equalTo: rectangleView.centerYAnchor),
//                    flagImageView.widthAnchor.constraint(equalToConstant: 30),
//                    flagImageView.heightAnchor.constraint(equalToConstant: 20),
//                    
//                    arrowSymbol.trailingAnchor.constraint(equalTo: rectangleView.trailingAnchor, constant: -10),
//                    arrowSymbol.centerYAnchor.constraint(equalTo: rectangleView.centerYAnchor)
//                ])
//        
////        NSLayoutConstraint.activate([
////            
////            rectangleView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
////            rectangleView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
////            rectangleView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
////            rectangleView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
////            rectangleView.heightAnchor.constraint(equalToConstant: 60),
////            
////            flagImageView.topAnchor.constraint(equalTo: rectangleView.topAnchor, constant: 3),
////            flagImageView.leadingAnchor.constraint(equalTo: rectangleView.leadingAnchor, constant: 24),
////            flagImageView.heightAnchor.constraint(equalToConstant: 20),
////            flagImageView.widthAnchor.constraint(equalToConstant: 30),
////            
////            
////            nameLabel.topAnchor.constraint(equalTo: rectangleView.topAnchor, constant: 15),
////            nameLabel.trailingAnchor.constraint(equalTo: rectangleView.trailingAnchor, constant: -15),
////            nameLabel.bottomAnchor.constraint(equalTo: rectangleView.bottomAnchor, constant: -16),
////        ])
//    }
//    
//    public func configure(image: String?, name: String?){
//        nameLabel.text = name
//        if let image = URL(string: image ?? "") {
//            loadImage(url: image)
//        }
//        
//    }
//    func loadImage(url: URL) {
//        
//        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
//            guard let data = data, let image = UIImage(data: data), error == nil else {
//                print("Error loading image: \(error?.localizedDescription ?? "Unknown error")")
//                return
//            }
//            DispatchQueue.main.async {
//                self?.flagImageView.image = image
//            }
//        }.resume()
//    }
//    
//}

import UIKit
 
class CountriesTableViewCell: UITableViewCell {
    static let identifier = "CountriesTableViewCell"
    
//    var viewModel: CountryCellViewModel? {
//        didSet {
//            configure()
//        }
//    }
    
    // MARK: - UI Components
    lazy var rectangleView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 30
        view.layer.borderWidth = 1
        view.backgroundColor = .systemBackground
        view.layer.borderColor = UIColor.label.cgColor
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var flagImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFPro-Regular", size: 14)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var arrowSymbol: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.right")
        imageView.tintColor = .label
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup UI
    
    private func setupUI() {
        addSubview(rectangleView)
        rectangleView.addSubview(nameLabel)
        rectangleView.addSubview(flagImageView)
        rectangleView.addSubview(arrowSymbol)
        
        NSLayoutConstraint.activate([
            rectangleView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            rectangleView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            rectangleView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            rectangleView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            rectangleView.heightAnchor.constraint(equalToConstant: 60),
            
            nameLabel.leadingAnchor.constraint(equalTo: rectangleView.leadingAnchor, constant: 10),
            nameLabel.centerYAnchor.constraint(equalTo: rectangleView.centerYAnchor),
            
            flagImageView.trailingAnchor.constraint(equalTo: arrowSymbol.leadingAnchor, constant: -10),
            flagImageView.centerYAnchor.constraint(equalTo: rectangleView.centerYAnchor),
            flagImageView.widthAnchor.constraint(equalToConstant: 30),
            flagImageView.heightAnchor.constraint(equalToConstant: 20),
            
            arrowSymbol.trailingAnchor.constraint(equalTo: rectangleView.trailingAnchor, constant: -10),
            arrowSymbol.centerYAnchor.constraint(equalTo: rectangleView.centerYAnchor)
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        rectangleView.layer.cornerRadius = 30
        rectangleView.layer.borderWidth = 1
        rectangleView.clipsToBounds = true
        rectangleView.layer.borderColor = UIColor.label.cgColor
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
                self?.flagImageView.image = image
            }
        }.resume()
    }
    
    
}
//import UIKit
//
//class CountriesTableViewCell: UITableViewCell {
//    static let identifier = "CountriesCell"
//    
//
//    
//    // MARK: - UI Components
//    lazy var rectangleView: UIView = {
//        let view = UIView()
//        view.backgroundColor = .white
//        view.layer.cornerRadius = 30
//        view.layer.borderWidth = 1
//        view.backgroundColor = UIColor(named: "backgroundColor")
//        view.layer.borderColor = UIColor(named: "labelColor")?.cgColor
//        view.layer.masksToBounds = true
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
//    
//    lazy var flagImageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.contentMode = .scaleAspectFill
//        imageView.clipsToBounds = true
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        return imageView
//    }()
//    
//    lazy var nameLabel: UILabel = {
//        let label = UILabel()
//        label.font = UIFont.boldSystemFont(ofSize: 16)
//        label.textColor = .label
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//    
//    lazy var arrowSymbol: UIImageView = {
//        let imageView = UIImageView()
//        imageView.image = UIImage(systemName: "chevron.right")
//        imageView.tintColor = .label
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        return imageView
//    }()
//    
//    // MARK: - Initialization
//    
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        setupUI()
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    // MARK: - Setup UI
//    
//    private func setupUI() {
//        addSubview(rectangleView)
//        rectangleView.addSubview(nameLabel)
//        rectangleView.addSubview(flagImageView)
//        rectangleView.addSubview(arrowSymbol)
//        
//        NSLayoutConstraint.activate([
//            rectangleView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
//            rectangleView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
//            rectangleView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
//            rectangleView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
//            rectangleView.heightAnchor.constraint(equalToConstant: 60),
//            
//            nameLabel.leadingAnchor.constraint(equalTo: rectangleView.leadingAnchor, constant: 10),
//            nameLabel.centerYAnchor.constraint(equalTo: rectangleView.centerYAnchor),
//            
//            flagImageView.trailingAnchor.constraint(equalTo: arrowSymbol.leadingAnchor, constant: -10),
//            flagImageView.centerYAnchor.constraint(equalTo: rectangleView.centerYAnchor),
//            flagImageView.widthAnchor.constraint(equalToConstant: 30),
//            flagImageView.heightAnchor.constraint(equalToConstant: 20),
//            
//            arrowSymbol.trailingAnchor.constraint(equalTo: rectangleView.trailingAnchor, constant: -10),
//            arrowSymbol.centerYAnchor.constraint(equalTo: rectangleView.centerYAnchor)
//        ])
//    }
//    
//    override func prepareForReuse() {
//        super.prepareForReuse()
//        rectangleView.layer.cornerRadius = 30
//        rectangleView.layer.borderWidth = 1
//        rectangleView.clipsToBounds = true
//        rectangleView.layer.borderColor = UIColor(named: "labelColor")?.cgColor
//        }
//    
//    // MARK: - Configure Cell
//    public func configure(image: String?, name: String?){
//          nameLabel.text = name
//          if let image = URL(string: image ?? "") {
//              loadImage(url: image)
//          }
//  
//      }
//      func loadImage(url: URL) {
//  
//          URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
//              guard let data = data, let image = UIImage(data: data), error == nil else {
//                  print("Error loading image: \(error?.localizedDescription ?? "Unknown error")")
//                  return
//              }
//              DispatchQueue.main.async {
//                  self?.flagImageView.image = image
//              }
//          }.resume()
//      }
//}
