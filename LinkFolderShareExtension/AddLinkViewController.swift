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
    
    var folderIdx: Int!
    var url: String = ""
    
    // MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboard()
        linkAddressTextField.text = url
    }
    
    // MARK: - Actions
    @IBAction func backButtonDidTap(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButtonDidTap(_ sender: Any) {
        // 링크 추가 API 호출
        let input = AddLinkInput(linkUrl: linkAddressTextField.text, folderIdx: self.folderIdx, linkAlias: linkNameTextField.text)
        self.addButtonTapped(input: input) {
            self.dismiss(animated: true, completion: nil)
//            super.dismiss(animated: true, completion: nil)
            
//            self.presentingViewController?.dismiss(animated: true, completion: nil)

//            var initialPresentingViewController = self.presentingViewController
//            while let previousPresentingViewController = self.presentingViewController?.presentingViewController { initialPresentingViewController = previousPresentingViewController }
//            if let snapshot = self.view.snapshotView(afterScreenUpdates: true) { initialPresentingViewController?.presentedViewController?.view.addSubview(snapshot)
//
//            }
//            initialPresentingViewController?.dismiss(animated: true)



        }
    }
    
    func addButtonTapped(input: AddLinkInput, completion: @escaping () -> Void) {
        AddLinkRepository().addLink(input, completion)
    }
}
