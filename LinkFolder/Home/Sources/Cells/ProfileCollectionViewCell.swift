//
//  ProfileCollectionViewCell.swift
//  HomeLinkFolder
//
//  Created by 유지민 on 2022/11/01.
//

import UIKit

class ProfileCollectionViewCell: UICollectionViewCell {
    // MARK: - Properties
    static let identifier = "ProfileCollectionViewCell"
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var profileEditButton: UIButton!
    
    var index: Int = 0
    var cellDelegate: ProfileCollectionViewCellDelegate?
    
    // MARK: - LifeCycles
    override func awakeFromNib() {
        super.awakeFromNib()
        nicknameLabel.text = Const.nickname
    }
    
    
    
    @IBAction func profileEditButtonDidTap(_ sender: Any) {
                print(#function)
                cellDelegate?.profileEditButtonDidTap()
    }
    
//    // MARK: - Actions
//    @IBAction func profileEditButtonDidTap(_ sender: Any) {
//        // 기존 프로필 이미지, 닉네임 전송 후 (API로 불러오던기?)
//        // 내 정보 수정 화면으로 이동

//    }
    
}
