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

    static let photoHeight: CGFloat = 280.0
    static let font: UIFont = UIFont.systemFont(ofSize: 14.0)
    
    // MARK: - Properties
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var postDateLabel: UILabel!
    @IBOutlet weak var messageTextView: UITextView!
    @IBOutlet weak var postContentView: UIView!
    @IBOutlet weak var photoHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var postPhotoImageView: UIImageView!
    
    // MARK: - Overriden Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        messageTextView.font = type(of: self).font
        postContentView.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 0.4461419092)
        postContentView.layer.borderWidth = 2.0
        postContentView.layer.cornerRadius = 5.0
    }
    
    // MARK: - Public Methods
    
    func updatePostModel(_ model: PostViewModel) {
        userNameLabel.text = model.userName
        postDateLabel.text = model.dateString
        messageTextView.text = model.message
        userImageView.sd_setImage(with: model.userImageURL) { [weak self] (image, _, _, _) in
            if let image = image {
                self?.userImageView.image = image.circle
            }
        }
        if let url = model.photoURL {
            photoHeightConstraint.constant = type(of: self).photoHeight
            postPhotoImageView.sd_setImage(with: url, completed: nil)
        } else {
            photoHeightConstraint.constant = 0.0
        }
    }
    
    static func height(for post: Post, width: CGFloat) -> CGFloat {
        if post.calculatedMessageHeight != 0 {
            return post.calculatedMessageHeight
        }
        
        let userInfoHeight: CGFloat = 106.0
        var height = userInfoHeight
        if let message = post.message as NSString? {
            let size = CGSize(width: width - 70.0, height: CGFloat.greatestFiniteMagnitude)
            let attributes = [NSAttributedString.Key.font: PostTableViewCell.font]
            height += message.boundingRect(with: size, options: [.usesLineFragmentOrigin, .usesFontLeading], attributes: attributes, context: nil).height
        }
        if post.photoURL != nil {
            height += PostTableViewCell.photoHeight
        }
        post.calculatedMessageHeight = height
        return height
    }
}
