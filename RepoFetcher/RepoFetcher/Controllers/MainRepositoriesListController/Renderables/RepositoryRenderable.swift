//
//  RepositoryRenderable.swift
//  RepoFetcher
//
//  Created by Arkadiusz Buraczek on 24/10/2019.
//  Copyright © 2019 Arkadiusz Buraczek. All rights reserved.
//

import Foundation

struct RepositoryRenderable {
    private let starFormatter = RepositoryRenderableStarFormatter()
    
    let id: Int
    let name: String
    let description: String
    let numberOfStars: String
    let username: String
    let userAvatarUrl: String
    
    init(item: RepositoryItem) {
        id = item.id ?? .zero
        name = item.name ?? ""
        description = item.description ?? ""
        username = item.owner?.login ?? ""
        userAvatarUrl = item.owner?.avatarUrl ?? ""
        numberOfStars = starFormatter.formatStars(count: item.stargazersCount)
    }
}

struct RepositoryRenderableStarFormatter {
    // Format from e.g. 5507 to 5.5 k
     func formatStars(count: Int?) -> String {
        guard let count = count else { return "0 k" }
        guard count > 99 else { return "\(count)" }
        let thousands = Int(count / 1000)
        let hundreds = Int((count - thousands * 1000) / 100)
        
        return "\(thousands).\(hundreds) k"
    }
}
