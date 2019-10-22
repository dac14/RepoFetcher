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
        
        print("Initialized")
    }
}
