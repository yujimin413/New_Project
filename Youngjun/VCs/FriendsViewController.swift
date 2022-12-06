//
//  FriendsViewController.swift
//  LinkFolder
//
//  Created by 임영준 on 2022/10/18.
//

//yujimin123
//test1234


import UIKit

class FriendsViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchTextField: UITextField!
    let refreshControl = UIRefreshControl()
    
    

    
    
    var FriendsList: [GetFriendsResult]?{
        didSet{
            self.tableView.reloadData()
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "FriendsTableViewCell", bundle: nil), forCellReuseIdentifier: "FriendsTableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
        searchTextField.delegate = self
        FriendsRepository().getFriendsList(viewcontroller: self)
        initRefreshControl()
    }
    
    func initRefreshControl(){
        tableView.refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshTableView(refreshControl:)), for: .valueChanged)
        tableView.refreshControl = refreshControl
    }
    
    @objc func refreshTableView(refreshControl:
    UIRefreshControl){
        DispatchQueue.main.asyncAfter(deadline: .now()){
            FriendsRepository().getFriendsList(viewcontroller: self)
            refreshControl.endRefreshing()
        }
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.searchTextField {
            let popupStoryboard = UIStoryboard(name: "UserPopUp", bundle: nil)
            let vc = popupStoryboard.instantiateViewController(withIdentifier: "UserPopUpViewController") as! UserPopUpViewController
            
            SearchRepository().searchUserById(searchTextField.text!){
                data in
                vc.friendAddButton.isHidden = false
                vc.idLabel.isHidden = false
                vc.nicknameLabel.text = data.nickname
                vc.idLabel.text = data.id
                vc.userIdx = data.userIdx
                
            }

            vc.modalPresentationStyle = .fullScreen
            vc.modalPresentationStyle = .overCurrentContext
            
            self.present(vc, animated: false)
        }
        return true
    }
    
}

extension FriendsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FriendsList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsTableViewCell", for: indexPath) as! FriendsTableViewCell
        
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


extension FriendsViewController{
    func successGetFriendsAPI(_ result: GetFriendsModel){
        self.FriendsList = result.result
    }
}
