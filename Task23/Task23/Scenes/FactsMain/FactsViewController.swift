//
//  FactsViewController.swift
//  Task23
//
//  Created by ana namgaladze on 02.05.24.
//
import UIKit

final class FactsViewController: UIViewController {
    let factsTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemBackground
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CatFactsTableViewCell.self, forCellReuseIdentifier: CatFactsTableViewCell.identifier)
        return tableView
    }()
    
    var factsArray: [Facts] = []
    var viewModel: FactsViewModel
    
    init(viewModel: FactsViewModel = FactsViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTitle()
        addTableView()
        viewModel.delegate = self
        fetchFacts()
    }
    
    func addTitle() {
        navigationItem.title = "Facts about cats"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    
    func addTableView() {
        view.addSubview(factsTableView)
        
        NSLayoutConstraint.activate([
            factsTableView.topAnchor.constraint(equalTo: view.topAnchor,constant: 111),
            factsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 25),
            factsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -24),
            factsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -15),
        ])
        factsTableView.rowHeight = 128
        factsTableView.dataSource = self
        factsTableView.delegate = self
    }
    
    func fetchFacts() {
        viewModel.getInfo()
    }
}

