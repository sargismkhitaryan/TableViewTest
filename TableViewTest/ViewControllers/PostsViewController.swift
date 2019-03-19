//
//  ViewController.swift
//  TableViewTest
//
//  Created by Sargis Mkhitaryan on 3/19/19.
//  Copyright © 2019 sargismk. All rights reserved.
//

import UIKit

enum FetchState {
    case empty
    case loading
    case populated
    case finished
}

class PostsViewController: UIViewController {

    // MARK: - Properties
    
    var posts: [Post] = [Post]()
    var currentPage: Int = 1
    var state: FetchState = .populated
    
    @IBOutlet weak var postsTableView: UITableView!
    
    // MARK: - Overriden Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postsTableView.register(UINib(nibName: "PostTableViewCell", bundle: nil), forCellReuseIdentifier: "PostTableViewCell")
        fetchPosts()
    }
    
    // MARK: - Private Methods

    func fetchPosts() {
        if state == .populated {
            state = .loading
            DataManager.instance.fetchPosts(pageNumber: currentPage) { [unowned self] (result) in
                switch result {
                case .failure(let error):
                    print("error:\(error)")
                case .success(let res):
                    self.currentPage += 1
                    self.posts.append(contentsOf: res.posts)
                    if (res.total == self.currentPage) {
                        self.state = .finished
                    } else {
                        self.state = .populated
                    }
                    self.postsTableView.reloadData()
                }
            }
        }
    }
    
}

extension PostsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath) as! PostTableViewCell
        let viewModel = PostViewModel(post: posts[indexPath.row])
        cell.updatePostModel(viewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let messageHeight = PostTableViewCell.height(for: posts[indexPath.row], width: tableView.bounds.width)
        return messageHeight
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == tableView.numberOfRows(inSection: 0) - 1 {
            fetchPosts()
        }
    }
}
