//
//  AddFolderPopUpViewController.swift
//  LinkFolder
//
//  Created by 유지민 on 2022/11/01.
//

import UIKit

class AddFolderPopUpViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var folderNameTextField: UITextField!
    
    var delegate: HomeReloadDelegate?
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    @IBAction func backButtonTapped(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        // 폴더 추가 API 호출
        let input = AddFolderInput(folderName: folderNameTextField.text!)
        self.addButtonTapped(input: input) {
            self.delegate?.setupFolderData()
            self.dismiss(animated: false, completion: nil)
        }
//        AddFolderRepository().addFolder(HomeViewController, inpput) {
//            self.dismiss(animated: true, completion: nil)
//        }
        
    }
    
    func addButtonTapped(input: AddFolderInput, completion: @escaping () -> Void) {
        AddFolderRepository().addFolder(input, completion)
        
    }
}
