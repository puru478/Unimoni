//
//  Toggle.swift
//  UnimoniTest
//
//  Created by Purushottam Chandra on 17/03/19.
//  Copyright © 2019 Purushottam Chandra. All rights reserved.
//

import UIKit

@IBDesignable
class Toggle: BaseView {
    
    @IBInspectable var titleText : String = "2 Members" {
        didSet {
            titleLabel.text = titleText
        }
    }

    private var titleLabel: UILabel!
    
    override func setup() {
        backgroundColor = .clear
        let toggle = UIView(frame: bounds)
        toggle.backgroundColor = .strongBlue
        toggle.layer.cornerRadius = toggle.bounds.height / 2
        addSubview(toggle)
        titleLabel = UILabel(frame: bounds)
        titleLabel.text = titleText
        titleLabel.textColor = .white
        titleLabel.textAlignment = .center
        toggle.addSubview(titleLabel)
    }
}
