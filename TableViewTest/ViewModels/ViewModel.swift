//
//  ViewModel.swift
//  TableViewTest
//
//  Created by Sargis Mkhitaryan on 3/19/19.
//  Copyright © 2019 sargismk. All rights reserved.
//

import Foundation

class PostViewModel {
    
    var dateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, yyyy h:mm a "
        return dateFormatter
    }
    
    private let post: Post
    
    init(post: Post) {
        self.post = post
    }
    
    var userName: String {
        return post.user.userName
    }
    
    var dateString: String {
        return dateFormatter.string(from: post.date)
    }
    
    var message: String? {
        return post.message
    }
    
    var userImageURL: URL? {
        return post.user.photoURL
    }
    
    var photoURL: URL? {
        return post.photoURL
    }
}
