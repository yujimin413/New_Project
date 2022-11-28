//
//  SignupModel.swift
//  LinkFolder
//
//  Created by 임영준 on 2022/11/08.
//

import Foundation

struct SignupInput: Encodable{
    var id: String
    var password: String
    var nickname: String
    var profileImageUrl: String?
}

struct SignupModel: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: SignupResult
}

struct SignupResult: Decodable {
    var userIdx: Int
    var jwtToken: String
}
