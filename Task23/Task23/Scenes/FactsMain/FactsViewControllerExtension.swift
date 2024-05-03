//
//  FactsViewControllerExtension.swift
//  Task23
//
//  Created by ana namgaladze on 02.05.24.
//

import UIKit
extension FactsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        factsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CatFactsTableViewCell.identifier, for: indexPath) as? CatFactsTableViewCell else {
            fatalError("Error")
        }
        let info = factsArray[indexPath.row]
        cell.configure(withFact: info)
        return cell
    }
}

extension FactsViewController: FactsViewModelDelegate {
    func factsFetched<T>(_ facts: [T]) {
        if let facts = facts as? [Facts] {
            factsArray = facts
            factsTableView.reloadData()
        }
    }
    
    func fetchFailed(with error: Error) {
        print("Fetching failed. \(error.localizedDescription)")
    }
}

