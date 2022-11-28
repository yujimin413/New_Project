//
//  FriendsModel.swift
//  LinkFolder
//
//  Created by 임영준 on 2022/11/28.
//

import Foundation

struct AddFriendModel: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: AddFriendResult
}

struct AddFriendResult: Codable {
    let friendUserIdx: Int
}

struct DeleteFriendModel: Codable {
    let isSuccess: Bool
    let code: Int
    let message, result: String
}

struct GetFriendsModel: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [GetFriendsResult]
}

struct GetFriendsResult: Codable {
    let userIdx: Int
    let nickname: String
    let profileImageURL: String?
}
