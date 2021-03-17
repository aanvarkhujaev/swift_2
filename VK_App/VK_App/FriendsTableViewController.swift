//
//  FriendsTableViewController.swift
//  VK_App
//
//  Created by Akbar on 3/10/21.
//

import UIKit

class FriendsTableViewController: UITableViewController {
    var friends = [Friend] ()
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
    
    @IBAction func addFriend(segue: UIStoryboardSegue) {
        if segue.identifier == "addFriend",
        let sourceVC = segue.source as? AllFriendsTableViewController,
            let selectedFriend = sourceVC.selectedFriend{
            //добавляем выбранного друга
            if !friends.contains(selectedFriend) {
                friends.append(selectedFriend)
                tableView.reloadData()
            }
            
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        selectedFriend = friends[indexPath.row]
        performSegue(withIdentifier: "toPhoto", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if segue.identifier == "toPhoto", let destination = segue.destination as? PhotosViewController {
            destination.photos = selectedFriend!.photos
        }
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            // Если была нажата кнопка «Удалить»
            if editingStyle == .delete {
            // Удаляем город из массива
                friends.remove(at: indexPath.row)
            // И удаляем строку из таблицы
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        }
}
