//
//  UserPopUpViewController.swift
//  LinkFolder
//
//  Created by 임영준 on 2022/12/01.
//

import UIKit

class UserPopUpViewController: UIViewController {

    @IBOutlet weak var popUpBgView: UIView!
    @IBOutlet weak var profileImageVIew: ProfileImageComponent!
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var friendAddButton: ButtonComponent!
    
    var userIdx: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        popUpBgView.layer.cornerRadius = 10
    }
    
    
    @IBAction func bgBtnDidTap(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func requestFriendDidTap(_ sender: Any) {
        let input = ShareAlertSendInput(alertText: "[\(Const.userNickname ?? " ")]님이 친구가 되고 싶어 합니다.", alertType: 0, receiveUserIdx: self.userIdx, folderIdx: 0, linkIdx: 0)
        self.shareFolder(input: input) {
            // 친구 요청 완료시 alert
            let alert = UIAlertController(title: "알림", message: "[\((self.nicknameLabel.text)!)]님에게 친구 요청 완료", preferredStyle: .alert)
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
