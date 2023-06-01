//
//  MessageByFriendTableViewCell.swift
//  DemoChatZaloClass
//
//  Created by Khắc Hùng on 29/05/2023.
//

import UIKit

class MessageByFriendTableViewCell: UITableViewCell {

    @IBOutlet weak var imgMessagerByFriend: UIImageView!
    @IBOutlet weak var lblNameMessagerByFriend: UILabel!
    @IBOutlet weak var lblMessageByFriend: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
