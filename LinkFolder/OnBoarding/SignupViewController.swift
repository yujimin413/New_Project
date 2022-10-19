//
//  SigninViewController.swift
//  LinkFolder
//
//  Created by 임영준 on 2022/10/18.
//

import UIKit


class SignupViewController: UIViewController {

    @IBOutlet weak var signupButton: ButtonComponent!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
    }
    
    func setNavigationBar(){
        self.navigationItem.title = "회원가입"
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationController?.navigationBar.topItem?.title = ""
    }
}
