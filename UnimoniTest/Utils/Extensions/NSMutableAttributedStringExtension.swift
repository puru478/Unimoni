//
//  NSMutableAttributedStringExtension.swift
//  UnimoniTest
//
//  Created by Purushottam Chandra on 17/03/19.
//  Copyright © 2019 Purushottam Chandra. All rights reserved.
//

import UIKit

extension NSMutableAttributedString {
    static func stringAttributes(string: String, color: UIColor = .black, font: UIFont = UIFont.systemFont(ofSize: 16)) -> NSMutableAttributedString {
        return NSMutableAttributedString(string: string, attributes: [NSAttributedString.Key.font: font, NSAttributedString.Key.foregroundColor: color])
    }
}
