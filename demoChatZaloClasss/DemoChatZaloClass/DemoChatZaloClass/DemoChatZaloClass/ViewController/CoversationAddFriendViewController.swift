//
//  CoversationAddFriendViewController.swift
//  DemoChatZaloClass
//
//  Created by Lê Đình Linh on 31/05/2023.
//

import UIKit

class CoversationAddFriendViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {
    @IBOutlet weak var tblAddFriend: UITableView!
    var user: [User] = []
    var filteredUser: [User] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        filteredUser = user.filter { $0.id != 1 }
        tblAddFriend.dataSource = self
        tblAddFriend.delegate = self
        tblAddFriend.register(UINib(nibName: "ListAddFriendTableViewCell", bundle: nil), forCellReuseIdentifier: "ListAddFriendIdentifier")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredUser.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let addFriend = tblAddFriend.dequeueReusableCell(withIdentifier: "ListAddFriendIdentifier") as! ListAddFriendTableViewCell
        addFriend.lblAddFriendName.text = filteredUser[indexPath.row].fullName
        addFriend.imgAddFriend.image = UIImage(named: filteredUser[indexPath.row].avatar)
        return addFriend
    }
    
    
    
}
