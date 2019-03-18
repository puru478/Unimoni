//
//  BenefitCollectionViewCell.swift
//  UnimoniTest
//
//  Created by Purushottam Chandra on 18/03/19.
//  Copyright © 2019 Purushottam Chandra. All rights reserved.
//

import UIKit

class BenefitCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var benefitImage: UIImageView!
    @IBOutlet weak var benefitDetails: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func prepare(vm: BenefitCollectionCellVM) {
        benefitDetails.attributedText = vm.benefitTitle
        if let benefit = AppConstants.benefitImages.init(rawValue: vm.imageString) {
            switch benefit {
            case .mobile:
                benefitImage.image = UIImage(named: "tele_consult")
            case .checkUp:
                benefitImage.image = UIImage(named: "health_check")
            case .pharmacy:
                benefitImage.image = UIImage(named: "medicine")
            case .dental:
                benefitImage.image = UIImage(named: "dental_check")
            case .discount:
                benefitImage.image = UIImage(named: "discount_card")
            case .diet:
                benefitImage.image = UIImage(named: "health_fitness")
            case .consultation:
                benefitImage.image = UIImage(named: "tele_consult")
            }
        } else {
            benefitImage.image = UIImage(named: "tele_consult")
        }
    }
}
