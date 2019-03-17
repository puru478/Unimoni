//
//  TableViewProtocols.swift
//  UnimoniTest
//
//  Created by Purushottam Chandra on 17/03/19.
//  Copyright © 2019 Purushottam Chandra. All rights reserved.
//

import UIKit

protocol CellRepresentable {
    static func registerCell(tableview: UITableView)
    func cellInstanatiate(tableview: UITableView, indexPath: IndexPath) -> UITableViewCell
    func cellSelected(tableview: UITableView, indexPath: IndexPath)
}

extension CellRepresentable {
    func cellSelected(tableview _: UITableView, indexPath _: IndexPath) {
    }
}

protocol TableViewModelProtocol {
    var tableItemTypes: [CellRepresentable.Type] { get }
    var tableItems: [CellRepresentable] { get }
    var reloadTable: completionHandler { get set }
}



