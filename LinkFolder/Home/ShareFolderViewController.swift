//
//  FolderShareViewController.swift
//  LinkFolderHome
//
//  Created by 유지민 on 2022/11/01.
//

import UIKit

class ShareFolderViewController: UIViewController {

    // MARK: - Properties
    @IBOutlet weak var shareFolderTableView: UITableView!
    
    
    // MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
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
