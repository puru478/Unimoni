//
//  BenefitCollectionCellVM.swift
//  UnimoniTest
//
//  Created by Purushottam Chandra on 18/03/19.
//  Copyright © 2019 Purushottam Chandra. All rights reserved.
//

import UIKit

class BenefitCollectionCellVM {
    var imageString: String
    var benefitTitle: NSMutableAttributedString
    
    init(benefitModel: BenefitResponseModel, count: Int) {
        imageString = benefitModel.benefitIconLocal ?? "dental_check"
        let benefitString = NSMutableAttributedString.stringAttributes(string: "Benefit - \(count)", color: .black, font: .boldSystemFont(ofSize: 13))
        benefitString.append(NSMutableAttributedString.stringAttributes(string: "\n\(benefitModel.benefitTitle ?? "")\n\(benefitModel.benefitSubTitle ?? "")", color: .black, font: .systemFont(ofSize: 12)))
        benefitTitle = benefitString
    }
}

extension BenefitCollectionCellVM: CollectionCellRepresentable {
    static func registerCell(collectionView: UICollectionView) {
        collectionView.register(UINib(nibName: "BenefitCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "BenefitCollectionViewCell")
    }
    
    func cellInstantiate(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        let cell: BenefitCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "BenefitCollectionViewCell", for: indexPath) as! BenefitCollectionViewCell
        cell.prepare(vm: self)
        return cell
    }
}
