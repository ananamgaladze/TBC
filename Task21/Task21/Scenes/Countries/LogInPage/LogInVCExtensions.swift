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

        guard let username = username, !username.isEmpty else {
            let usernameAlert = UIAlertController(title: "🚨ეხლა მოიცაა🚨", message: "შეავსე ინფორმაცია", preferredStyle: .alert)
            usernameAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(usernameAlert, animated: true, completion: nil)
            return
        }

        guard let password = password, !password.isEmpty else {
            let passwordAlert = UIAlertController(title: "🚨ეხლა მოიცაა🚨", message: "შეიყვანე პაროლი", preferredStyle: .alert)
            passwordAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(passwordAlert, animated: true, completion: nil)
            return
        }

        guard let repeatPassword = repeatPassword, !repeatPassword.isEmpty else {
            let repeatPasswordAlert = UIAlertController(title: "🚨ეხლა მოიცაა🚨", message: "შეიყვანეთ გაინმეორებით პაროლი", preferredStyle: .alert)
            repeatPasswordAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(repeatPasswordAlert, animated: true, completion: nil)
            return
        }

        guard password == repeatPassword else {
            let passwordMismatchAlert = UIAlertController(title: "🚨ეხლა მოიცაა🚨", message: "პაროლები არ ემთხვევა", preferredStyle: .alert)
            passwordMismatchAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(passwordMismatchAlert, animated: true, completion: nil)
            return
        }

        viewModel.saveLogInInfo(username: username, password: password)
        UserDefaults.standard.set(true, forKey: "isFirstLogin")
        navigationController?.pushViewController(CountriesViewController(), animated: true)
        present(alert, animated: true, completion: nil)
    }
}


//MARK: ---  UIImagePickerControllerDelegate & UINavigationControllerDelegate 
extension LogInViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.editedImage] as? UIImage {
            logInView.profilePictureButton.setImage(image, for: .normal)
            saveProfileImage(image)
        }
        dismiss(animated: true)
    }
}

