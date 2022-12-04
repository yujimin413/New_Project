//
//  ShareFolderTableViewCell.swift
//  LinkFolder
//
//  Created by 유지민 on 2022/11/01.
//

import UIKit

class ShareFolderTableViewCell: UITableViewCell {

    //MARK: - Properties
    static let identifier = "ShareFolderTableViewCell"
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var idTextField: UILabel!
    @IBOutlet weak var nicknameTextField: UILabel!
    @IBOutlet weak var button: UIButton!
    
    var userIdx: Int!
    
    var delegate: ShareFolderTableViewCellDelegate?
    
    //MARK: - LifeCycles
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    public func setupData(profileImage: String?, nickname: String, id: String, userIdx: Int){
        self.nicknameTextField.text = nickname
        self.idTextField.text = id
        self.userIdx = userIdx
    }
    
}
