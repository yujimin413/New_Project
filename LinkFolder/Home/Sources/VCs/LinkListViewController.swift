//
//  LinkListViewConViewController.swift
//  LinkFolderHome
//
//  Created by 유지민 on 2022/11/01.
//

import UIKit

protocol LinkListTableViewCellDelegate {
    func linkMoreButtonDidTap(name: UILabel, url: UILabel, _ tableViewCell: UITableViewCell)
}

class LinkListViewController: UIViewController {

    // MARK: - Properties
    @IBOutlet weak var linkListTableView: UITableView!
    @IBOutlet weak var addLinkButton: UIButton!
    @IBOutlet weak var backButton: UIBarButtonItem!
    
    // MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    //MARK: - Actions
    @IBAction func backButtonDidTap(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func addLinkButtonDidTap(_ sender: Any) {
        // 링크 추가 팝업뷰
        let storyboard = UIStoryboard.init(name: "AddLink", bundle: nil)
        let addLinkVC = storyboard.instantiateViewController(withIdentifier: "AddLinkVC")
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
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LinkListTableViewCell.identifier, for: indexPath) as? LinkListTableViewCell else {
            return UITableViewCell()
        }
        cell.delegate = self
        return cell
    }
}

extension LinkListViewController: LinkListTableViewCellDelegate {
    func linkMoreButtonDidTap(name: UILabel, url: UILabel, _ tableViewCell: UITableViewCell) {
        // 링크 더보기 팝업
        let section = linkListTableView.indexPath(for: tableViewCell)
        print(section?.row, "번째 링크 더보기 버튼 클릭")
        
        let storyboard = UIStoryboard.init(name: "LinkList", bundle: nil)
        let showLinkMorePopUpVC = storyboard.instantiateViewController(withIdentifier: "ShowLinkMorePopUpVC")
        showLinkMorePopUpVC.modalPresentationStyle = .overCurrentContext
        self.present(showLinkMorePopUpVC, animated: true, completion: nil)
    
        

    }
}
