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
        self.dismiss(animated: true, completion: nil)
    }
}
