//
//  APIError.swift
//  RepoFetcher
//
//  Created by Arkadiusz Buraczek on 23/10/2019.
//  Copyright © 2019 Arkadiusz Buraczek. All rights reserved.
//

import Foundation

struct APIError: Decodable {
    let message: String?
}
