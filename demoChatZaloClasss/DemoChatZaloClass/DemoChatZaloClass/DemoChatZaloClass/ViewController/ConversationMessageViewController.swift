//
//  ConversationMessageViewController.swift
//  DemoChatZaloClass
//
//  Created by lê đình linh on 22/05/2023.
//

import UIKit

import Alamofire

class ConversationMessageViewController: UIViewController, UITableViewDataSource, UITableViewDelegate , UITextViewDelegate, UITextFieldDelegate {
    
 
    
    @IBOutlet weak var textViewMessage: UITextField!
    
    @IBOutlet weak var tblMessage: UITableView!
    var messages: [Message] = []
    var userDatabaseObject  = UsersDatabase()
    override func viewDidLoad() {
        super.viewDidLoad()
        textViewMessage.delegate = self
        tblMessage.dataSource = self
        tblMessage.delegate = self
        
        tblMessage.register(UINib(nibName: "ChatCell", bundle: nil), forCellReuseIdentifier: "ChatCell")
        tblMessage.register(UINib(nibName: "MessageByFriendTableViewCell", bundle: nil), forCellReuseIdentifier: "MessageByFriendIdentifier")
        tblMessage.register(UINib(nibName: "MessageByLoggedInUserTableViewCell", bundle: nil), forCellReuseIdentifier: "MessageByLoggedInUserIdentifier")
        textViewMessage.delegate = self
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let sender = userDatabaseObject.getUserDetailByID(userID: messages[indexPath.row].senderID) {
            if messages[indexPath.row].senderID == 1 {
                let messageCellByMe = tblMessage.dequeueReusableCell(withIdentifier: "MessageByLoggedInUserIdentifier") as! MessageByLoggedInUserTableViewCell
                messageCellByMe.lblMessageByLoggedInUser.text = messages[indexPath.row].content
                messageCellByMe.imgMessagerByLoggedInUser.image = UIImage(named: sender.avatar)
                messageCellByMe.layer.cornerRadius = 30
                return messageCellByMe
            }
            let messageCellByFriend = tblMessage.dequeueReusableCell(withIdentifier: "MessageByFriendIdentifier") as! MessageByFriendTableViewCell
            messageCellByFriend.lblMessageByFriend.text = messages[indexPath.row].content
            messageCellByFriend.lblNameMessagerByFriend.text = sender.fullName
            messageCellByFriend.imgMessagerByFriend.image = UIImage(named: sender.avatar)
            messageCellByFriend.layer.cornerRadius = 30
            return messageCellByFriend
        } else {
            return UITableViewCell()
        }
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == textViewMessage {
            sendChatMessage()
            textViewMessage.text = ""
            return false
        }
        return true
    }
    
    func sendChatMessage() {
        if let content = textViewMessage.text {
            let message = Message(id: 1, content: content, senderID: 1, conversationID: 1, time: "", status: "")
            messages.append(message)
            tblMessage.reloadData()
            let indexPath = IndexPath(row: messages.count - 1, section: 0)
            tblMessage.scrollToRow(at: indexPath, at: .bottom, animated: true)
            textViewMessage.text = ""
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
