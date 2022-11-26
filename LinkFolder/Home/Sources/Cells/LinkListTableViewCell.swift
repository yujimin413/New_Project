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
    
    var linkIndex: Int!
    
    //MARK: - LifeCycles
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
//        print("선택된 행 인덱스")

        // Configure the view for the selected state
    }
    
    // MARK: - Actions
    @IBAction func linkMoreButtonDidTap(_ sender: Any) {
        self.delegate?.linkMoreButtonDidTap(name: linkNameLabel, url: linkUrlLabel, self)
    }
    
    public func setupLinkData(_ linkUrl: String?, _ linkIdx: Int?, _ linkAlias: String?) {
        guard let linkAlias = linkAlias else { return }
        linkUrlLabel.text = linkUrl
        linkNameLabel.text = linkAlias
        self.linkIndex = linkIdx
    }
}
