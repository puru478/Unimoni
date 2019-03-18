//
//  APICalls.swift
//  UnimoniTest
//
//  Created by Purushottam Chandra on 18/03/19.
//  Copyright © 2019 Purushottam Chandra. All rights reserved.
//

import Foundation

class APICalls {
    static func getDataFor(memberCount: AppConstants.appScenarios, apiCompletionHandler: @escaping ((APIResponseModel) -> Void)) {
        var endpoint : API.Endpoints
        switch memberCount {
        case .memberCount2:
            endpoint = .memberCount2
        case .memberCount4:
            endpoint = .memberCount4
        }
        let task = API.request(endpoint) { (data, response, error) in
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(APIResponseModel.self, from: data ?? Data())
                apiCompletionHandler(result)
            } catch let err {
                print("Err", err)
                let error = NSError(domain: "Data", code: 0, userInfo: [NSLocalizedDescriptionKey: "Parsing Error"])
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}
