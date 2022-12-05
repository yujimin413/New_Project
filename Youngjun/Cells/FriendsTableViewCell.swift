//
//  FriendsTableViewCell.swift
//  LinkFolder
//
//  Created by 임영준 on 2022/11/28.
//

import UIKit

class FriendsTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var deleteFriendButton: ButtonComponent!
    @IBOutlet weak var profileImageVIew: ProfileImageComponent!
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    var userIdx: Int!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    public func setupData(profileImage: String?, nickname: String, id: String, userIdx: Int){
        self.nicknameLabel.text = nickname
        self.idLabel.text = id
        self.userIdx = userIdx
    }
    
    @IBAction func deleteFriendButtonDidTap(_ sender: Any) {
                FriendsRepository().deleteFriend(deleteUserIdx: userIdx)
    }
    
}
    
//    @IBAction func deleteFriendButtonDidTap(_ sender: Any) {
//        FriendsRepository().deleteFriend(deleteUserIdx: userIdx)
//    }
//}
