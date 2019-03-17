//
//  APIUrls.swift
//  UnimoniTest
//
//  Created by Purushottam Chandra on 18/03/19.
//  Copyright © 2019 Purushottam Chandra. All rights reserved.
//

import Foundation

enum APIUrls: String {
    case memberCount2 = "2"
    case memberCount4 = "4"
    
    func returnURL() -> String {
        return "http://demo4929648.mockable.io/IHOPolicyDetails?member_count=" + rawValue
    }
}

