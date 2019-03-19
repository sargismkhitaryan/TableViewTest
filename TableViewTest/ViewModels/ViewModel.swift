//
//  ViewModel.swift
//  TableViewTest
//
//  Created by Sargis Mkhitaryan on 3/19/19.
//  Copyright © 2019 sargismk. All rights reserved.
//

import Foundation

class PostViewModel {
    private let post: Post
    
    init(post: Post) {
        self.post = post
    }
    
    var userName: String {
        return post.user.userName
    }
    
    var dateString: String {
        return "Yesterday"
    }
    
    var message: String? {
        return post.message
    }
    
    var userImageURL: URL? {
        return post.user.photoURL
    }
}
