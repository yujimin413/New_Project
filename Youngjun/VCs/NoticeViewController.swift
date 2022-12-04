//
//  NoticeViewController.swift
//  LinkFolder
//
//  Created by 임영준 on 2022/10/18.
//

import UIKit

class NoticeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
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
        NoticeRepository().getNoticeList(viewcontroller: self)
    }
    
}

extension NoticeViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NoticeList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoticeTableViewCell", for: indexPath) as! NoticeTableViewCell
        
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
