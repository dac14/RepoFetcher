//
//  UIVIewExtension.swift
//  RepoFetcher
//
//  Created by Arkadiusz Buraczek on 23/10/2019.
//  Copyright © 2019 Arkadiusz Buraczek. All rights reserved.
//

import UIKit

extension UIView {
    var safeTopAnchor: NSLayoutYAxisAnchor {
        return safeAreaLayoutGuide.topAnchor
    }

    var safeLeftAnchor: NSLayoutXAxisAnchor {
        return safeAreaLayoutGuide.leftAnchor
    }

    var safeRightAnchor: NSLayoutXAxisAnchor {
        return safeAreaLayoutGuide.rightAnchor
    }

    var safeBottomAnchor: NSLayoutYAxisAnchor {
        return safeAreaLayoutGuide.bottomAnchor
    }

    func clearConstraints() {
        subviews.forEach { $0.clearConstraints() }
        removeConstraints(constraints)
    }

    func activate(_ constraints: [NSLayoutConstraint]) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(constraints)
    }

    func activeToEdges(_ inset: UIEdgeInsets = .zero) {
        guard let superview = superview else { return }

        activate([
            leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: inset.left),
            trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -inset.right),
            topAnchor.constraint(equalTo: superview.topAnchor, constant: inset.top),
            bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -inset.bottom)])
    }
}
