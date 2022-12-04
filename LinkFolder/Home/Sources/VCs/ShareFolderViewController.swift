//
//  FolderShareViewController.swift
//  LinkFolderHome
//
//  Created by 유지민 on 2022/11/01.
//

import UIKit

protocol ShareFolderTableViewCellDelegate {
    func shareFolderButtonDidTap(receiveUserIdx: Int, _ tableViewCell: UITableViewCell)
}

class ShareFolderViewController: UIViewController, UITextFieldDelegate {

    // MARK: - Properties
    @IBOutlet weak var shareFolderTableView: UITableView!
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var searchTextField: UITextField!
    
    var folderIdx: Int!
    var folderName: String = ""
    
    var FriendsList: [GetFriendsResult]?{
        didSet{
            self.shareFolderTableView.reloadData()
        }
    }
    
    // MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    // MARK: - Actions
    
    @IBAction func backButtonDidTap(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    // MARK: - Helpers
    private func setupTableView() {
        // cell 등록
        shareFolderTableView.register(UINib(nibName: "ShareFolderTableViewCell",
                                   bundle: nil),
    forCellReuseIdentifier: ShareFolderTableViewCell.identifier)
        
        // deleagate 연결
        shareFolderTableView.delegate = self
        shareFolderTableView.dataSource = self
        
        searchTextField.delegate = self
        
        FriendsRepository().getFriendsList(viewcontroller: self)
    }
    
    // 검색창에 친구 검색한 후 엔터 입력시
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.searchTextField {
            let popupStoryboard = UIStoryboard(name: "ShareUserPopUp", bundle: nil)
            let vc = popupStoryboard.instantiateViewController(withIdentifier: "shareUserPopUpVC") as! ShareUserPopUpViewController
            
            SearchRepository().searchUserById(searchTextField.text!){
                data in
                vc.userNicknameTextLabel.text = data.nickname
                vc.userIdTextLabel.text = data.id
                
            }

            vc.modalPresentationStyle = .fullScreen
            vc.modalPresentationStyle = .overCurrentContext
            
            self.present(vc, animated: false)
        }
        return true
    }
}

extension ShareFolderViewController: UITableViewDelegate, UITableViewDataSource {
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

extension ShareFolderViewController: ShareFolderTableViewCellDelegate {
    func shareFolderButtonDidTap(receiveUserIdx: Int, _ tableViewCell: UITableViewCell) {
        // 친구 리스트에서 공유하기 버튼 클릭 (검색x)
        let section = shareFolderTableView.indexPath(for: tableViewCell)
        print(section?.row, "번째 친구에게 폴더 공유하기 버튼 클릭")
        
        // 알림 생성 API 호출
        // (폴더 공유 alertType : 1)
        let input = ShareAlertSendInput(alertText: "[\(Const.userNickname ?? " ")]님이 <\(self.folderName)>폴더를 공유하고 싶어 합니다.", alertType: 1, receiveUserIdx: (FriendsList?[section!.row].userIdx)!, folderIdx: self.folderIdx, linkIdx: 0)
        self.shareFolder(input: input) {
            // 공유 완료시 alert
            let alert = UIAlertController(title: "알림", message: "[\((self.FriendsList?[section!.row].nickname)!)]님에게 폴더 공유 완료", preferredStyle: .alert)
            let done = UIAlertAction(title: "닫기", style: .cancel) {
                (action) in
//                    self.dismiss(animated: false, completion: nil)
            }

            alert.addAction(done)

            self.present(alert, animated: true)
            
        }
    }
    
    func shareFolder(input: ShareAlertSendInput, completion: @escaping() -> Void) {
        ShareAlertSendRepository().sendShareFolderAlert(input, completion)
    }
}

// MARK: - 검색창 extension
//extension ShareFolderViewController: UISearchControllerDelegate {
//    func willPresentSearchController(_ searchController: UISearchController) {
//        print(#function, "updateQueriesSuggestions")
//    }
//
//    func willDismissSearchController(_ searchController: UISearchController) {
//        print(#function, "updateQueriesSuggestions")
//    }
//
//    func didDismissSearchController(_ searchController: UISearchController) {
//        print(#function, "updateQueriesSuggestions")
//    }
//}
//
//extension ShareFolderViewController: UISearchBarDelegate {
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        guard let searchText = searchBar.text, !searchText.isEmpty else { return }
//        searchController.isActive = false
//        print(searchText)
//    }
//
//    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
//        print("cancel")
//    }
//}

extension ShareFolderViewController{
    func successGetFriendsAPI(_ result: GetFriendsModel){
        self.FriendsList = result.result
    }
}
