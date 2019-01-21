//
//  ArticleViewModel.swift
//  News
//
//  Created by Luiz Fernando dos Santos on 18/01/19.
//  Copyright © 2019 LFSantos. All rights reserved.
//

import Foundation
import UIKit


class ArticleViewModel {

    let title:          String
    let image:          UIImage
    let author:         String
    var publishedAt:    String
    let content:        String

    init(article: Article) {
        self.title          =   article.title ?? ""
        self.author         =   article.author ?? ""
        self.publishedAt    =   article.publishedAt ?? ""
        self.content        =   article.content ?? ""
        let img = UIImageView()
        img.kf.setImage(with: URL(string: article.urlImg!))
        self.image = img.image ?? UIImage(named: "no_image")!

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormatsValue.dateHHmmssSSSz.rawValue

        if let date = dateFormatter.date(from: self.publishedAt) {

            dateFormatter.dateFormat = "dd/MM/yyyy HH:mm"
            self.publishedAt = dateFormatter.string(from: date)

        } else {

            dateFormatter.dateFormat = DateFormatsValue.dateHHmmssZ.rawValue
            dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
            let date = dateFormatter.date(from:publishedAt)

            dateFormatter.dateFormat = DateFormatsValue.dateHHmm.rawValue
            if let formatedDate = date {
                self.publishedAt = dateFormatter.string(from: formatedDate )
            }

        }

    }


    func getArticleCell(_ cell: UITableViewCell?) -> UITableViewCell {
        if let articleCell = cell as? DetailsTVCell {
            articleCell.artcileIMG.image = self.image
            articleCell.titleLBL.text = self.title
            articleCell.contentArticleTV.text = self.content
            articleCell.authorArticleLBL.text = self.author
            articleCell.dataArticleLBL.text = self.publishedAt

            return articleCell
        }

        return UITableViewCell()
    }
}

enum DateFormatsValue: String {
    case dateHHmm       = "dd/MM/yyyy HH:mm"
    case dateHHmmssZ    = "yyyy-MM-dd'T'HH:mm:ssZ"
    case dateHHmmssSSSz = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
}

