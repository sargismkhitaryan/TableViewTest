//
//  DataManager.swift
//  TableViewTest
//
//  Created by Sargis Mkhitaryan on 3/19/19.
//  Copyright © 2019 sargismk. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

enum Result<T> {
    case success(T)
    case failure(String)
}

struct API {
    static let post = "http://citymani.ezrdv.org/main/test"
}

class DataManager {
    
    private init() {}
    
    static let instance = DataManager()
    
    func fetchPosts(pageNumber: Int, complete: @escaping (_ result: Result<(posts: [Post], total: Int)>) -> ()) {
        let parameters: Parameters = [
            "page": pageNumber
        ]
        Alamofire.request(API.post, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseJSON {
            switch $0.result {
            case .failure(let error):
                print("error: \(error)")
            case .success(let value):
                let json: JSON = JSON(value)
                let total = json["total_pages"].intValue
                let postsJSON = json["posts"].arrayValue
                var posts = [Post]()
                posts.reserveCapacity(postsJSON.count)
                for postJson in postsJSON {
                    let post = Post(json: postJson)
                    posts.append(post)
                }
                complete(.success((posts, total)))
                print("json:\(json)")
            }
        }
    }
}
