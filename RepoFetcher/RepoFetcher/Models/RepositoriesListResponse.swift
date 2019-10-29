//
//  RepositoriesListResponse.swift
//  RepoFetcher
//
//  Created by Arkadiusz Buraczek on 23/10/2019.
//  Copyright © 2019 Arkadiusz Buraczek. All rights reserved.
//

import Foundation

struct RepositoriesListResponse: Codable {
    
    let items: [RepositoryItem]?
    
    enum CodingKeys: String, CodingKey {
        case items
    }
}

struct RepositoryOwner: Codable {
    let login: String?
    let avatarUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case avatarUrl = "avatar_url"
        case login
    }
}

struct RepositoryItem: Codable {
    let id: Int?
    let owner: RepositoryOwner?
    let name: String?
    let description: String?
    let stargazersCount: Int?
    
    enum CodingKeys: String, CodingKey {
        case id
        case owner
        case name
        case description
        case stargazersCount = "stargazers_count"
    }
}
