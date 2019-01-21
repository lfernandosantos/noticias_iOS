//
//  News.swift
//  News
//
//  Created by Luiz Fernando dos Santos on 17/01/19.
//  Copyright © 2019 LFSantos. All rights reserved.
//

import Foundation

struct Article: Codable {
    let urlImg:       String?
    let title:        String?
    let description:  String?
    let author:       String?
    let publishedAt:  String?
    let content:      String?


    enum CodingKeys: String, CodingKey {
        case urlImg          =  "urlToImage"
        case title           =  "title"
        case description     =  "description"
        case author          =  "author"
        case publishedAt     =  "publishedAt"
        case content         =  "content"
    }

    static func decode(from json: [String: Any]) -> Article? {
        if let jsonData = try? JSONSerialization.data(withJSONObject: json, options: []) {
            if let decodedObject = try? JSONDecoder().decode(Article.self, from: jsonData) {
                return decodedObject
            }
        }
        return nil
    }
}
