//
//  ConversationModel.swift
//  DemoChatZaloClass
//
//  Created by Nguyễn Mạnh Linh on 22/05/2023.
//

import Foundation

class Conversation {
    var id: Int = 0
    var name: String = ""
    var members: [User] = []
    var messages: [Message] = []
    var avatar: String = ""
    var managers: [User] = []
    
    init(id: Int, name: String, members: [User], messages: [Message], avatar: String , managers: [User]) {
        self.id = id
        self.name = name
        self.members = members
        self.messages = messages
        self.managers = managers
    }
}

