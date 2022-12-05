//
//  FoldersListModel.swift
//  LinkFolder
//
//  Created by 유지민 on 2022/11/22.
//

import Foundation

struct FoldersListModel: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: [folderInfo]?
}

struct folderInfo: Decodable {
    var folderIdx: Int?
    var folderName: String?
}
