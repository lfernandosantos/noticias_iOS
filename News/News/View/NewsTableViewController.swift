//
//  NewsTableViewController.swift
//  News
//
//  Created by Luiz Fernando dos Santos on 17/01/19.
//  Copyright © 2019 LFSantos. All rights reserved.
//

import UIKit
import Kingfisher

class NewsTableViewController: UITableViewController {

    let vm = NewsViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        let logo = UIImage(named: "news_logo")
        let imageView = UIImageView(image:logo)
        imageView.contentMode = .scaleAspectFit
        self.navigationItem.titleView = imageView

        reloadTable()

    }

    func reloadTable() {
        vm.updateData() { result in
            if result {
                self.tableView.reloadData()

            } else {
                print(self.vm.errorData)
            }
        }
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.getListData().count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        if let newsCell = cell as? NewsTVCell {
            newsCell.newsTitleLBL.text = vm.getListData()[indexPath.row].title
            newsCell.newsDescLBL.text = vm.getListData()[indexPath.row].description
            if let urlIMG = vm.getListData()[indexPath.row].urlImg {
                newsCell.newsIMG.kf.setImage(with: URL(string: urlIMG))
            }
            return newsCell
        }

        return cell
    }

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let article = vm.getListData()[indexPath.row]
        performSegue(withIdentifier: "goDetails", sender: article)
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailsTVC {
            destination.articleVM = ArticleViewModel(article: sender as! Article)
        }
    }

}
