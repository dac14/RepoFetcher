//
//  RepositoryRenderable.swift
//  RepoFetcher
//
//  Created by Arkadiusz Buraczek on 24/10/2019.
//  Copyright © 2019 Arkadiusz Buraczek. All rights reserved.
//

import Foundation

struct RepositoryRenderable {
    let id: Int
    let name: String
    let description: String
    let numberOfStars: Int
    let username: String
    let userAvatarUrl: String
    
    init(item: RepositoryItem) {
        id = item.id ?? .zero
        name = item.name ?? ""
        description = item.description ?? ""
        username = item.owner?.login ?? ""
        userAvatarUrl = item.owner?.avatarUrl ?? ""
        numberOfStars = item.stargazersCount ?? .zero
    }
}
