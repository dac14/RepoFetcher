//
//  ApiConstants.swift
//  RepoFetcher
//
//  Created by Arkadiusz Buraczek on 23/10/2019.
//  Copyright © 2019 Arkadiusz Buraczek. All rights reserved.
//

import Foundation
import Moya

enum ApiConstants {
    static let baseURL = "https://api.github.com/"
}

enum HTTPCode: Int {
    case badRequest = 400
    case unauthorized
    case undefined
}

extension HTTPCode {
    static let allCodes = 200...500
    static let successfulCodes = 200...399

    static func all(excluding codes: [Int]) -> [Int] {
        return HTTPCode.allCodes.filter { codes.firstIndex(of: $0) == nil }
    }

    static func numericFrom(_ response: HTTPURLResponse?) -> Int? {
        guard let response = response else { return nil }

        return response.statusCode
    }

    static func from(_ response: HTTPURLResponse?) -> HTTPCode? {
        guard let response = response else { return nil }
        guard let httpCode = HTTPCode(rawValue: response.statusCode) else {
            return .undefined
        }

        return httpCode
    }

    static func statusCode(from error: Error?) -> Int? {
        guard let response = (error as? MoyaError)?.response else { return nil }

        return response.statusCode
    }

    static func from(_ error: Error?) -> HTTPCode? {
        guard let statusCode = HTTPCode.statusCode(from: error) else { return nil }
        guard let httpCode = HTTPCode(rawValue: statusCode) else {
            return .undefined
        }

        return httpCode
    }
}
