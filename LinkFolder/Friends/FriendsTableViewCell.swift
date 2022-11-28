//
//  FriendsTableViewCell.swift
//  LinkFolder
//
//  Created by 임영준 on 2022/11/28.
//

import UIKit

class FriendsTableViewCell: UITableViewCell {

    
    @IBOutlet weak var profileImageVIew: ProfileImageComponent!
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func friendsButtonDidTap(_ sender: Any) {
        print(#function)
    }
    
    
}
