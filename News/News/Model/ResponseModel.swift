//
//  ResponseModel.swift
//  News
//
//  Created by Luiz Fernando dos Santos on 18/01/19.
//  Copyright © 2019 LFSantos. All rights reserved.
//

import Foundation

struct ResponseModel: Codable {
    let totalResults:    Int?
    let articles:        [Article]?

    enum CodingKeys: String, CodingKey {
        case totalResults       = "totalResults"
        case articles           = "articles"
    }

    static func decode(from json: [String: Any]) -> ResponseModel? {
        if let jsonData = try? JSONSerialization.data(withJSONObject: json, options: []) {
            if let decodedObject = try? JSONDecoder().decode(ResponseModel.self, from: jsonData) {
                return decodedObject
            }
        }
        return nil
    }
}
