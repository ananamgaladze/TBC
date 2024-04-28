//
//  LogInVCExtensions.swift
//  Task21
//
//  Created by ana namgaladze on 28.04.24.
//

import UIKit
//MARK: --- LogInViewModelDelegate
extension LogInViewController: LogInViewModelDelegate {
    func navigateToCountriesMainVC(username: String?, password: String?, repeatPassword: String?) {
        let alert = UIAlertController(
            title: "✨გილოცავთ✨",
            message: "თქვენ წარმატებით შეხვედით აპლიკაციაში",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(
            title: "OK",
            style: .default,
            handler: nil
        ))
        
        guard let username = username,
              let password = password,
              let repeatPassword = repeatPassword else {
            return
        }
        
        guard !username.isEmpty,
              !password.isEmpty,
              !repeatPassword.isEmpty else {
            return
        }
        
        guard password == repeatPassword else {
            return
        }
        
        
        viewModel.saveLogInInfo(username: username, password: password)
        UserDefaults.standard.set(true, forKey: "isFirstLogin")
        navigationController?.pushViewController(CountriesViewController(), animated: true)
        present(alert, animated: true, completion: nil)
        
    }
}



//MARK: ---LogInViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate
extension LogInViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.editedImage] as? UIImage {
            logInView.profilePictureButton.setImage(image, for: .normal)
        }
        dismiss(animated: true)
    }
}
