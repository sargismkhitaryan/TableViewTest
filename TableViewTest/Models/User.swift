//
//  User.swift
//  TableViewTest
//
//  Created by Sargis Mkhitaryan on 3/19/19.
//  Copyright © 2019 sargismk. All rights reserved.
//

import Foundation
import SwiftyJSON

class User {
    var userId: String
    var userName: String
    var photoURL: URL?
    
    init(userId: String, userName: String, photoURLString: String?) {
        self.userId = userId
        self.userName = userName
        if let url = photoURLString {
            self.photoURL = URL(string: url)
        }
    }
    
    convenience init(json: JSON) {
        let userId = json["user_id"].stringValue
        let userName = json["user_name"].stringValue
        let photoURLString = json["user_pic"].string
        self.init(userId: userId, userName: userName, photoURLString: photoURLString)
    }
}
