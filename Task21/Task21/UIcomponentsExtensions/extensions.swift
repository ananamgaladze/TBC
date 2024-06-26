//
//  extensions.swift
//  Task21
//
//  Created by ana namgaladze on 25.04.24.
//

import UIKit

extension UILabel {
    static func makeLabel(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont(name: "SFPro-Bold", size: 16)
        label.textAlignment = .left
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
}

extension UILabel {
    static func customLabel(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont(name: "FiraGO-Regular", size: 11)
        label.textAlignment = .left
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
}


extension UILabel {
    static func makeInfoLabel(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont(name: "SFPro-Regular", size: 14)
        label.textAlignment = .right
        label.numberOfLines = 0
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
}


extension UIView {
    static var decorativeLine: UIView {
        let lineView = UIView()
        lineView.backgroundColor = .gray
        lineView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lineView.heightAnchor.constraint(equalToConstant: 1),
            lineView.widthAnchor.constraint(equalToConstant: 312),
        ])
        
        return lineView
    }
}


extension UIButton {
    static func circularButton(withImage image: UIImage?) -> UIButton {
        let button = UIButton(type: .custom)
        button.layer.cornerRadius = 25
        button.layer.borderWidth = 1
        button.imageView?.contentMode = .scaleAspectFit
        button.clipsToBounds = true
        let resizedImage =  image?.resized(toSize: CGSize(width: 30, height: 30))
        button.setImage(resizedImage, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.updateBorderColor()
        
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: 50),
            button.heightAnchor.constraint(equalToConstant: 50),
        ])
        button.registerForTraitChanges()
        
        return button
    }
    func updateBorderColor() {
        let interfaceStyle = traitCollection.userInterfaceStyle
        if interfaceStyle == .dark {
            layer.borderColor = UIColor.white.cgColor
        } else {
            layer.borderColor = UIColor.black.cgColor
        }
    }
    
    func registerForTraitChanges() {
        NotificationCenter.default.addObserver(forName: Notification.Name("traitCollectionDidChangeNotification"), object: nil, queue: nil) { [weak self] _ in
            self?.updateBorderColor()
        }
    }
}



extension UIImage {
    func resized(toSize newSize: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        defer { UIGraphicsEndImageContext() }
        draw(in: CGRect(origin: .zero, size: newSize))
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}

extension UITextField {
    static func CustomTextField(withPlaceholder placeholder: String, isSecure: Bool = false) -> UITextField {
        let textField = UITextField()
        textField.font = UIFont(name: "FiraGO-Regular", size: 12)
        textField.textColor = .label
        textField.layer.masksToBounds = true
        textField.layer.cornerRadius = 22.5
        textField.backgroundColor = .systemGray5
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = placeholder
        textField.isSecureTextEntry = isSecure 
        
        NSLayoutConstraint.activate([
            textField.widthAnchor.constraint(equalToConstant: 327),
            textField.heightAnchor.constraint(equalToConstant: 45)
        ])
        
        return textField
    }
}



extension UIStackView {
    static func customStackView(withSpacing spacing: CGFloat) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        stackView.spacing = spacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }
}
