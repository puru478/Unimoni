//
//  ViewController.swift
//  UnimoniTest
//
//  Created by Purushottam Chandra on 17/03/19.
//  Copyright © 2019 Purushottam Chandra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        setupNavBar()
        setupToggle()
        setupTableView()
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
    
    private func setupTableView() {
        tableView = UITableView(frame: CGRect(x: 10, y: 100, width: view.frame.width - 20, height: view.frame.height - 100))
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
