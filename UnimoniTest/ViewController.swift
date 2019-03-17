//
//  ViewController.swift
//  UnimoniTest
//
//  Created by Purushottam Chandra on 17/03/19.
//  Copyright © 2019 Purushottam Chandra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        setupNavBar()
        setupToggle()
        view.backgroundColor = .white
    }
    
    private func setupNavBar() {
        navigationController?.navigationBar.barTintColor = .strongBlue
        navigationController?.navigationBar.isTranslucent = false
        title = "Member Selection"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    private func setupToggle() {
        let xStart = (view.frame.width * 0.7) / 4
        let toggleView = ToggleView(frame: CGRect(x: xStart, y: 40, width: view.frame.width * 0.7, height: 40))
        view.addSubview(toggleView)
    }
}

