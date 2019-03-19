//
//  User.swift
//  TableViewTest
//
//  Created by Sargis Mkhitaryan on 3/19/19.
//  Copyright © 2019 sargismk. All rights reserved.
//

import Foundation

class User {
    var userId: String
    var userName: String
    var photoURLString: String?
    
    init(userId: String, userName: String, photoURLString: String?) {
        self.userId = userId
        self.userName = userName
        self.photoURLString = photoURLString
    }
}
