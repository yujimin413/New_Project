//
//  ShareLinkViewController.swift
//  LinkFolder
//
//  Created by 유지민 on 2022/11/07.
//

import UIKit

protocol ShareLinkTableViewCellDelegate {
    func shareFolderButtonDidTap(receiveUserIdx: Int, _ tableViewCell: UITableViewCell)
}

class ShareLinkViewController: UIViewController, UITextFieldDelegate {
    // MARK: - Properties
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var shareLinkTableView: UITableView!
    @IBOutlet weak var searchTextField: UITextField!
    
    var linkIdx: Int!
    var linkAlias: String = ""
    
    var FriendsList: [GetFriendsResult]?{
        didSet{
            self.shareLinkTableView.reloadData()
        }
    }
    
    // MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        hideKeyboard()

    }

    
    // MARK: - Actions
    @IBAction func backButtonDidTap(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Helpers
    private func setupTableView() {
        // cell 등록
        shareLinkTableView.register(UINib(nibName: "ShareFolderTableViewCell",
                                   bundle: nil),
    forCellReuseIdentifier: ShareFolderTableViewCell.identifier)
        
        // deleagate 연결
        shareLinkTableView.delegate = self
        shareLinkTableView.dataSource = self
        
        searchTextField.delegate = self
        
        FriendsRepository().getFriendsList(viewcontroller: self)
    }
    
    // 검색창에 친구 검색한 후 엔터 입력시
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.searchTextField {
            let popupStoryboard = UIStoryboard(name: "ShareLinkUserPopUp", bundle: nil)
            let vc = popupStoryboard.instantiateViewController(withIdentifier: "shareLinkUserPopUpVC") as! ShareLinkUserPopUpViewController
            
            SearchRepository().searchUserById(searchTextField.text!){
                data in
                
                
                vc.userNicknameTextLabel.text = data.nickname
                vc.userIdTextLabel.text = data.id
                vc.userIdx = data.userIdx
                
                vc.linkAlias = self.linkAlias
                vc.linkIdx = self.linkIdx
            }

            vc.modalPresentationStyle = .fullScreen
            vc.modalPresentationStyle = .overCurrentContext
            
            
            self.present(vc, animated: false)
        }
        return true
    }

    
    
    
}

extension ShareLinkViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FriendsList?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ShareFolderTableViewCell.identifier, for: indexPath) as? ShareFolderTableViewCell else {
            return UITableViewCell()
        }
        cell.delegate = self
        let itemIndex = indexPath.item
        
        //일단 닉네임 넣었슴
        if let cellData = self.FriendsList {
            cell.setupData(profileImage: cellData[itemIndex].profileImageURL ,
                           nickname: cellData[itemIndex].nickname,
                           id: cellData[itemIndex].id,
                           userIdx: cellData[itemIndex].userIdx)
        }
        return cell
    }
}

extension ShareLinkViewController: ShareFolderTableViewCellDelegate {
    func shareFolderButtonDidTap(receiveUserIdx: Int, _ tableViewCell: UITableViewCell) {
        // 친구 리스트에서 공유하기 버튼 클릭 (검색x)
        let section = shareLinkTableView.indexPath(for: tableViewCell)
        print(section?.row, "번째 친구에게 링크 공유하기 버튼 클릭")
        
        // 알림 생성 API 호출
        // (링크 공유 alertType : 2)
        let input = ShareAlertSendInput(alertText: "[\(Const.userNickname ?? " ")]님이 [\(self.linkAlias)]링크를 공유하고 싶어 합니다.", alertType: 2, receiveUserIdx: (FriendsList?[section!.row].userIdx)!, folderIdx: 0, linkIdx: self.linkIdx)
        self.shareLink(input: input) {
            // 공유 완료시 alert
            let alert = UIAlertController(title: "알림", message: "[\((self.FriendsList?[section!.row].nickname)!)]님에게 링크 공유 완료", preferredStyle: .alert)
            let done = UIAlertAction(title: "닫기", style: .cancel) {
                (action) in
//                guard let presentingVC = self.presentingViewController as? UINavigationController else {return}
//                let viewControllerStack = presentingVC.viewControllers
//                self.dismiss(animated: false) {
//                    for viewController in viewControllerStack {
//                        if let rootVC = viewController as? HomeViewController {
//                            presentingVC.popToViewController(rootVC, animated: false)
//                        }
//                    }
//                }
            }

            alert.addAction(done)
            
//            guard let pvc = self.presentingViewController else { return }
            
//            self.dismiss(animated: true) {
//                pvc.present(alert, animated: false, completion: nil)
//            }

            self.present(alert, animated: true)
            
        }
    }
    
    func shareLink(input: ShareAlertSendInput, completion: @escaping() -> Void) {
        ShareAlertSendRepository().sendShareAlert(input, completion)
    }
}

extension ShareLinkViewController{
    func successGetFriendsAPI(_ result: GetFriendsModel){
        self.FriendsList = result.result
    }
}
