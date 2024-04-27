//
//  LogInViewModel.swift
//  Task21
//
//  Created by ana namgaladze on 26.04.24.
//

import UIKit

class LogInViewModel {
    func saveProfileImage(_ image: UIImage) {
        if let imageData = image.jpegData(compressionQuality: 1.0) {
            UserDefaults.standard.set(imageData, forKey: "profileImage")
        }
    }
}
