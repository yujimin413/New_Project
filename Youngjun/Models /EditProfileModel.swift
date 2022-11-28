//
//  EditProfileModel.swift
//  LinkFolder
//
//  Created by 임영준 on 2022/11/26.
//

import Foundation

struct EditProfileInput: Encodable{
    var nickname: String
    var profileImageUrl: String?
}

struct EditProfileModel: Decodable{
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: EditProfileResult
    
    enum Codingkeys: String, CodingKey {
        case result = "id"
    }
}

struct EditProfileResult: Decodable {
    var userIdx: Int
    
    enum Codingkeys: String, CodingKey {
        case userIdx = "id"
    }
}
