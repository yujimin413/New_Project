//
//  ShareViewController.swift
//  LinkFolderShareExtension
//
//  Created by 임영준 on 2022/12/04.
//

import UIKit
import Social
import Alamofire

class ShareViewController: UIViewController{
    
    
    override func viewDidLoad() {
        print(Const.jwtToken)
    }
    @IBAction func testButtonDidTap(_ sender: Any) {
        FoldersListRepository().getFoldersList(self)
    }
}
