//
//  SigninViewController.swift
//  LinkFolder
//
//  Created by 임영준 on 2022/10/18.
//

import UIKit
import RxSwift
import RxCocoa

class SignupViewController: UIViewController {

    @IBOutlet weak var profileImageButton: UIButton!
    @IBOutlet weak var idTextField: TextFieldComponent!
    @IBOutlet weak var nicknameTextField: TextFieldComponent!
    @IBOutlet weak var passwordTextField: TextFieldComponent!
    @IBOutlet weak var passwordConfirmTextField: TextFieldComponent!
    @IBOutlet weak var signupButton: ButtonComponent!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var passwordConfirmLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        hideKeyboard()
        addTargetToTF()
        UserDefaults.init(suiteName: "group.linkfolder.Linkfolder.Share")
        passwordConfirmLabel.isHidden = true
    }
    
    func setNavigationBar(){
        self.navigationItem.title = "회원가입"
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationController?.navigationBar.topItem?.title = ""
    }
    
    
    func addTargetToTF(){
        self.idTextField.addTarget(self, action: #selector(textFieldDidChanged(_:)), for: .editingChanged)
        self.nicknameTextField.addTarget(self, action:  #selector(textFieldDidChanged(_:)), for: .editingChanged)
        self.passwordTextField.addTarget(self, action:  #selector(textFieldDidChanged(_:)), for: .editingChanged)
        self.passwordConfirmTextField.addTarget(self, action:  #selector(textFieldDidChanged(_:)), for: .editingChanged)
    }
    
    
    
    
    //텍스트필드 변경 감지
    @objc func textFieldDidChanged(_ sender: TextFieldComponent ){
        sender.setBorder()
       updateSignupButton(willActive: checkIsValid())
        if sender == idTextField {
            if(idTextFieldisValid(id: idTextField.text!)){
                sender.isValid()
            }
            else
            {
                sender.isInvalid()
            }
        }
        if sender == nicknameTextField {
            if(nicknameTextFieldisValid(nickname: nicknameTextField.text!)){
                sender.isValid()
            }
            else
            {
                sender.isInvalid()
            }
        }
        if sender == passwordTextField {
            if(passwordTextFieldisValid(password: passwordTextField.text! )){
                sender.isValid()
            }
            else
            {
                sender.isInvalid()
            }
        }
        if sender == passwordConfirmTextField {
            if(isSameBothPassword(password: passwordTextField.text!, passwordCheck: passwordConfirmTextField.text!)){
                sender.isValid()
            }
            else{
                sender.isInvalid()
                
            }
        }
    }
    
    
    func checkIsValid() -> Bool{
        if idTextFieldisValid(id: idTextField.text!)&&nicknameTextFieldisValid(nickname: nicknameTextField.text!)&&passwordTextFieldisValid(password: passwordTextField.text!)&&isSameBothPassword(password: passwordTextField.text!, passwordCheck: passwordConfirmTextField.text!){
            return true
        }
        else{
            return false
            
        }
    }
    
    
    
    //회원가입 버튼 활성화
    func updateSignupButton(willActive: Bool){
        if (willActive == true) {
            signupButton.activateButton()
        }
        else{
            signupButton.unactivateButton()
        }
    }
    

    //아이디 - 6~20자의 영문 혹은 영문과 숫자를 조합
    func idTextFieldisValid(id: String) -> Bool {
        if idTextField.text == ""{
            idLabel.textColor = UIColor(named: "GrayText")
            return false
        }
        
        let pattern = "[A-Za-z0-9]{4,20}"
        let regex = try? NSRegularExpression(pattern: pattern)
        if let _ = regex?.firstMatch(in: id, options: [], range: NSRange(location: 0, length: id.count)) {
            idLabel.text = "사용가능한 아이디입니다"
            idLabel.textColor = UIColor(named: "GrayText")
                return true
        }
        idLabel.text = "4~20자의 영문 혹은 영문과 숫자를 조합"
        idLabel.textColor = .red
        
        return false
    }
    //닉네임 - 1~20자 한글, 영문, 숫자 입력 가능
    func nicknameTextFieldisValid(nickname: String) -> Bool {
        if nicknameTextField.text == ""{
            nicknameLabel.textColor = UIColor(named: "GrayText")
            return false
        }
        let pattern = "[가-힣A-Za-z0-9]{1,20}"
        let regex = try? NSRegularExpression(pattern: pattern)
        if let _ = regex?.firstMatch(in: nickname, options: [], range: NSRange(location: 0, length: nickname.count)) {
            nicknameLabel.text = "사용가능한 닉네임입니다"
            nicknameLabel.textColor = UIColor(named: "GrayText")
                return true
        }
        nicknameLabel.text = "1~20자 한글, 영문, 숫자 입력 가능"
        nicknameLabel.textColor = .red
        return false
    }
    
    //비밀번호 - 8~20자의 영문, 숫자, 특수문자를 조합
    func passwordTextFieldisValid(password: String) -> Bool {
        if passwordTextField.text == ""{
            passwordLabel.textColor = UIColor(named: "GrayText")
            return false
        }
        let pattern = "[A-Za-z0-9!_@$%^&+=]{4,20}"
        let regex = try? NSRegularExpression(pattern: pattern)
        if let _ = regex?.firstMatch(in: password, options: [], range: NSRange(location: 0, length: password.count)) {
            passwordLabel.text = "사용가능한 비밀번호입니다"
            passwordLabel.textColor = UIColor(named: "GrayText")
                return true
        }
        passwordLabel.text = "4~20자의 영문, 숫자, 특수문자 입력가능"
        passwordLabel.textColor = .red
        return false
    }
    
    
    //비밀번호 일치 체크
    func isSameBothPassword(password: String, passwordCheck: String) -> Bool{
        if passwordConfirmTextField.text == ""{
            passwordConfirmLabel.isHidden = true
            return false
        }
        
        if password == passwordCheck {
            passwordConfirmLabel.isHidden = false
            passwordConfirmLabel.text = "비밀번호가 일치합니다"
            passwordConfirmLabel.textColor = UIColor(named: "GrayText")

            return true
        }
        else {
            passwordConfirmLabel.isHidden = false
            passwordConfirmLabel.text = "비밀번호가 일치하지 않습니다"
            passwordConfirmLabel.textColor = .red
            
            return false
        }
    }
    
    @IBAction func singupButtonDidTap(_ sender: Any) {
        let input = SignupInput(id: idTextField.text!, password: passwordTextField.text!, nickname: nicknameTextField.text!, profileImageUrl: nil)
        SignupRepository().signup(input)
        
        let storyboard = UIStoryboard(name: "Login", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false)
        
    }
    
}

