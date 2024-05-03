//
//  LogInView.swift
//  Task21
//
//  Created by ana namgaladze on 26.04.24.
//
//
import UIKit

class LogInView: UIView {
    
    //MARK: --- UI Components
    lazy var profilePictureButton: UIButton = {
        let button  = UIButton()
        button.layer.cornerRadius = 66
        button.layer.borderWidth = 1
        button.setImage(UIImage(named: "profileImageDefault"), for: .normal)
        button.clipsToBounds = true
        button.layer.borderColor = UIColor.label.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let usernameLabel = UILabel.customLabel(text: "მომხმარებლის სახელი")
    let passwordLabel = UILabel.customLabel(text: "პაროლი")
    let repeatPasswordLabel = UILabel.customLabel(text: "გაიმეორეთ პაროლი")
    
    let usernameTextField = UITextField.CustomTextField(withPlaceholder: "შეიყვანეთ მომხმარებლის სახელი")
    let passwordTextField = UITextField.CustomTextField(withPlaceholder: "შეიყვანეთ პაროლი", isSecure: true)
    let repeatPasswordTextField = UITextField.CustomTextField(withPlaceholder: "განმეორებით შეიყვანეთ პაროლი", isSecure: true)
    
    let nameStack = UIStackView.customStackView(withSpacing: 6)
    let passwordStack = UIStackView.customStackView(withSpacing: 6)
    let repeatPasswordStack = UIStackView.customStackView(withSpacing: 6)
    
    
    lazy var logInButton: UIButton = {
        let button = UIButton()
        button.setTitle("შესვლა", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 22.5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    weak var delegate: LogInViewDelegate?
    
    //MARK: ---init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
        setupActions()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: --- Setup UI
    private func setupUI() {
        addSubview(profilePictureButton)
        
        addSubview(nameStack)
        nameStack.addArrangedSubview(usernameLabel)
        nameStack.addArrangedSubview(usernameTextField)
        
        addSubview(passwordStack)
        passwordStack.addArrangedSubview(passwordLabel)
        passwordStack.addArrangedSubview(passwordTextField)
        
        addSubview(repeatPasswordStack)
        repeatPasswordStack.addArrangedSubview(repeatPasswordLabel)
        repeatPasswordStack.addArrangedSubview(repeatPasswordTextField)
        
        addSubview(logInButton)
        
    }
    
    // MARK: ---  Constraints
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            profilePictureButton.topAnchor.constraint(equalTo: topAnchor,constant: 110),
            profilePictureButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            profilePictureButton.heightAnchor.constraint(equalToConstant: 132),
            profilePictureButton.widthAnchor.constraint(equalToConstant: 132),
            
            nameStack.topAnchor.constraint(equalTo: profilePictureButton.bottomAnchor,constant: 47),
            nameStack.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 24),
            
            passwordStack.topAnchor.constraint(equalTo: nameStack.bottomAnchor, constant: 31),
            passwordStack.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 24),
            
            repeatPasswordStack.topAnchor.constraint(equalTo: passwordStack.bottomAnchor, constant: 31),
            repeatPasswordLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            
            logInButton.topAnchor.constraint(equalTo: repeatPasswordStack.bottomAnchor, constant: 50),
            logInButton.heightAnchor.constraint(equalToConstant: 45),
            logInButton.widthAnchor.constraint(equalToConstant: 327),
            logInButton.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 26),
            
        ])
    }
    
// MARK: ---button action
    private func setupActions() {
        profilePictureButton.addAction(UIAction(handler: { [weak self] _ in
            self?.delegate?.didTapProfilePictureButton()
        }), for: .touchUpInside)
    }
}
//MARK: --- protocol LogInViewDelegate
protocol LogInViewDelegate: AnyObject {
    func didTapProfilePictureButton()
}
