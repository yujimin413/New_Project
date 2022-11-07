//
//  ShareLinkViewController.swift
//  LinkFolder
//
//  Created by 유지민 on 2022/11/07.
//

import UIKit

class ShareLinkViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet weak var backButton: UIBarButtonItem!
    
    @IBOutlet weak var shareLinkTableView: UITableView!
    
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
        shareLinkTableView.delegate = self
        shareLinkTableView.dataSource = self
        
        // cell 등록
        shareLinkTableView.register(UINib(nibName: "ShareFolderTableViewCell",
                                   bundle: nil),
    forCellReuseIdentifier: ShareFolderTableViewCell.identifier)
    }

    
    
    
}

extension ShareLinkViewController: UITableViewDelegate, UITableViewDataSource {
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
