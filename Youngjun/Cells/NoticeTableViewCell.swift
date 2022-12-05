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
    
    @IBOutlet weak var noticeButton: ButtonComponent!
    
    var alertIndex: Int!
    var alertType: Int!
    var nickname: String!
    var profileUrl: String!
    var linkName: String!
    var folderName: String!
    var sendUserIdx: Int!
    var linkIdx: Int!
    var folderIdx: Int!

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    public func setupdata(dataSet: NoticeResult){
        self.noticeLabel.text = dataSet.alertText
        self.alertType = dataSet.alertType
        self.sendUserIdx = dataSet.sendUserIdx
        self.folderIdx = dataSet.folderIdx
        self.linkIdx = dataSet.linkIdx
        
        if self.alertType == 0{
            //            self.noticeLabel.text = nickname+"님이 친구를 요청했습니다"
        }
        else if self.alertType == 1{
            //            self.noticeLabel.text = nickname+"님이 " + folderName+" 폴더공유를 요청했습니다."
        }
        else if self.alertType == 2{
            //            self.noticeLabel.text = nickname+"님이 " + linkName + " 링크공유를 요청했습니다."
        }
    }
    
    
    
    
    
    @IBAction func noticeButtonDidTap(_ sender: Any) {
        print(#function)
        
        switch alertType{
        case 0:
            FriendsRepository().acceptFriendAlert(sendUserIdx: self.sendUserIdx)
            
        case 1:
            let input = FolderCopyInput(foldrIdx: self.folderIdx, sendUserIdx: self.sendUserIdx)
            FolderCopyRepository().copyFolder(input){
            }
            
        case 2:
            let input = LinkCopyInput(foldrIdx: self.folderIdx, linkIdx: self.linkIdx, sendUserIdx: self.sendUserIdx)
            LinkCopyRepository().copyLink(input){
                
            }
        default:
            print("hi")
            
        }
        
    }
    
}
