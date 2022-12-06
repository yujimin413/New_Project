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
        hideKeyboard()
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
        secondVC.modalPresentationStyle = .fullScreen
//        self.navigationController?.pushViewController(secondVC, animated: false)
        show(secondVC, sender: self)
    }
    
    @IBAction func loginButtonDidTap(_ sender: Any) {
        let input = LoginInput(id: idTextField.text!, password: passwordTextField.text!)
        LoginRepository().login(input) {    // 로그인 이후 폴더리스트 불러오도록.. 순서 꼬여서 completion handler 사용
            self.loginIsSucceed()
            
        }
        
    }
    
    func loginIsSucceed(){
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Main") as! UITabBarController
        self.view.window?.windowScene?.keyWindow?.rootViewController = vc
//
//        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
//        let vc = storyboard.instantiateViewController(withIdentifier: "Main") as! UITabBarController
//        self.view.window?.windowScene?.keyWindow?.rootViewController = vc
    }
    
    
}
