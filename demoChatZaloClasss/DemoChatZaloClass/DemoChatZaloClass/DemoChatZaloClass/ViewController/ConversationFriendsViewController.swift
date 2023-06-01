//
//  ConversationFriendsViewController.swift
//  DemoChatZaloClass
//
//  Created by Lê Đình Linh on 25/05/2023.
//

import UIKit

class ConversationFriendsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tblFriends: UITableView!
    var friendsOfUser: [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initFriendsListData()
    }
    
    func initFriendsListData() {
        let friend1 = User(id: 1, fullName: "Đinh Tiên Hoàng", avatar: "a1", phone: "", password: "", friends: [])
        let friend2 = User(id: 2, fullName: "Vu Dinh Duan", avatar: "a2", phone: "", password: "", friends: [])
        let friend3 = User(id: 3, fullName: "Nguyen Khac Hung", avatar: "a3", phone: "", password: "", friends: [])
        let friend4 = User(id: 4, fullName: "Đinh Linh Tinh", avatar: "a4", phone: "",password: "", friends: [])
        friendsOfUser.append(friend1)
        friendsOfUser.append(friend2)
        friendsOfUser.append(friend3)
        friendsOfUser.append(friend4)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendsOfUser.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblFriends.dequeueReusableCell(withIdentifier: "FriendsCellIndentifier", for: indexPath)
        let imgIcon = cell.viewWithTag(201) as! UIImageView
        imgIcon.image = UIImage(named: friendsOfUser[indexPath.row].avatar)
        imgIcon.layer.cornerRadius = 30
        let lblUserNames = cell.viewWithTag(202) as! UILabel
        lblUserNames.text = friendsOfUser[indexPath.row].fullName
        return cell
    }
    

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Xoá") { (action, view, completion) in
            self.deleteFriend(at: indexPath.row)
            completion(true)
        }
        deleteAction.backgroundColor = .red
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        return configuration
    }
    
    func deleteFriend(at index: Int) {
        friendsOfUser.remove(at: index)
        tblFriends.reloadData()
    }
}
