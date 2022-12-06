//
//  ChangeFolderNameViewController.swift
//  LinkFolder
//
//  Created by 유지민 on 2022/11/01.
//

import UIKit

class ChangeFolderNamePopUpViewController: UIViewController {
    // MARK: - Properties
    
    @IBOutlet weak var popUpBgView: UIView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var folderNameTextField: UITextField!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var doneButton: UIButton!
    
    var folderIndex: Int!
    var folderName: String = ""
    
    var delegate: HomeReloadDelegate?
    
    // MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboard()
        self.popUpBgView.layer.cornerRadius = 14
        folderNameTextField.text = folderName
    }
    
    // MARK: - Actions
    @IBAction func backButtonDidTap(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelButtonDidTap(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneButtonDidTap(_ sender: Any) {
        // 폴더명 변경 API 호출
        let input = FolderNameModifyInput(updateFolderName: folderNameTextField.text, folderIdx: self.folderIndex)
        self.doneButtonTapped(input: input) {
            self.delegate?.setupFolderData()
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    func doneButtonTapped(input: FolderNameModifyInput, completion: @escaping() -> Void) {
        FolderNameModifyRepository().modifyFolderName(input, completion)
    }
}
