//
//  MainRepositoryListService.swift
//  RepoFetcher
//
//  Created by Arkadiusz Buraczek on 22/10/2019.
//  Copyright © 2019 Arkadiusz Buraczek. All rights reserved.
//

import Moya

enum MainRepositoryListService: ErrorableTargetType {
    case repositoriesList(fromDate: String, page: String)
    
    var baseURL: URL {
        return URL(string: ApiConstants.baseURL)!
    }
    
    var path: String {
        switch self {
        case .repositoriesList(_, _):
            return "search/repositories"
        }
    }
    
    var method: Method {
        switch self {
        default:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .repositoriesList(let date, let page):
            return .requestParameters(parameters: [APIKeys.onlyQ: APIValue.createdAfter + date,
                                                   APIKeys.sort: APIValue.stars,
                                                   APIKeys.order: APIValue.desc,
                                                   APIKeys.page: page], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    var sampleData: Data {
        return Data()
    }
}
