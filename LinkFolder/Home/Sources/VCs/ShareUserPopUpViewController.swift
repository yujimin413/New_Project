//
//  ShareUserPopUpViewController.swift
//  LinkFolder
//
//  Created by 유지민 on 2022/12/04.
//

import UIKit

class ShareUserPopUpViewController: UIViewController {

    
    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var profileImageView: ProfileImageComponent!
    @IBOutlet weak var userNicknameTextLabel: UILabel!
    @IBOutlet weak var userIdTextLabel: UILabel!
    @IBOutlet weak var shareFolderButton: ButtonComponent!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.popUpView.layer.cornerRadius = 10

    }
    
    @IBAction func backButtonDidTap(_ sender: Any) {
        self.dismiss(animated: false)
    }
}
