//
//  NoticeTableViewCell.swift
//  LinkFolder
//
//  Created by 임영준 on 2022/11/28.
//

import UIKit

class NoticeTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImageView: ProfileImageComponent!
    @IBOutlet weak var noticeLabel: UILabel!
    
    @IBOutlet weak var acceptButton: ButtonComponent!
    @IBOutlet weak var noticeButton: ButtonComponent!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    
    
    @IBAction func acceptButtonDIdTap(_ sender: Any) {
        print(#function)
    }
    
    
    @IBAction func noticeButtonDidTap(_ sender: Any) {
        print(#function)
    }
    
}
