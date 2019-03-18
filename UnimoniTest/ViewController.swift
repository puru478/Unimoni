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
    
    let viewModel = MainViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        viewModel.callAPIfor(numberOfMembers: .memberCount2)
    }
    
    private func setupUI() {
        setupNavBar()
        setupToggle()
        setupTableView()
        view.backgroundColor = .white
        viewModel.reloadTable = {
            DispatchQueue.main.async {
                Helper.hideActivityIndicator()
                self.tableView.reloadData()
            }
        }
    }
    
    private func setupNavBar() {
        navigationController?.navigationBar.barTintColor = .strongBlue
        navigationController?.navigationBar.isTranslucent = false
        title = "Member Selection"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    private func setupToggle() {
        let xStart = (view.frame.width * 0.7) / 4
        let toggleView = ToggleView(frame: CGRect(x: xStart, y: 20, width: view.frame.width * 0.7, height: 40))
        toggleView.isToggleSelected.bind { [weak self] (value) in
            switch value {
            case true:
                self?.viewModel.callAPIfor(numberOfMembers: .memberCount2)
            case false:
                self?.viewModel.callAPIfor(numberOfMembers: .memberCount4)
            }
        }
        view.addSubview(toggleView)
    }
    
    private func setupTableView() {
        tableView = UITableView(frame: CGRect(x: 0, y: 80, width: view.frame.width, height: view.frame.height - 140))
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 250
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.bounces = false
        tableView.showsVerticalScrollIndicator = false
        view.addSubview(tableView)
        viewModel.tableItemTypes.forEach { (cell) in cell.registerCell(tableview: tableView)}
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.tableItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellVM = viewModel.tableItems[indexPath.row]
        return cellVM.cellInstanatiate(tableview: tableView, indexPath: indexPath)
    }
}
