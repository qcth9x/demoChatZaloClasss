//
//  MessageByLoggedInUserTableViewCell.swift
//  DemoChatZaloClass
//
//  Created by Khắc Hùng on 29/05/2023.
//

import UIKit

class MessageByLoggedInUserTableViewCell: UITableViewCell {

    @IBOutlet weak var lblNameMessagerByLoggedInUser: UILabel!
    @IBOutlet weak var imgMessagerByLoggedInUser: UIImageView!
    @IBOutlet weak var lblMessageByLoggedInUser: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
