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

extension ShareLinkViewController {
    private func setupSearchBar() {
        searchController.delegate = self
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false

        searchController.searchBar.barStyle = .default
        searchController.searchBar.placeholder = "검색 창"

        searchController.searchBar.translatesAutoresizingMaskIntoConstraints = true
//        searchController.searchBar.frame = searchBarContainerView.bounds
        searchController.searchBar.autoresizingMask = [.flexibleWidth]
//        searchBarContainerView.addSubview(searchController.searchBar)
        definesPresentationContext = true
    }
}

extension ShareLinkViewController: UISearchControllerDelegate {
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

extension ShareLinkViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text, !searchText.isEmpty else { return }
        searchController.isActive = false
        print(searchText)
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        print("cancel")
    }
}
