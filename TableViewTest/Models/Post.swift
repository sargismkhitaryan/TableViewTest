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
    var photoURLString: String?
    
    init(postId: UInt64, user: User, date: Date, message: String?, photoURLString: String?) {
        self.postId = postId
        self.date = date
        self.user = user
        self.message = message
        self.photoURLString = photoURLString
    }
    
    convenience init(json: JSON) {
        let user = User(json: json)
        let postId = json["id"].uInt64Value
        let date = Date()
        let photoURL = json["photo"].string
        let message = json["message"].string
        self.init(postId: postId, user: user, date: date, message: message, photoURLString: photoURL)
    }
}
