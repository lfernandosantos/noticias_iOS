//
//  NewsViewModel.swift
//  News
//
//  Created by Luiz Fernando dos Santos on 17/01/19.
//  Copyright © 2019 LFSantos. All rights reserved.
//

import Foundation
import UIKit

protocol NewsViewModelProtocol {
    func updateData(completion: @escaping(Bool) -> Void)
    func getListData() -> [Article]
    func getError() -> String
}

class NewsViewModel: NewsViewModelProtocol {

    private var newsList: [Article] = []
    var errorData: String = "Generic error!"

    func updateData(completion: @escaping(Bool) -> Void) {
        NewsService().requestNews() { results in
            switch results {
            case .success(let newsResult):
                self.newsList = newsResult
                completion(true)
                break

            case .failure(let error):
                self.errorData = error
                completion(false)
                break
            }
        }
    }


    func getListData() -> [Article] {
        return newsList
    }

    func getError() -> String {
        return errorData
    }

}
