//
//  FolderCollectionViewCell.swift
//  LinkFolderShareExtension
//
//  Created by 유지민 on 2022/12/06.
//

import UIKit

class FolderCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "FoldereCollectionViewCell2"
    
    var folderIndex: Int!

    @IBOutlet weak var folderButton: UIImageView!
    
    @IBOutlet weak var folderNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        folderButton.image = UIImage(named: "Folder")
        folderButton.backgroundColor = .clear
    }

    
    public func setupFolderData(_ folderName: String?, _ folderIndex: Int?) {
        guard let folderName = folderName else { return }
        folderNameLabel.text = folderName
        self.folderIndex = folderIndex
    }
}
