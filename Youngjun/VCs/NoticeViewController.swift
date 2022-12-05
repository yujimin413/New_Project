//
//  NoticeViewController.swift
//  LinkFolder
//
//  Created by 임영준 on 2022/10/18.
//

import UIKit

protocol NoticeViewCellDelegate {
    func presentChooseFolderView(linkIdx: Int, senderUserIdx: Int, alertIdx: Int)
}

protocol NoticeDeleteAlertDelegate {
    func noticeDeleteAlert()
    
}

class NoticeViewController: UIViewController, NoticeViewCellDelegate, NoticeDeleteAlertDelegate {
    
    func noticeDeleteAlert() {
        // 링크 사본 생성 완료시 alert
        print("왜안되냐")
        let alert = UIAlertController(title: "알림", message: "폴더 사본이 생성되었습니다.", preferredStyle: .alert)
        let done = UIAlertAction(title: "닫기", style: .cancel) {
            (action) in
        }

        alert.addAction(done)
        
//        guard let pvc = self.presentingViewController else { return }
//        self.dismiss(animated: false) {
//            pvc.present(alert, animated: true, completion: nil)
//        }

    }
    
    
    func presentChooseFolderView(linkIdx: Int, senderUserIdx: Int, alertIdx: Int) {
        let storyboard = UIStoryboard.init(name: "ChooseFolder", bundle: nil)
        let chooseFolderVC = storyboard.instantiateViewController(withIdentifier: "ChooseFolderVC") as! ChooseFolderViewController

        chooseFolderVC.linkIdx = linkIdx
        chooseFolderVC.senderUserIdx = senderUserIdx
        chooseFolderVC.alertIdx = alertIdx
        
        self.present(chooseFolderVC, animated: true, completion: nil)
    }
    

    @IBOutlet weak var tableView: UITableView!
    let refreshControl = UIRefreshControl()

    
    var NoticeList: [NoticeResult]?{
        didSet{
            self.tableView.reloadData()
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "NoticeTableViewCell", bundle: nil), forCellReuseIdentifier: "NoticeTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        initRefreshControl()
        NoticeRepository().getNoticeList(viewcontroller: self)
    }
    
    func initRefreshControl(){
        tableView.refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshTableView(refreshControl:)), for: .valueChanged)
        tableView.refreshControl = refreshControl
    }
    
    @objc func refreshTableView(refreshControl:
    UIRefreshControl){
        DispatchQueue.main.asyncAfter(deadline: .now()){
            NoticeRepository().getNoticeList(viewcontroller: self)
            refreshControl.endRefreshing()
        }
    }
    
    
}

extension NoticeViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NoticeList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoticeTableViewCell", for: indexPath) as! NoticeTableViewCell
        
        cell.delegate = self
        cell.alertdelegate = self
        
        let itemIndex = indexPath.item
        if let cellData = self.NoticeList{
            cell.setupdata(dataSet: cellData[itemIndex])
        }
 
        return cell
    }
}

extension NoticeViewController{
    func successNoticeAPI(_ result: NoticeModel){
        self.NoticeList = result.result
    }
}
