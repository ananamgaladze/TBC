//
//  Networking.swift
//  Task20
//
//  Created by ana namgaladze on 25.04.24.
//

import Foundation

class Networking {
    static func fetchData(completion: @escaping ([Country]?, Error?) -> Void) {
        let urlString = "https://restcountries.com/v3.1/all#"
        guard let url = URL(string: urlString) else {
            completion(nil, NSError(domain: "Invalid URL", code: 0, userInfo: nil))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(nil, error)
                return
            }
            
            guard let data = data else {
                completion(nil, NSError(domain: "No data received", code: 0, userInfo: nil))
                return
            }
            
            do {
                let responseData = try JSONDecoder().decode([Country].self, from: data)
                completion(responseData, nil)
            } catch {
                completion(nil, error)
            }
        }.resume()
    }
}
