//
//  NewsAPI.swift
//  News
//
//  Created by Luiz Fernando dos Santos on 17/01/19.
//  Copyright © 2019 LFSantos. All rights reserved.
//

import Foundation

protocol NewsAPIPath {
    var baseURL: URL { get }
    var path: String { get }
}

enum NewsAPI {
    case allNews
}

extension NewsAPI: NewsAPIPath {

    public var baseURL: URL {
        return URL(string: "https://s3.glbimg.com/v1/")!
    }

    var path: String {
        switch self {
        case .allNews:
            return "AUTH_0a546877ae934340a12a639673da6690/010bf5/challenge/news/api/content.json"
        }
    }
}
