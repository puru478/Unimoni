//
//  ActivityIndicator.swift
//  UnimoniTest
//
//  Created by Purushottam Chandra on 17/03/19.
//  Copyright © 2019 Purushottam Chandra. All rights reserved.
//

import UIKit

class ActivityIndicator: UIActivityIndicatorView {
    
    override init(style: UIActivityIndicatorView.Style = .whiteLarge) {
        super.init(style: style)
        _initRUIActivityIndicatorView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        _initRUIActivityIndicatorView()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        _initRUIActivityIndicatorView()
    }
    
    fileprivate func _initRUIActivityIndicatorView() {
        hidesWhenStopped = true
        color = UIColor.white
        frame = UIApplication.shared.keyWindow?.frame ?? CGRect()
        backgroundColor = UIColor.black.withAlphaComponent(0.7)
        center = (UIApplication.shared.keyWindow?.center) ?? CGPoint(x: 0.0, y: 0.0)
        hidesWhenStopped = true
        style = .whiteLarge
    }
}
