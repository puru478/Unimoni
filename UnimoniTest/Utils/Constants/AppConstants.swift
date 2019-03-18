//
//  AppConstants.swift
//  UnimoniTest
//
//  Created by Purushottam Chandra on 17/03/19.
//  Copyright © 2019 Purushottam Chandra. All rights reserved.
//

import UIKit

typealias completionHandler = (()->Void)?


class AppConstants {
    
    enum appScenarios {
        case memberCount2, memberCount4
    }
    
    enum benefitImages : String {
        case mobile = "IHO_MOBILE_ICON"
        case checkUp = "IHO_CHECKUP_ICON"
        case pharmacy = "IHO_PHARMACY_ICON"
        case dental = "IHO_DENTAL_ICON"
        case discount = "IHO_DISCOUNT_CARD_ICON"
        case diet = "IHO_DIET_ICON"
        case consultation = "IHO_CONSULATION_ICON"
    }
}
