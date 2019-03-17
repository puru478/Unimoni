//
//  APIResponseModel.swift
//  UnimoniTest
//
//  Created by Purushottam Chandra on 18/03/19.
//  Copyright © 2019 Purushottam Chandra. All rights reserved.
//

import Foundation

class APIResponseModel: Codable {
    var plans : [PlanResponseModel]?
    var responseStatus : Int?

    private enum CodingKeys: String, CodingKey {
        case plans
        case responseStatus
    }
}

class PlanResponseModel: Codable {
    var benefits : [BenefitResponseModel]?
    var planCost : Int?
    var planDiscCost : Int?
    var planName : String?
    var planSaveUpto : Int?

    private enum CodingKeys: String, CodingKey {
        case benefits
        case planCost = "plan_cost"
        case planDiscCost = "plan_disc_cost"
        case planName = "plan_name"
        case planSaveUpto = "plan_save_upto"
    }
}

class BenefitResponseModel: Codable {
    var benefitIcon : String?
    var benefitIconLocal : String?
    var benefitIconNetwork : String?
    var benefitSubTitle : String?
    var benefitTitle : String?

    private enum CodingKeys: String, CodingKey {
        case benefitIcon = "benefit_icon"
        case benefitIconLocal = "benefit_icon_local"
        case benefitIconNetwork = "benefit_icon_network"
        case benefitSubTitle = "benefit_sub_title"
        case benefitTitle = "benefit_title"
    }

}
