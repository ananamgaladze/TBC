//
//  FactsViewModel.swift
//  Task23
//
//  Created by ana namgaladze on 02.05.24.
//
import Foundation
import Networking

protocol FactsViewModelDelegate: AnyObject {
    func factsFetched<T: Decodable>(_ facts: [T])
    func fetchFailed(with error: Error)
}

final class FactsViewModel {
    weak var delegate: FactsViewModelDelegate?
    private let networkService = NetworkService()
    private let urlString = "https://catfact.ninja/facts?max_length=50&limit=50"

    func getInfo() {
        networkService.getInfo(urlString: urlString) { [weak self] (result: Result<FactsInfo, Error>) in
            switch result {
            case .success(let factsInfo):
                self?.delegate?.factsFetched(factsInfo.data)
            case .failure(let error):
                self?.delegate?.fetchFailed(with: error)
            }
        }
    }
}
