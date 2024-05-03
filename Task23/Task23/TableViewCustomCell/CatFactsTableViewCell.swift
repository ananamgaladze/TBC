//
//  CatFactsTableViewCell.swift
//  Task23
//
//  Created by ana namgaladze on 02.05.24.
//

import UIKit

class CatFactsTableViewCell: UITableViewCell {
    static let identifier = "CatFactsTableViewCell"
    
    lazy var frameView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.layer.cornerRadius = 15
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var cellBackgroundImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "CellBackground")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var backgroundColorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
        
    
    lazy var factLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .center
        label.text = "აღწერა  მდჯკსნდიბივ ჯჰბციდუნ ჯრჰფიუერნფ ჰბრეიუჰფეჯწნ ჯდწნფ სჯჰხიჯსნ სდიუწქნდჯნუდჰწიუნდ "
        label.numberOfLines = 0
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
        contentView.addSubview(frameView)
        frameView.addSubview(cellBackgroundImageView)
        cellBackgroundImageView.addSubview(backgroundColorView)
        frameView.addSubview(factLabel)
        
        NSLayoutConstraint.activate([
            frameView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            frameView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            frameView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            frameView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            cellBackgroundImageView.topAnchor.constraint(equalTo: frameView.topAnchor),
            cellBackgroundImageView.leadingAnchor.constraint(equalTo: frameView.leadingAnchor),
            cellBackgroundImageView.trailingAnchor.constraint(equalTo: frameView.trailingAnchor),
            cellBackgroundImageView.bottomAnchor.constraint(equalTo: frameView.bottomAnchor),
            
            backgroundColorView.topAnchor.constraint(equalTo: cellBackgroundImageView.topAnchor),
            backgroundColorView.leadingAnchor.constraint(equalTo: cellBackgroundImageView.leadingAnchor),
            backgroundColorView.trailingAnchor.constraint(equalTo: cellBackgroundImageView.trailingAnchor),
            backgroundColorView.bottomAnchor.constraint(equalTo: cellBackgroundImageView.bottomAnchor),
            
            factLabel.topAnchor.constraint(equalTo: cellBackgroundImageView.topAnchor, constant: 16),
            factLabel.leadingAnchor.constraint(equalTo: cellBackgroundImageView.leadingAnchor, constant: 16),
            factLabel.trailingAnchor.constraint(equalTo: cellBackgroundImageView.trailingAnchor, constant: -16),
            factLabel.bottomAnchor.constraint(equalTo: frameView.bottomAnchor, constant: -16),
        ])
    }
    public func configure(withFact: Facts ) {
        factLabel.text = withFact.fact
    }
}
