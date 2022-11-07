//
//  LinkListTableViewCell.swift
//  LinkFolderHome
//
//  Created by 유지민 on 2022/11/01.
//

import UIKit

class LinkListTableViewCell: UITableViewCell {
    //MARK: - Properties
    static let identifier = "LinkListTableViewCell"
    
    @IBOutlet weak var linkImage: UIImageView!
    @IBOutlet weak var linkNameLabel: UILabel!
    @IBOutlet weak var linkUrlLabel: UILabel!
    @IBOutlet weak var linkMoreButton: UIButton!
    
    var delegate: LinkListTableViewCellDelegate?
    
    //MARK: - LifeCycles
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - Actions
    @IBAction func linkMoreButtonDidTap(_ sender: Any) {
        self.delegate?.linkMoreButtonDidTap(name: linkNameLabel, url: linkUrlLabel, self)
    }
}
