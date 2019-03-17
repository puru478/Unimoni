//
//  APICalls.swift
//  UnimoniTest
//
//  Created by Purushottam Chandra on 18/03/19.
//  Copyright © 2019 Purushottam Chandra. All rights reserved.
//

import Foundation

class APICalls {
    static func memberCount2(apiCompletionHandler: @escaping ((APIResponseModel) -> Void)) {
        let task = API.request(.memberCount2) { (data, response, error) in
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
    
    static func memberCount4(apiCompletionHandler: @escaping ((APIResponseModel) -> Void)) {
        let task = API.request(.memberCount4) { (data, response, error) in
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
