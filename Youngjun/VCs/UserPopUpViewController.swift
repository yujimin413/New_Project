//
//  UserPopUpViewController.swift
//  LinkFolder
//
//  Created by 임영준 on 2022/12/01.
//

import UIKit

class UserPopUpViewController: UIViewController {

    @IBOutlet weak var popUpBgView: UIView!
    @IBOutlet weak var profileImageVIew: ProfileImageComponent!
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var friendAddButton: ButtonComponent!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        popUpBgView.layer.cornerRadius = 10
    }
    
    
    @IBAction func bgBtnDidTap(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}
