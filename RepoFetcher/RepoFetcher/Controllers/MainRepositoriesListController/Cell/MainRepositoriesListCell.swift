//
//  MainRepositoriesListCell.swift
//  RepoFetcher
//
//  Created by Arkadiusz Buraczek on 24/10/2019.
//  Copyright © 2019 Arkadiusz Buraczek. All rights reserved.
//

import UIKit

class MainRepositoriesListCell: UITableViewCell {

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var usernameLabel: UILabel!
    @IBOutlet private weak var starsLabel: UILabel!
    
    static let identifier = "MainRepositoriesListCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func update(renderable: RepositoryRenderable) {
        titleLabel.text = renderable.name
        descriptionLabel.text = renderable.description
        usernameLabel.text = renderable.username
        starsLabel.text = "\(renderable.numberOfStars)"
    }
}
