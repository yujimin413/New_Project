//
//  FolderCollectionViewCell.swift
//  HomeLinkFolder
//
//  Created by 유지민 on 2022/11/01.
//

import UIKit

class FolderCollectionViewCell: UICollectionViewCell {
    // MARK: - Properties
    static let identifier = "FoldereCollectionViewCell"
    
    @IBOutlet weak var folderButton: UIImageView!
    @IBOutlet weak var folderMoreButton: UIButton!
    @IBOutlet weak var folderNameLabel: UILabel!
    
    // MARK: - LifeCycles
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
