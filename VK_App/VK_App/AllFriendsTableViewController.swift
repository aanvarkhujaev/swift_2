//
//  AllFriendsTableViewController.swift
//  VK_App
//
//  Created by Akbar on 3/10/21.
//

import UIKit


    
struct Friend: Equatable {
    var name: String
    var image: UIImage
    var photos: [UIImage]
}

class AllFriendsTableViewController: UITableViewController {

    var friends = [
        Friend(name: "Azamat Sharipov", image: #imageLiteral(resourceName: "willsmith1"),
               photos: [
                #imageLiteral(resourceName: "willsmith1"),#imageLiteral(resourceName: "willsmith3"),#imageLiteral(resourceName: "willsmith2")
               ]),
        Friend(name: "Nurmukhammad Mukhtorov", image: #imageLiteral(resourceName: "dimabilan1"),
               photos: [
                #imageLiteral(resourceName: "dimabilan3"),#imageLiteral(resourceName: "dimabilan2"),#imageLiteral(resourceName: "dimabilan1")
               ]),
        Friend(name: "Jasur Abdujabborov", image: #imageLiteral(resourceName: "vandam2"),
               photos: [
                #imageLiteral(resourceName: "vandam2"),#imageLiteral(resourceName: "vandam3"),#imageLiteral(resourceName: "vandam1")
               ]),
        Friend(name: "Kamila Sobirova", image: #imageLiteral(resourceName: "galgadot1"),
               photos: [
                #imageLiteral(resourceName: "galgadot1"),#imageLiteral(resourceName: "galgadot3"),#imageLiteral(resourceName: "galgadot2")
               ]),
        Friend(name: "Khojiakbar Abdurasulov", image: #imageLiteral(resourceName: "bradpitt3"),
               photos: [
                #imageLiteral(resourceName: "bradpitt3"),#imageLiteral(resourceName: "bradpitt2"),#imageLiteral(resourceName: "bradpitt1")
               ])
    ]
    
    var selectedFriend: Friend?
    
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
