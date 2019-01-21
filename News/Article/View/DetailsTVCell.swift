//
//  DetailsTVCell.swift
//  News
//
//  Created by Luiz Fernando dos Santos on 18/01/19.
//  Copyright © 2019 LFSantos. All rights reserved.
//

import UIKit

class DetailsTVCell: UITableViewCell {

    @IBOutlet weak var titleLBL: UILabel!
    @IBOutlet weak var authorArticleLBL: UILabel!
    @IBOutlet weak var dataArticleLBL: UILabel!
    @IBOutlet weak var artcileIMG: UIImageView!
    @IBOutlet weak var contentArticleTV: UITextView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
