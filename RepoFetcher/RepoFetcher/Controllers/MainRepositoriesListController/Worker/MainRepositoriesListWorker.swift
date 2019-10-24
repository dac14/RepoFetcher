//
//  MainRepositoriesListWorker.swift
//  RepoFetcher
//
//  Created by Arkadiusz Buraczek on 23/10/2019.
//  Copyright © 2019 Arkadiusz Buraczek. All rights reserved.
//

import RxSwift
import Moya

protocol MainRepositoriesListWorkerProtocol {
    func fetchRepositoriesList(from date: String, page: String) -> Single<RepositoriesListResponse>
}

final class MainRepositoriesListWorker: MainRepositoriesListWorkerProtocol {
    private let provider: MoyaProvider<MainRepositoryListService> = .create()
    
    func fetchRepositoriesList(from date: String, page: String) -> Single<RepositoriesListResponse> {
        return provider.rx
            .request(.repositoriesList(fromDate: date, page: page))
            .filterSuccessfulStatusCodes()
            .map(RepositoriesListResponse.self)
    }
}
