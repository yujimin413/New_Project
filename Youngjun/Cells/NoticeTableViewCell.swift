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
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setNoticeLabel(){
        if self.alertType == 0{
            self.noticeLabel.text = nickname+"님이 친구를 요청했습니다"
        }
        else if self.alertType == 1{
            self.noticeLabel.text = nickname+"님이 " + folderName+" 폴더공유를 요청했습니다."
        }
        else if self.alertType == 2{
            self.noticeLabel.text = nickname+"님이 " + linkName + " 링크공유를 요청했습니다."
        }
    }
    
    
    public func setupdata(dataSet: NoticeResult){
        nickname = dataSet.nickname
        alertType = dataSet.alertType
        if self.alertType == 1{
            self.folderName = dataSet.folderName
        }
        else if self.alertType == 2{
            self.linkName = dataSet.linkName
        }

        setNoticeLabel()
    }

    
    
    @IBAction func acceptButtonDIdTap(_ sender: Any) {
        print(#function)
    }
    
    
    @IBAction func noticeButtonDidTap(_ sender: Any) {
        print(#function)
    }
    
}
