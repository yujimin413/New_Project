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
    
    var delegate: FolderCollectionViewCellDelegate?
    // MARK: - LifeCycles
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Actions
    @IBAction func folderMoreButtonDidTap(_ sender: Any) {
        self.delegate?.folderMoreButtonDidTap(name: folderNameLabel, self)
    
    }
    
    public func setupFolderData(_ folderName: String?) {
        guard let folderName = folderName else { return }
        folderNameLabel.text = folderName
    }
}
