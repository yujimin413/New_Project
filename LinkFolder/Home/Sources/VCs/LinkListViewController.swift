//
//  LinkListViewConViewController.swift
//  LinkFolderHome
//
//  Created by 유지민 on 2022/11/01.
//

import UIKit

protocol LinkReloadDelegate {
    func setupLinkData()
}

protocol LinkListTableViewCellDelegate {
    func linkMoreButtonDidTap(name: UILabel, url: UILabel, _ tableViewCell: UITableViewCell)
}

class LinkListViewController: UIViewController, LinkReloadDelegate {

    // MARK: - Properties
    @IBOutlet weak var linkListTableView: UITableView!
    @IBOutlet weak var addLinkButton: UIButton!
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var folderNavigationBar: UINavigationBar!
    
    var folderIdx: Int?
    var folderName: String = ""
    
    var linkData: [linkInfo]? {
        didSet { self.linkListTableView.reloadData()}
    }
    
    // MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupLinkData()
        
        self.folderNavigationBar.topItem?.title = folderName
    }
    
    func setupLinkData() {
        LinksListRepository().getLinksList(self, folderIdx ?? 0)
    }
    
    //MARK: - Actions
    @IBAction func backButtonDidTap(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func addLinkButtonDidTap(_ sender: Any) {
        // 링크 추가 팝업뷰
        let storyboard = UIStoryboard.init(name: "AddLink", bundle: nil)
        let addLinkVC = storyboard.instantiateViewController(withIdentifier: "AddLinkVC") as! AddLinkViewController
        
        addLinkVC.folderIdx = self.folderIdx
        addLinkVC.delegete = self
//        addLinkVC.modalPresentationStyle = .overCurrentContext
        self.present(addLinkVC, animated: true, completion: nil)
    
    }
    
    
    // MARK: - Helpers
    private func setupTableView() {
        // deleagate 연결
        linkListTableView.delegate = self
        linkListTableView.dataSource = self
        
        // cell 등록
        linkListTableView.register(UINib(nibName: "LinkListTableViewCell",
                                   bundle: nil),
    forCellReuseIdentifier: LinkListTableViewCell.identifier)
    }
}

extension LinkListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return linkData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LinkListTableViewCell.identifier, for: indexPath) as? LinkListTableViewCell else {
            return UITableViewCell()
        }
        cell.delegate = self
        
        let itemIndex = indexPath.row
        if let cellData = self.linkData {
            cell.setupLinkData(cellData[itemIndex].linkUrl, cellData[itemIndex].linkIdx, cellData[itemIndex].linkAlias)
        }
        return cell
    }
    
    // 선택된 행 인덱스 확인
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("선택된 행 인덱스 :  ")
//        print(indexPath)
//        print(indexPath.row)
//        print(indexPath.item)
//    }
}

extension LinkListViewController: LinkListTableViewCellDelegate {
    func linkMoreButtonDidTap(name: UILabel, url: UILabel, _ tableViewCell: UITableViewCell) {
        // 링크 더보기 팝업
        let section = linkListTableView.indexPath(for: tableViewCell)
        print(section?.row, "번째 링크 더보기 버튼 클릭")
        
        let storyboard = UIStoryboard.init(name: "ShowLinkMorePopUp", bundle: nil)
        let showLinkMorePopUpVC = storyboard.instantiateViewController(withIdentifier: "ShowLinkMorePopUpVC") as! ShowLinkMorePopUpViewController
        showLinkMorePopUpVC.modalPresentationStyle = .overCurrentContext
        
//        print(self.linkData?[section!.row].linkUrl)
        
        showLinkMorePopUpVC.delegate = self
        
        // 현재 링크 정보(linkUrl, linkIdx, linkAlias) 넘겨주기
        showLinkMorePopUpVC.linkUrl = (self.linkData?[section!.row].linkUrl)!
        showLinkMorePopUpVC.linkIdx = self.linkData?[section!.row].linkIdx
        showLinkMorePopUpVC.linkAlias = (self.linkData?[section!.row].linkAlias)!
        
        
        self.present(showLinkMorePopUpVC, animated: false, completion: nil)
    
        

    }
}

// MARK: - 링크 목록 가져오기 API 통신 메소드
extension LinkListViewController {
    func successLinksListAPI(_ result: LinksListModel) {
        self.linkData = result.result
    }
}
