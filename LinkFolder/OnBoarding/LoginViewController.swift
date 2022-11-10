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

    @IBOutlet weak var idTextField: TextFieldComponent!
    @IBOutlet weak var passwordTextField: TextFieldComponent!
    @IBOutlet weak var loginButton: ButtonComponent!
    @IBOutlet weak var SignupButton: ButtonComponent!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.idTextField.addTarget(self, action: #selector(textFieldDidChanged), for: .editingChanged)
        self.passwordTextField.addTarget(self, action: #selector(textFieldDidChanged), for: .editingChanged)
    }
    
    
    @objc
    func textFieldDidChanged(_ sender: TextFieldComponent){
        sender.setBorder()
        if (idTextField.text != "" && passwordTextField.text != ""){
            loginButton.activateButton()
        }
        else {
            loginButton.unactivateButton()
        }
    }
    
    
    
    
    @IBAction func SignupButtonDidTap(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Signup", bundle: nil)
        let secondVC = storyboard.instantiateViewController(identifier: "SignupViewController")
        secondVC.navigationController?.navigationBar.barTintColor = .black
        show(secondVC, sender: self)
    }
    

}
