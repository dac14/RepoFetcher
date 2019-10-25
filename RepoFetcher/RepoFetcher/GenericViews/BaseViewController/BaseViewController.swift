//
//  BaseViewController.swift
//  RepoFetcher
//
//  Created by Arkadiusz Buraczek on 22/10/2019.
//  Copyright © 2019 Arkadiusz Buraczek. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    private enum Constants {
        static let activityIndicatorCornerRadius: CGFloat = 5.0
        static let activityIndicatorBackgroundAlpha: CGFloat = 0.6
        
        enum indicatorBackgroundSize {
            static let height: CGFloat = 65.0
            static let width: CGFloat = 65.0
        }
    }
    
    private let activityIndicator = UIActivityIndicatorView(style: .large)
    private let indicatorBackground = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureActivityIndicator()
    }
    
    func showActivityIndicator() {
        DispatchQueue.main.async { [weak self] in
            self?.activityIndicator.startAnimating()
            self?.indicatorBackground.isHidden = false
            self?.view.isUserInteractionEnabled = false
        }
    }
    
    func hideActivityIndicator() {
        DispatchQueue.main.async { [weak self] in
            self?.activityIndicator.stopAnimating()
            self?.indicatorBackground.isHidden = true
            self?.view.isUserInteractionEnabled = true
        }
    }
    
    private func configureActivityIndicator() {
        indicatorBackground.layer.cornerRadius = Constants.activityIndicatorCornerRadius
        indicatorBackground.backgroundColor = .lightGray
        indicatorBackground.alpha = Constants.activityIndicatorBackgroundAlpha
        
        view.addSubview(indicatorBackground)
        
        indicatorBackground.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            indicatorBackground.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            indicatorBackground.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            indicatorBackground.heightAnchor.constraint(equalToConstant: Constants.indicatorBackgroundSize.height),
            indicatorBackground.widthAnchor.constraint(equalToConstant: Constants.indicatorBackgroundSize.width)
        ])

        indicatorBackground.addSubview(activityIndicator)
        
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = .white
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: indicatorBackground.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: indicatorBackground.centerYAnchor)
        ])
        
    }
}
