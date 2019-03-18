//
//  PlanCellVM.swift
//  UnimoniTest
//
//  Created by Purushottam Chandra on 18/03/19.
//  Copyright © 2019 Purushottam Chandra. All rights reserved.
//

import UIKit

class PlanCellVM {
    let planName: NSMutableAttributedString
    let planCost: NSMutableAttributedString
    let planDetails: NSMutableAttributedString
    
    var collectionItemTypes: [CollectionCellRepresentable.Type] = [BenefitCollectionCellVM.self]
    var collectionItems = [CollectionCellRepresentable]()
    
    var reloadCollection: (() -> ())?

    init(name: NSMutableAttributedString, cost: NSMutableAttributedString, details: NSMutableAttributedString, benefits: [BenefitResponseModel]) {
        planName = name
        planCost = cost
        planDetails = details
        setupCollectionWith(benefits: benefits)
    }
    
    private func setupCollectionWith(benefits: [BenefitResponseModel]) {
        var viewModel: [CollectionCellRepresentable] = [CollectionCellRepresentable]()
        for i in 0..<benefits.count {
            viewModel.append(BenefitCollectionCellVM(benefitModel: benefits[i], count: i + 1))
        }
        collectionItems = viewModel
        reloadCollection?()
    }
}

extension PlanCellVM: CellRepresentable {
    static func registerCell(tableview: UITableView) {
        tableview.register(UINib(nibName: "PlanTableViewCell", bundle: nil), forCellReuseIdentifier: "PlanTableViewCell")
    }
    
    func cellInstanatiate(tableview: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell: PlanTableViewCell = tableview.dequeueReusableCell(withIdentifier: "PlanTableViewCell", for: indexPath) as! PlanTableViewCell
        cell.prepare(vm: self)
        cell.selectionStyle = .none
        return cell
    }
}
