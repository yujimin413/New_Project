//
//  LoginModel.swift
//  LinkFolder
//
//  Created by 임영준 on 2022/11/08.
//

import Foundation

struct LoginInput: Encodable{
    var id: String
    var password: String
}

struct LoginModel: Decodable{
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: LoginResult
}

struct LoginResult: Decodable {
    var userIdx: Int
    var id: String
    var nickname: String
    var profileImabeUrl: String?
    var jwtToken: String
}
