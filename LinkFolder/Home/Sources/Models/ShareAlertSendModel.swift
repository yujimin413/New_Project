//
//  AlertSendModel.swift
//  LinkFolder
//
//  Created by 유지민 on 2022/12/04.
//

import Foundation

struct ShareAlertSendInput: Encodable {
    let alertText: String
    let alertType, receiveUserIdx, folderIdx, linkIdx: Int
}

struct ShareAlertSendModel: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: ShareAlertSendResult?
}

struct ShareAlertSendResult: Decodable {
    var alertIdx: Int?
}
