//
//  ShareUserPopUpViewController.swift
//  LinkFolder
//
//  Created by 유지민 on 2022/12/04.
//

import UIKit

class ShareFolderUserPopUpViewController: UIViewController {

    
    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var profileImageView: ProfileImageComponent!
    @IBOutlet weak var userNicknameTextLabel: UILabel!
    @IBOutlet weak var userIdTextLabel: UILabel!
    @IBOutlet weak var shareFolderButton: ButtonComponent!
    
    var userIdx: Int!
    var folderName: String = ""
    var folderIdx: Int!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.popUpView.layer.cornerRadius = 10

    }
    
    @IBAction func backButtonDidTap(_ sender: Any) {
        self.dismiss(animated: false)
    }
    
    @IBAction func shareFolderButtonDidTap(_ sender: Any) {
        let input = ShareAlertSendInput(alertText: "[\(Const.userNickname ?? " ")]님이 [\(self.folderName)]폴더를 공유하고 싶어 합니다.", alertType: 1, receiveUserIdx: self.userIdx, folderIdx: self.folderIdx, linkIdx: 0)
        self.shareFolder(input: input) {
            // 공유 완료시 alert
            let alert = UIAlertController(title: "알림", message: "[\((self.userNicknameTextLabel.text)!)]님에게 폴더 공유 완료", preferredStyle: .alert)
            let done = UIAlertAction(title: "닫기", style: .cancel) {
                (action) in
//                    self.dismiss(animated: false, completion: nil)
            }

            alert.addAction(done)

            guard let pvc = self.presentingViewController else { return }
            self.dismiss(animated: false) {
                pvc.present(alert, animated: true, completion: nil)
            }
            
        }
    }
    
    func shareFolder(input: ShareAlertSendInput, completion: @escaping() -> Void) {
        ShareAlertSendRepository().sendShareAlert(input, completion)
    }
}
