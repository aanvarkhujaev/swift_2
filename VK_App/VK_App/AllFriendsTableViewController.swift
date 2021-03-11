//
//  AllFriendsTableViewController.swift
//  VK_App
//
//  Created by Akbar on 3/10/21.
//

import UIKit


    
struct friend: Equatable {
    var name: String
    var image: UIImage
}

class AllFriendsTableViewController: UITableViewController {

    var friends = [
        friend(name: "Azamat Sharipov", image: #imageLiteral(resourceName: "willsmith1")),
        friend(name: "Nurmukhammad Mukhtorov", image: #imageLiteral(resourceName: "dimabilan1")),
        friend(name: "Jasur Abdujabborov", image: #imageLiteral(resourceName: "vandam2")),
        friend(name: "Kamila Sobirova", image: #imageLiteral(resourceName: "galgadot1")),
        friend(name: "Khojiakbar Abdurasulov", image: #imageLiteral(resourceName: "bradpitt3"))
    ]
    
    var selectedFriend: friend?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FriendTableViewCell
        let friend = friends[indexPath.row]
        cell.titleLabel.text = friend.name
        cell.photoImageView.image = friend.image
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        selectedFriend = friends[indexPath.row]
        performSegue(withIdentifier: "addFriend", sender: self)
    }
}
