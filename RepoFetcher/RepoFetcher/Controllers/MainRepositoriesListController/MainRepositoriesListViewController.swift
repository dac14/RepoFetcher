//
//  MainRepositoriesListViewController.swift
//  RepoFetcher
//
//  Created by Arkadiusz Buraczek on 22/10/2019.
//  Copyright © 2019 Arkadiusz Buraczek. All rights reserved.
//

import UIKit

final class MainRepositoriesListViewController: BaseViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private let viewModel: MainRepositoriesListViewModelProtocol

    init(viewModel: MainRepositoriesListViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    private func setup() {
        setupTableView()
        viewModel.delegate = self
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: String(describing: MainRepositoriesListCell.self), bundle: nil), forCellReuseIdentifier: MainRepositoriesListCell.identifier)
    }
}

extension MainRepositoriesListViewController: MainRepositoriesListViewModelDelegate {
    func update(with values: [RepositoryRenderable]) {
        guard values.count != viewModel.numberOfItemsInDataSource else { return tableView.reloadData() }
        
        let indexPaths = values.enumerated().map { index, _ in
            IndexPath(item: viewModel.numberOfItemsInDataSource + index, section: .zero)
        }
        
        guard !indexPaths.isEmpty else { return tableView.reloadData() }
        
        UIView.performWithoutAnimation {
            tableView.insertRows(at: indexPaths, with: .bottom)
        }
    }
}

extension MainRepositoriesListViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 150.0
//    }
}

extension MainRepositoriesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItemsInDataSource
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = viewModel.item(at: indexPath.row)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: MainRepositoriesListCell.identifier, for: indexPath) as! MainRepositoriesListCell
        cell.update(renderable: item)
        #warning("throw fatal here? ")
        return cell
    }
    
    
}
