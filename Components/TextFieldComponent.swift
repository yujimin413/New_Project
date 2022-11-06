//
//  TextFieldComponent.swift
//  LinkFolder
//
//  Created by 임영준 on 2022/10/18.
//

import UIKit

class TextFieldComponent: UITextField {
// 글자가 들어왔을 때 테두리
    func setBorder(){
        if self.text == ""{
            self.layer.borderWidth = 0
        }
        else{
            self.layer.borderWidth = 1
            self.layer.cornerRadius = 5
            self.layer.borderColor = UIColor.black.cgColor
        }
    }
    

// 유효하지 않을 때
    func isInvalid(){
        if (self.text == ""){
            self.layer.borderWidth = 0
            return
        }
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 5
        self.layer.borderColor = UIColor.red.cgColor
    }
// 유효할 때
    func isValid(){
        self.layer.borderColor = UIColor.black.cgColor
    }
}
