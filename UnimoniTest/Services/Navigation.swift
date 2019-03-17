//
//  Navigation.swift
//  UnimoniTest
//
//  Created by Purushottam Chandra on 17/03/19.
//  Copyright © 2019 Purushottam Chandra. All rights reserved.
//

import UIKit

var activityIndicatorView = ActivityIndicator()
var activityIndicatorCoverView: UIView = UIView()

final class Navigation {
    
    fileprivate var window: UIWindow!
    var navigationController: UINavigationController!
    
    init(window: UIWindow) {
        self.window = window
        navigationController = UINavigationController()
        window.rootViewController = self.navigationController
        window.makeKeyAndVisible()
        setupActivityIndicator()
    }
    
    private func setupActivityIndicator() {
        activityIndicatorView.stopAnimating()
    }
}
