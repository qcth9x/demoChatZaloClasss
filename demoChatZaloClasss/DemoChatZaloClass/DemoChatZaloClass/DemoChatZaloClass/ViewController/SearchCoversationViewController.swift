//
//  SearchCoversationViewController.swift
//  DemoChatZaloClass
//
//  Created by Lê Đình Linh on 01/06/2023.
//

import UIKit

class SearchCoversationViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    @IBOutlet weak var tblConversations: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var lblHienThiKetQua: UILabel!
    
    var conversations: [Conversation] = []
    var filteredData: [Conversation] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblHienThiKetQua.isHidden = true
        filteredData = conversations
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblConversations.dequeueReusableCell(withIdentifier: "searchCoversationIdentifier")!
        let imgAvtar = cell.viewWithTag(601) as! UIImageView
        imgAvtar.image = UIImage(named: filteredData[indexPath.row].avatar)
        let nameCoversation = cell.viewWithTag(602) as! UILabel
        nameCoversation.text = filteredData[indexPath.row].name
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData = []
        if searchText == "" {
            filteredData = conversations
        } else {
            filteredData = conversations.filter { conversation in
                conversation.name.range(of: searchText, options: .caseInsensitive) != nil
            }
        }
        
        if filteredData.count == 0 {
            lblHienThiKetQua.isHidden = false
            tblConversations.isHidden = true
        } else {
            lblHienThiKetQua.isHidden = true
            tblConversations.isHidden = false
        }
        
        tblConversations.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            conversations.remove(at: indexPath.row)
            filteredData = conversations
            tblConversations.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
