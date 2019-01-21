//
//  NewsService.swift
//  News
//
//  Created by Luiz Fernando dos Santos on 17/01/19.
//  Copyright © 2019 LFSantos. All rights reserved.
//

import Foundation
import Alamofire

protocol BaseServiceAPI {
    func request(endpoint: RequestData, completion: @escaping (ServicesAPIResult<Any, String>) -> Void)
}

extension BaseServiceAPI {
    func request(endpoint: RequestData, completion: @escaping (ServicesAPIResult<Any, String>) -> Void) {
        if endpoint.method == .get {

            Alamofire.request(endpoint.path, method: endpoint.method, parameters: endpoint.params,
                              encoding: URLEncoding.queryString).responseJSON() { result in

                                switch result.result {
                                case .success(let response):
                                    if result.response?.statusCode == 200 || result.response?.statusCode == 201 {

                                        completion(ServicesAPIResult.success(response))
                                    } else {
                                        completion(ServicesAPIResult.failure(self.handleAPIError(response: response)))
                                    }
                                case .failure(let error):
                                    completion(ServicesAPIResult.failure(error.localizedDescription))
                                }
            }
        }
    }

    
    private func handleAPIError(response: Any) -> String {
        guard let json = response as? [String: Any] else {
            return "API ERROR"
        }
        return json["message"] as! String
    }
}

public enum ServicesAPIResult<T, String> {
    case success(T)
    case failure(String)
}
