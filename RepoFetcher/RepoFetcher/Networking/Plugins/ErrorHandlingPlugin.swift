//
//  ErrorHandlingPlugin.swift
//  RepoFetcher
//
//  Created by Arkadiusz Buraczek on 23/10/2019.
//  Copyright © 2019 Arkadiusz Buraczek. All rights reserved.
//

import Moya
import Result

final class ErrorHandlingPlugin: PluginType {
    func didReceive(_ result: Result<Response, MoyaError>, target: TargetType) {
        guard let errorTarget = target as? ErrorableTargetType, errorTarget.shouldHandleErrorInPlugin else { return }

        guard case .success(let response) = result, !HTTPCode.successfulCodes.contains(response.statusCode), let error = try? JSONDecoder().decode(APIError.self, from: response.data) else { return }

        let topViewController = UIApplication.shared.keyWindow?.rootViewController?.visibleViewController
        let alertController = UIAlertController.alert(title: NSLocalizedString("general_alert_title", comment: ""), message: error.message ?? "")
        topViewController?.present(alertController, animated: true)
    }
}
