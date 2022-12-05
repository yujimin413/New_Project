//
//  ShareLinkUserPopUpViewController.swift
//  LinkFolder
//
//  Created by 유지민 on 2022/12/04.
//

import UIKit

class ShareLinkUserPopUpViewController: UIViewController {

    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var profileImageView: ProfileImageComponent!
    @IBOutlet weak var userNicknameTextLabel: UILabel!
    @IBOutlet weak var userIdTextLabel: UILabel!
    @IBOutlet weak var shareLinkButton: ButtonComponent!
    
    var userIdx: Int!
    var linkAlias: String = ""
    var linkIdx: Int!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.popUpView.layer.cornerRadius = 10

    }
    
    @IBAction func backButtonDidTap(_ sender: Any) {
        self.dismiss(animated: false)
    }

    @IBAction func shareLinkButtonDidTap(_ sender: Any) {
        let input = ShareAlertSendInput(alertText: "[\(Const.userNickname ?? " ")]님이 [\(self.linkAlias)]링크를 공유하고 싶어 합니다.", alertType: 2, receiveUserIdx: self.userIdx, folderIdx: 0, linkIdx: self.linkIdx)
        self.shareLink(input: input) {
            // 공유 완료시 alert
            let alert = UIAlertController(title: "알림", message: "[\((self.userNicknameTextLabel.text)!)]님에게 링크 공유 완료", preferredStyle: .alert)
            let done = UIAlertAction(title: "닫기", style: .cancel) {
                (action) in
//                    self.dismiss(animated: false, completion: nil)
            }

            alert.addAction(done)

            guard let pvc = self.presentingViewController else { return }
            
            self.dismiss(animated: false) {
              pvc.present(alert, animated: true, completion: nil)
            }
//            self.present(alert, animated: true)
            
        }
    }
    
    func shareLink(input: ShareAlertSendInput, completion: @escaping() -> Void) {
        ShareAlertSendRepository().sendShareAlert(input, completion)
    }
}
