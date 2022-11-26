//
//  ProfileEditViewController.swift
//  LinkFolder
//
//  Created by 임영준 on 2022/11/23.
//

import UIKit

class ProfileEditViewController: UIViewController {

    @IBOutlet weak var nicknameTextFeild: TextFieldComponent!
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var editButton: ButtonComponent!
    
    var delegate: HomeReloadDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        self.nicknameTextFeild.addTarget(self, action: #selector(textFieldDidChanged), for: .editingChanged)
        self.nicknameTextFeild.text = Const.nickname

    }

    
    func setNavigationBar(){
        print(#function)
        self.navigationItem.title = "내 정보 수정"
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationController?.navigationBar.topItem?.title = ""
    }
    
    //텍스트필드 변경 감지
    @objc func textFieldDidChanged(_ sender: TextFieldComponent ){
        sender.setBorder()
       updateEditButton(willActive: checkIsValid())
        if sender == nicknameTextFeild {
            if(nicknameTextFieldisValid(nickname: nicknameTextFeild.text!)){
                sender.isValid()
            }
            else
            {
                sender.isInvalid()
            }
        }
    }
    
    func checkIsValid() -> Bool{
        if nicknameTextFieldisValid(nickname: nicknameTextFeild.text!){
            return true
        }
        else{
            return false
            
        }
    }
    
    func nicknameTextFieldisValid(nickname: String) -> Bool {
        if nicknameTextFeild.text == ""{
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
    
    
    func updateEditButton(willActive: Bool){
        if (willActive == true) {
            editButton.activateButton()
        }
        else{
            editButton.unactivateButton()
        }
    }
    
    @IBAction func profilieEditButtonDidTap(_ sender: Any) {
        let input = EditProfileInput(nickname: nicknameTextFeild.text!, profileImageUrl: nil)
        ProfileEditRepository().editProfile(input){
            Const.nickname = input.nickname
            self.delegate?.setupFolderData()
        }
        self.dismiss(animated: true)
    }
    
    @IBAction func backButtonDidTap(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}
