//
//  ConversationViewController.swift
//  DemoChatZaloClass
//
//  Created by Lê Đình Linh on 22/05/2023.
//

import UIKit
import Alamofire
import MessageKit

class ConversationViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var lblHienThiKetQua: UILabel!
   
    @IBOutlet weak var tblConversations: UITableView!
    let danhSachAnh = ["a1","a2","a3","a4"]
    var conversations: [Conversation] = []
    var filteredData : [Conversation] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
        tblConversations.dataSource = self
        tblConversations.delegate = self
//        lblHienThiKetQua.isHidden = true
    
    }
    
   
    
    func initData(){
        var messagesOfConversation1: [Message] = []
        let message1OfConversation1 = Message(id: 1, content: "Alo mn oi", senderID: 1, conversationID: 1, time: "20h20", status: "Thanh cong")
        let message2OfConversation1 = Message(id: 2, content: "Toi nay hoc 20h30 nhe", senderID: 2, conversationID: 1, time: "20h20", status: "Thanh cong")
        let message3OfConversation1 = Message(id: 3, content: "Hello", senderID: 1, conversationID: 1, time: "20h20", status: "Thanh cong")
        let message40fConversation1 = Message(id: 4, content: "Toi nay hoc 20h30 nhe", senderID: 3, conversationID: 1, time: "20h20", status: "Thanh cong")
        let message50fConversation1 = Message(id: 5, content: "Hello", senderID: 2, conversationID: 1, time: "20h20", status: "Thanh cong")
        messagesOfConversation1.append(message1OfConversation1)
        messagesOfConversation1.append(message2OfConversation1)
        messagesOfConversation1.append(message3OfConversation1)
        messagesOfConversation1.append(message40fConversation1)
        messagesOfConversation1.append(message50fConversation1)
        
        var messagesOfConversation2: [Message] = []
        let message1OfConversation2 = Message(id: 1, content: "Toi nay ra ngoai quan an com nhe", senderID: 2, conversationID: 2, time: "19h", status: "Thanh Cong")
        messagesOfConversation2.append(message1OfConversation2)
        
        let conversation1 = Conversation(id: 1, name: "K17-VietDevelopers", members: [],messages: messagesOfConversation1, avatar: "a1" ,  managers: [])
        
        
        let conversation2 = Conversation(id: 2, name: "Nhóm gia đình - Private", members: [],messages: messagesOfConversation2, avatar: "a2" , managers: [])
        
        let conversation3 = Conversation(id: 3, name: "Công ty VietDevelopers", members: [],messages: [], avatar: "a3" , managers: [])
        conversations.append(conversation1)
        conversations.append(conversation2)
        conversations.append(conversation3)
        var friendOfUser: [User] = []
        let friendOfUser1 = User(id: 1, fullName: "Nguyễn Văn A", avatar: "anh1", phone: "0987654321", password: "1234", friends: [])
        let friendOfUser2 = User(id: 2, fullName: "Lê Văn B", avatar: "anh1", phone: "0987654321", password: "1234", friends: [])
        let friendOfUser3 = User(id: 3, fullName: "Lê Văn C", avatar: "anh1", phone: "0987654321", password: "1234", friends: [])

        friendOfUser.append(friendOfUser1)
        friendOfUser.append(friendOfUser2)
        friendOfUser.append(friendOfUser3)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let messagesConversationVC = self.storyboard!.instantiateViewController(withIdentifier: "ConversationMessageViewController") as! ConversationMessageViewController
        // khoi tao ra man hinh messagesConversationVC
        messagesConversationVC.messages = conversations[indexPath.row].messages
        // do du lieu mang messages cua man hinh messagesConversationVC = du lieu messages cua cuoc hoi thoai khi cham.(touch) vao
        show(messagesConversationVC, sender: self)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return conversations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblConversations.dequeueReusableCell(withIdentifier:"ConversationCellIndentifier")!
        let lblConversationName = cell.viewWithTag(101) as! UILabel
        lblConversationName.text = conversations[indexPath.row].name
        let imgIcon = cell.viewWithTag(103) as! UIImageView
        imgIcon.image = UIImage(named: danhSachAnh[indexPath.row])
        imgIcon.layer.cornerRadius = 30
        return cell
    }
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        filteredData = []
//            for word in conversations {
//                if word.name.uppercased().contains(searchText.uppercased()) {
//                    filteredData.append(word)
//                }
//            }
//            if filteredData.count == 0 {
//                lblHienThiKetQua.isHidden = false
//                tblConversations.isHidden = true
//            } else {
//                lblHienThiKetQua.isHidden = true
//                tblConversations.isHidden = false
//            }
//            tblConversations.reloadData()
//        }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}



