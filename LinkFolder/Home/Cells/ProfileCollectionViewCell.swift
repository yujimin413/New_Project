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
    
    // MARK: - LifeCycles
    override func awakeFromNib() {
        super.awakeFromNib()

    }

}
