//
//  LogInViewController.swift
//  Task21
//
//  Created by ana namgaladze on 26.04.24.
//
//
import UIKit

class LogInViewController: UIViewController {
    var logInView: LogInView
    let viewModel = LogInViewModel()

    init() {
        self.logInView = LogInView()
        super.init(nibName: nil, bundle: nil)
        self.logInView.delegate = self
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = logInView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        logInView.logInButton.addAction(UIAction(handler: { _ in
            self.logInButtonTapped()
        }), for: .touchUpInside)
    }

    func logInButtonTapped() {
        let countriesVC = CountriesViewController()
        navigationController?.pushViewController(countriesVC, animated: true)
    }
}

extension LogInViewController: LogInViewDelegate {
    func didTapProfilePictureButton() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
}

extension LogInViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[.originalImage] as? UIImage {
            logInView.profilePictureButton.setImage(pickedImage, for: .normal)
            viewModel.saveProfileImage(pickedImage)
        }
        dismiss(animated: true, completion: nil)
    }
}
