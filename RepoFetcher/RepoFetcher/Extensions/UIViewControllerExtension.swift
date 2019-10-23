//
//  UIViewControllerExtension.swift
//  RepoFetcher
//
//  Created by Arkadiusz Buraczek on 23/10/2019.
//  Copyright © 2019 Arkadiusz Buraczek. All rights reserved.
//

import UIKit

extension UIViewController {
    var visibleViewController: UIViewController? {
        if let controller = self as? UINavigationController {
            return controller.topViewController?.visibleViewController
        }
        if let controller = self as? UISplitViewController {
            return controller.viewControllers.last?.visibleViewController
        }
        if let controller = self as? UITabBarController {
            return controller.selectedViewController?.visibleViewController
        }
        if let controller = presentedViewController {
            return controller.visibleViewController
        }
        return self
    }
    
    func add(_ child: UIViewController, toView: UIView, insets: UIEdgeInsets = .zero) {
        addChild(child)
        toView.addSubview(child.view)
        child.didMove(toParent: self)
        child.view.activeToEdges(insets)
    }

    func remove() {
        guard parent != nil else { return }

        willMove(toParent: nil)
        removeFromParent()
        view.removeFromSuperview()
    }
}
