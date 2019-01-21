//
//  RequestData.swift
//  News
//
//  Created by Luiz Fernando dos Santos on 17/01/19.
//  Copyright © 2019 LFSantos. All rights reserved.
//

import Foundation
import Alamofire

struct RequestData {
    let path:     URL
    let method:   HTTPMethod
    let params:   [String: Any]?

    init(path: NewsAPI, method: HTTPMethod, params: [String: Any]? = nil) {
        self.path    = URL(string: path.baseURL.absoluteString + path.path)!
        self.method  = method
        self.params  = params
    }
}
