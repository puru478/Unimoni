//
//  MainViewModel.swift
//  UnimoniTest
//
//  Created by Purushottam Chandra on 18/03/19.
//  Copyright © 2019 Purushottam Chandra. All rights reserved.
//

import UIKit

class MainViewModel: TableViewModelProtocol {
    var tableItemTypes: [CellRepresentable.Type] = [PlanCellVM.self]
    
    var tableItems: [CellRepresentable] = []
    
    var reloadTable: completionHandler = nil
    
    init() {
        
    }
    
    func callAPIfor(numberOfMembers: AppConstants.appScenarios) {
        Helper.showActivityIndicator()
        APICalls.getDataFor(memberCount: numberOfMembers) { [weak self] (apiResponse) in
            guard let strongSelf = self else {return}
            strongSelf.setupWith(responseModel: apiResponse)
        }
    }
    
    private func setupWith(responseModel: APIResponseModel) {
        var viewModel = [CellRepresentable]()
        responseModel.plans?.forEach({ (planModel) in
            let name = NSMutableAttributedString.stringAttributes(string: planModel.planName ?? "", color: .gray, font: .boldSystemFont(ofSize: 18))
            let cost = NSMutableAttributedString.stringAttributes(string: "\u{20B9} \(planModel.planCost ?? 0)", color: .strongBlue, font: .boldSystemFont(ofSize: 18))
            let details = NSMutableAttributedString.stringAttributes(string: "BUY NOW FOR \u{20B9} \(planModel.planCost ?? 0)\n(Up to 2 family members)", color: .white, font: .systemFont(ofSize: 12))
            viewModel.append(PlanCellVM(name: name, cost: cost, details: details, benefits: planModel.benefits ?? [BenefitResponseModel()]))
        })
        tableItems = viewModel
        reloadTable?()
    }
}
