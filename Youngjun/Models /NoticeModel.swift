//
//  NoticeModel.swift
//  LinkFolder
//
//  Created by 임영준 on 2022/11/28.
//

import Foundation

struct NoticeModel: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [NoticeResult]
}

// MARK: - Result
struct NoticeResult: Codable {
    let alertIdx: Int
    let alertText: String
    let alertType, sendUserIdx, receiveUserIdx, folderIdx: Int
    let linkIdx: Int
    let nickname: String
    let profileImageUrl: String?
    let folderName: String?
    let linkName: String?
    
}
