//
//  ShadowView.swift
//  UnimoniTest
//
//  Created by Purushottam Chandra on 18/03/19.
//  Copyright © 2019 Purushottam Chandra. All rights reserved.
//

import UIKit

@IBDesignable
class ShadowView: UIView {

    @IBInspectable var shadowColor: CGColor = UIColor.darkGray.cgColor
    @IBInspectable var shadowRadius: CGFloat = 3
    @IBInspectable var cornerRadius: CGFloat = 0


    override func layoutSubviews() {
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = false
        layer.shadowColor = shadowColor
        layer.shadowOffset = CGSize.zero
        layer.shadowOpacity = 0.5
        layer.shadowRadius = shadowRadius
    }
    
}
