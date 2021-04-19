//
//  NewsPostTableViewController.swift
//  VK_App
//
//  Created by Akbar on 3/25/21.
//

import UIKit

struct Post: Equatable {
    var name: String
    var avatar: UIImage
    var date: String
    var postContent: String
    var postImage: UIImage
    var postActions: [String]
}

class NewsPostTableViewController: UITableViewController {
    
    private var postCell = "PostCell"
    var posts = [
        Post(name: "Azamat Sharipov", avatar: #imageLiteral(resourceName: "bradpitt2"), date: "Yesterday at 19:20", postContent: "Вчера короче я иду такой по улице и увидел это, я был в замешательстве увиденном. Судите сами", postImage: #imageLiteral(resourceName: "galgadot3"), postActions: ["23","233","432","23K"]),
        Post(name: "Azamat Sharipov", avatar: #imageLiteral(resourceName: "bradpitt2"), date: "Yesterday at 19:20", postContent: " я был в замешательстве увиденном. Судите сами", postImage: #imageLiteral(resourceName: "galgadot1"), postActions: ["23","233","432","23K"])
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "NewsPostCellViewCell", bundle: nil), forCellReuseIdentifier: postCell)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return posts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: postCell, for: indexPath) as! NewsPostCellViewCell
        let post = posts[indexPath.row]
        cell.titleLabel.text = post.name
        cell.dateLabel.text = post.date
        cell.postContent.text = post.postContent
        cell.avatar.image = post.avatar
        cell.postImage.image = post.postImage
        cell.viewAmount.text = post.postActions[3]
        cell.likeButton.likesCount = Int(post.postActions[0]) ?? 0
        cell.commentButton.likesCount = Int(post.postActions[1]) ?? 0
        cell.shareButton.likesCount = Int(post.postActions[2]) ?? 0

        return cell
    }
}
