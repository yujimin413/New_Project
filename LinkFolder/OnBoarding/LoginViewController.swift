//
//  LoginViewController.swift
//  LinkFolder
//
//  Created by 임영준 on 2022/10/18.
//

import UIKit
import RxSwift
import RxCocoa

class LoginViewController: UIViewController {

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: ButtonComponent!
    @IBOutlet weak var SignupButton: ButtonComponent!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func SignupButtonDidTap(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Signup", bundle: nil)
        let secondVC = storyboard.instantiateViewController(identifier: "SignupViewController")
        secondVC.navigationController?.navigationBar.barTintColor = .black
        show(secondVC, sender: self)
    }
    

}
