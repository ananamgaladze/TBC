//
//  LogInViewModel.swift
//  Task21
//
//  Created by ana namgaladze on 26.04.24.
//


import Foundation

protocol LogInViewModelDelegate: AnyObject {
    func navigateToCountriesMainVC(username: String?, password: String?, repeatPassword: String?)
}

final class LogInViewModel {
    let keychainService = KeychainService()
    weak var delegate1: LogInViewModelDelegate?
    
    func saveLogInInfo(username: String?, password: String? ) {
        do {
            guard let username = username,
                  let password = password
            else {
                return
            }
            guard let passwordData = password.data(using: .utf8) else {
                print("can't convert to data")
                return
            }
            
            try keychainService.save(
                account: username,
                password: passwordData
            )
        } catch {
            print("\(error)")
        }
    }
    
    
    
    func logInButtonTapped(username: String?, password: String?, repeatPassword: String?) {
        delegate1?.navigateToCountriesMainVC(username: username, password: password, repeatPassword: repeatPassword)
    }
    
    private func navigateToCountriesMainVC(username: String?, password: String?, repeatPassword: String?) {
        saveLogInInfo(username: username, password: password)

    }
    
}


