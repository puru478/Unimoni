//
//  PlanTableViewCell.swift
//  UnimoniTest
//
//  Created by Purushottam Chandra on 18/03/19.
//  Copyright © 2019 Purushottam Chandra. All rights reserved.
//

import UIKit

class PlanTableViewCell: UITableViewCell {

    @IBOutlet weak var planTypeLabel: UILabel!
    @IBOutlet weak var planCostLabel: UILabel!
    @IBOutlet weak var planBenefitsCollectionView: UICollectionView! {
        didSet {
            planBenefitsCollectionView.delegate = self
            planBenefitsCollectionView.dataSource = self
            planBenefitsCollectionView.backgroundColor = .whiteGrey
            planBenefitsCollectionView.bounces = false
        }
    }
    @IBOutlet weak var planDetailsLabel: UILabel!
    @IBOutlet weak var buyNowButton: UIButton! {
        didSet {
            buyNowButton.backgroundColor = .strongBlue
            buyNowButton.setAttributedTitle(NSMutableAttributedString.stringAttributes(string: "BUY NOW", color: .white, font: .boldSystemFont(ofSize: 12)), for: .normal)
        }
    }
    @IBOutlet weak var secondaryView: UIView! {
        didSet {
            secondaryView.backgroundColor = .lightBlue
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    var viewModel: PlanCellVM!
    
    func prepare(vm: PlanCellVM) {
        viewModel = vm
        planTypeLabel.attributedText = vm.planName
        planCostLabel.attributedText = vm.planCost
        planDetailsLabel.attributedText = vm.planDetails
        vm.collectionItemTypes.forEach{$0.registerCell(collectionView: planBenefitsCollectionView)}
        vm.reloadCollection = {
            self.planBenefitsCollectionView.reloadData()
        }
    }
}

extension PlanTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.collectionItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellVM = viewModel.collectionItems[indexPath.row]
        return cellVM.cellInstantiate(collectionView: collectionView, indexPath: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width * 0.5, height: collectionView.bounds.height * 0.31)
    }
}
