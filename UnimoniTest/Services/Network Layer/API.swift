//
//  API.swift
//  UnimoniTest
//
//  Created by Purushottam Chandra on 18/03/19.
//  Copyright © 2019 Purushottam Chandra. All rights reserved.
//

import Foundation

open class API {
    
    public enum Endpoints {
        case memberCount2
        case memberCount4
        
        public var path: String {
            switch self {
            case .memberCount2:
                return APIUrls.memberCount2.returnURL()
            case .memberCount4:
                return APIUrls.memberCount4.returnURL()
            }
        }
    }
    
    static func request(_ endpoint: API.Endpoints, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        var request = URLRequest(url: URL(string: endpoint.path)!)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            completionHandler(data, response, error)
        })
        return task
    }
}
