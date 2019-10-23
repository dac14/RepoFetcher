//
//  ErrorableTargetType.swift
//  RepoFetcher
//
//  Created by Arkadiusz Buraczek on 23/10/2019.
//  Copyright © 2019 Arkadiusz Buraczek. All rights reserved.
//

import Moya

protocol APIErrorable {
    var shouldHandleErrorInPlugin: Bool { get }
}

extension APIErrorable {
    var shouldHandleErrorInPlugin: Bool {
        return true
    }
}

protocol ErrorableTargetType: APIErrorable & TargetType {}
