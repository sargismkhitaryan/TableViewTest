//
//  PostTableViewCell.swift
//  TableViewTest
//
//  Created by Sargis Mkhitaryan on 3/19/19.
//  Copyright © 2019 sargismk. All rights reserved.
//

import UIKit
import SDWebImage

class PostTableViewCell: UITableViewCell {

    // MARK: - Properties
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var postDateLabel: UILabel!
    @IBOutlet weak var messageTextView: UITextView!
    
    // MARK: - Public Methods
    
    func updatePostModel(_ model: PostViewModel) {
        userNameLabel.text = model.userName
        postDateLabel.text = model.dateString
        messageTextView.text = model.message
        userImageView.sd_setImage(with: model.userImageURL, completed: nil)
    }
}
