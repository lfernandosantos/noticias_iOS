//
//  ViewController.swift
//  News
//
//  Created by Luiz Fernando dos Santos on 17/01/19.
//  Copyright © 2019 LFSantos. All rights reserved.
//

import UIKit

class DetailsTVC: UITableViewController {

    var articleVM: ArticleViewModel!


    override func viewDidLoad() {
        super.viewDidLoad()


        self.navigationItem.title = "NEWS"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor(red: 0/255.0, green: 122/255.0, blue: 255/255.0, alpha: 1)]

        

    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "articleDetail")

        return articleVM.getArticleCell(cell)
    }

    
}

