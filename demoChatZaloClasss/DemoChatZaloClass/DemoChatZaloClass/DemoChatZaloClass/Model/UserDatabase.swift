//
//  UserDatabase.swift
//  DemoChatZaloClass
//
//  Created by Khắc Hùng on 30/05/2023.
//

import Foundation

class UsersDatabase {
    var usersDB: [User] = []
    
    init() {
        let userID1 = User(id: 1, fullName: "Nguyen Khac Hung", avatar: "a1", phone: "01111111", password: "", friends: [])
        let userID2 = User(id: 2, fullName: "Vu Dinh Duan", avatar: "a2", phone: "022222222", password: "", friends: [])
        let userID3 = User(id: 3, fullName: "Le Dinh Linh", avatar: "a3", phone: "033333333", password: "", friends: [])
        
        self.usersDB.append(userID1)
        self.usersDB.append(userID2)
        self.usersDB.append(userID3)
    }
    
    func getUserDetailByID(userID: Int) -> User? {
        for anUser in usersDB {
            if anUser.id == userID {
                return anUser
            }
        }
        return nil
    }
}
