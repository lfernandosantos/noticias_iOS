//
//  BaseService.swift
//  News
//
//  Created by Luiz Fernando dos Santos on 17/01/19.
//  Copyright © 2019 LFSantos. All rights reserved.
//

import Foundation

struct NewsService: BaseServiceAPI {
    internal func requestNews(completion: @escaping (ServicesAPIResult<[Article], String>) -> Void) {
        let endpoint = RequestData(path: .allNews, method: .get, params: nil)

        self.request(endpoint: endpoint) { result in

            switch result {
            case .success(let json):
                var news: [Article] = []
                if let responseJSONData = json as? [String: Any] {
                    if let responseData = ResponseModel.decode(from: responseJSONData) {
                        if let articles = responseData.articles {
                            news = articles
                        }
                    }
                }
                completion(ServicesAPIResult.success(news))
            case .failure(let error):
                completion(ServicesAPIResult.failure(error))
            }
        }
    }
}


