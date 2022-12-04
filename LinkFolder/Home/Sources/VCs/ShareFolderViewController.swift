//
//  FolderShareViewController.swift
//  LinkFolderHome
//
//  Created by 유지민 on 2022/11/01.
//

import UIKit

protocol ShareFolderTableViewCellDelegate {
    func shareFolderButtonDidTap(name: UILabel, url: UILabel, _ tableViewCell: UITableViewCell)
}

class ShareFolderViewController: UIViewController {

    // MARK: - Properties
    @IBOutlet weak var shareFolderTableView: UITableView!
    @IBOutlet weak var backButton: UIBarButtonItem!
    
    private var searchController: UISearchController = {
            return UISearchController(searchResultsController: nil)
        }()
    
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
        // deleagate 연결
        shareFolderTableView.delegate = self
        shareFolderTableView.dataSource = self
        
        // cell 등록
        shareFolderTableView.register(UINib(nibName: "ShareFolderTableViewCell",
                                   bundle: nil),
    forCellReuseIdentifier: ShareFolderTableViewCell.identifier)
    }
}

extension ShareFolderViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ShareFolderTableViewCell.identifier, for: indexPath) as? ShareFolderTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
}

extension ShareFolderViewController: ShareFolderTableViewCellDelegate {
    func shareFolderButtonDidTap(name: UILabel, url: UILabel, _ tableViewCell: UITableViewCell) {
        // 친구 리스트에서 공유하기 버튼 클릭 (검색x)
        let section = shareFolderTableView.indexPath(for: tableViewCell)
        print(section?.row, "번째 친구에게 폴더 공유하기 버튼 클릭")
        
//        let storyboard = UIStoryboard.init(name: "ShowLinkMorePopUp", bundle: nil)
//        let showLinkMorePopUpVC = storyboard.instantiateViewController(withIdentifier: "ShowLinkMorePopUpVC") as! ShowLinkMorePopUpViewController
//        showLinkMorePopUpVC.modalPresentationStyle = .overCurrentContext
        
//        print(self.linkData?[section!.row].linkUrl)
        
//        showLinkMorePopUpVC.delegate = self
//
//        // 현재 링크 정보(linkUrl, linkIdx, linkAlias) 넘겨주기
//        showLinkMorePopUpVC.linkUrl = (self.linkData?[section!.row].linkUrl)!
//        showLinkMorePopUpVC.linkIdx = self.linkData?[section!.row].linkIdx
//        showLinkMorePopUpVC.linkAlias = (self.linkData?[section!.row].linkAlias)!
        
        
//        self.present(showLinkMorePopUpVC, animated: false, completion: nil)
    
        

    }
}

// MARK: - 검색창 extension
extension ShareFolderViewController: UISearchControllerDelegate {
    func willPresentSearchController(_ searchController: UISearchController) {
        print(#function, "updateQueriesSuggestions")
    }

    func willDismissSearchController(_ searchController: UISearchController) {
        print(#function, "updateQueriesSuggestions")
    }

    func didDismissSearchController(_ searchController: UISearchController) {
        print(#function, "updateQueriesSuggestions")
    }
}

extension ShareFolderViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text, !searchText.isEmpty else { return }
        searchController.isActive = false
        print(searchText)
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        print("cancel")
    }
}
