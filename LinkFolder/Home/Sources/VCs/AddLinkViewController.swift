//
//  AddLinkViewController.swift
//  LinkFolderHome
//
//  Created by 유지민 on 2022/11/01.
//

import UIKit

class AddLinkViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet weak var linkNameTextField: UITextField!
    @IBOutlet weak var linkAddressTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    var delegete: LinkReloadDelegate?
    var folderIdx: Int!
    
    // MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    @IBAction func backButtonDidTap(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButtonDidTap(_ sender: Any) {
        // 링크 추가 API 호출
        let input = AddLinkInput(linkUrl: linkAddressTextField.text, folderIdx: self.folderIdx, linkAlias: linkNameTextField.text)
        self.addButtonTapped(input: input) {
            self.delegete?.setupLinkData()
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    func addButtonTapped(input: AddLinkInput, completion: @escaping () -> Void) {
        AddLinkRepository().addLink(input, completion)
    }
}
