//
//  AlertSendModel.swift
//  LinkFolder
//
//  Created by 유지민 on 2022/12/04.
//

import Foundation

struct AlertSendInput: Encodable {
    let alertText: String
    let alertType, receiveUserIdx, folderIdx, linkIdx: Int
}

struct AlertSendModel: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: AlertSendResult?
}

struct AlertSendResult: Decodable {
    var alertIdx: Int?
}
