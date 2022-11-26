//
//  EditLinkViewController.swift
//  LinkFolderHome
//
//  Created by 유지민 on 2022/11/01.
//

import UIKit

class EditLinkViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet weak var linkNameTextField: UITextField!
    @IBOutlet weak var linkAddressTextField: UITextField!
    @IBOutlet weak var editButton: UIButton!
    
    var delegate: LinkReloadDelegate?
    
    var linkUrl: String = ""
    var linkIdx: Int?
    var linkAlias: String = ""
    
    // MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        linkNameTextField.text = linkAlias
        linkAddressTextField.text = linkUrl
    }
    
    // MARK: - Actions
    @IBAction func backButtonDidTap(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func editButtonDidTap(_ sender: Any) {
        // 링크 수정 API 호출
        let input = LinkModifyInput(updateLinkUrl: linkAddressTextField.text, linkIdx: self.linkIdx, updateLinkAlias: linkNameTextField.text)
        self.editButtonTapped(input: input) {
            self.delegate?.setupLinkData()
            self.dismiss(animated: true, completion: nil)
            
        }
        
    }
    
    func editButtonTapped(input: LinkModifyInput, completion: @escaping() -> Void) {
        LinkModifyRepository().modifyLink(input, completion)
    }
    
}
