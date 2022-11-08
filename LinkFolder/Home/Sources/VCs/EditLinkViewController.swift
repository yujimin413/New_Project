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
    
    // MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    @IBAction func backButtonDidTap(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func editButtonDidTap(_ sender: Any) {
        // 링크 수정 API 호출
        self.dismiss(animated: true, completion: nil)
    }
    
}
