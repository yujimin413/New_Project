//
//  AlertSendModel.swift
//  LinkFolder
//
//  Created by 유지민 on 2022/12/04.
//

import Foundation

struct ShareFolderAlertSendInput: Encodable {
    let alertText: String
    let alertType, receiveUserIdx, folderIdx, linkIdx: Int
}

struct ShareFolderAlertSendModel: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: ShareFolderAlertSendResult?
}

struct ShareFolderAlertSendResult: Decodable {
    var alertIdx: Int?
}
