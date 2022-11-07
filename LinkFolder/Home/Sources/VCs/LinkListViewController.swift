//
//  LinkListViewConViewController.swift
//  LinkFolderHome
//
//  Created by 유지민 on 2022/11/01.
//

import UIKit

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
        return cell
    }
}
