//
//  MainRepositoriesListCell.swift
//  RepoFetcher
//
//  Created by Arkadiusz Buraczek on 24/10/2019.
//  Copyright © 2019 Arkadiusz Buraczek. All rights reserved.
//

import UIKit
import Kingfisher

class MainRepositoriesListCell: UITableViewCell {

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var usernameLabel: UILabel!
    @IBOutlet private weak var starsLabel: UILabel!
    @IBOutlet private weak var avatarImageView: UIImageView!
    
    static let identifier = "MainRepositoriesListCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        titleLabel.text = ""
        descriptionLabel.text = ""
        usernameLabel.text = ""
        starsLabel.text = ""
        avatarImageView.kf.cancelDownloadTask()
        avatarImageView.image = nil
    }

    func update(renderable: RepositoryRenderable) {
        titleLabel.text = renderable.name
        descriptionLabel.text = renderable.description
        usernameLabel.text = renderable.username
        starsLabel.text = renderable.numberOfStars
        avatarImageView.kf.indicatorType = .activity
        avatarImageView.kf.setImage(with: URL(string: renderable.userAvatarUrl))
    }
}
