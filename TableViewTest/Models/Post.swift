//
//  Post.swift
//  TableViewTest
//
//  Created by Sargis Mkhitaryan on 3/19/19.
//  Copyright © 2019 sargismk. All rights reserved.
//

import Foundation
import SwiftyJSON

class Post {
    let postId: UInt64
    let date: Date
    var user: User
    var message: String?
    var photoURL: URL?
    
    var calculatedMessageHeight: CGFloat = 0.0
    
    init(postId: UInt64, user: User, date: Date, message: String?, photoURLString: String?) {
        self.postId = postId
        self.date = date
        self.user = user
        self.message = message
        if let url = photoURLString {
            self.photoURL = URL(string: url)
        }
    }
    
    convenience init(json: JSON) {
        let user = User(json: json)
        let postId = json["id"].uInt64Value
        
        let dateString = json["date"].stringValue
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE MMM d HH:mm:ss Z yyyy"
        guard let date = dateFormatter.date(from: dateString) else {
            fatalError("Failed to parse date format.")
        }
        
        let photoURL = json["photo"].string
        let message = json["message"].string
        self.init(postId: postId, user: user, date: date, message: message, photoURLString: photoURL)
    }
}
