//
//  SessionManagerExtension.swift
//  RepoFetcher
//
//  Created by Arkadiusz Buraczek on 23/10/2019.
//  Copyright © 2019 Arkadiusz Buraczek. All rights reserved.
//

import Alamofire
import Moya

extension SessionManager {
    static let withoutAuthHandler: SessionManager = {
        let sessionManager = SessionManager()
        return sessionManager
    }()
}

extension MoyaProvider {
    static func create<T: TargetType>(sessionManager: SessionManager = .withoutAuthHandler, plugins: [PluginType] = []) -> MoyaProvider<T> {
        let defaultPlugins: [PluginType] = [ErrorHandlingPlugin(), NetworkLoggerPlugin(verbose: true)]
        return MoyaProvider<T>(manager: sessionManager, plugins: defaultPlugins + plugins)
    }
}
