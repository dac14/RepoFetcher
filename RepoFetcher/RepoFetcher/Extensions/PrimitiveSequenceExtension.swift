//
//  PrimitiveSequenceExtension.swift
//  RepoFetcher
//
//  Created by Arkadiusz Buraczek on 23/10/2019.
//  Copyright © 2019 Arkadiusz Buraczek. All rights reserved.
//

import RxSwift
import Moya

extension PrimitiveSequence where TraitType == SingleTrait, ElementType == Response {
    public func snakeCaseDecode<Element: Decodable>(_ type: Element.Type, atKeyPath keyPath: String? = nil, failsOnEmptyData: Bool = true) -> Single<Element> {
        return flatMap { .just(try $0.map(type, atKeyPath: keyPath, using: JSONDecoder.snakeCase, failsOnEmptyData: failsOnEmptyData)) }
    }

    public func snakeCaseDataDecode<Element: Decodable>(_ type: Element.Type, failsOnEmptyData: Bool = true) -> Single<Element> {
        return flatMap { .just(try $0.map(type, atKeyPath: APIKeys.data, using: JSONDecoder.snakeCase, failsOnEmptyData: failsOnEmptyData)) }
    }
}
