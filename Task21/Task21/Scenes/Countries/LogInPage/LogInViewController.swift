//
//  LogInViewController.swift
//  Task21
//
//  Created by ana namgaladze on 26.04.24.
//
//
import UIKit

class LogInViewController: UIViewController {
    var logInView =  LogInView()
    let viewModel = LogInViewModel()
    let fileManager = FileManager.default
    
    //MARK: ---c
    override func loadView() {
        view = logInView
    }
    
    //MARK: ---Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate1 = self
        buttonActionConfiguration()
        addActionProfileImage()
    }
    
    //MARK: ---methods
    func buttonActionConfiguration() {
        logInView.logInButton.addAction(UIAction(handler: { _ in
            self.logInButtonTapped()
        }), for: .touchUpInside)
    }
    
    func logInButtonTapped() {
        navigateToCountriesMainVC(username: logInView.usernameTextField.text, password: logInView.passwordTextField.text, repeatPassword: logInView.repeatPasswordTextField.text)
    }
    
    func saveProfileImage(_ image: UIImage) {
        if let imageData = image.jpegData(compressionQuality: 1.0) {
            let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
            let fileURL = documentsDirectory.appendingPathComponent("profileImage.jpg")
            do {
                try imageData.write(to: fileURL)
            } catch {
                print("Error saving image: \(error.localizedDescription)")
            }
        }
    }
    
    func addImage() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true)
    }
    
    func addActionProfileImage() {
        logInView.profilePictureButton.addAction(UIAction(handler: { _ in
            self.addImage()
        }), for: .touchUpInside)
    }
    
    func checkProfileImageExists() -> Bool {
        let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
        let fileURL = documentsDirectory.appendingPathComponent("profileImage.jpg")
        return fileManager.fileExists(atPath: fileURL.path)
    }
    

    func getProfileImage() -> UIImage? {
        let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
        let fileURL = documentsDirectory.appendingPathComponent("profileImage.jpg")
        if let imageData = try? Data(contentsOf: fileURL), let image = UIImage(data: imageData) {
            return image
        }
        return nil
    }
}

