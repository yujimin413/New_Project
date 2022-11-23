//
//  FolderNameModifyModel.swift
//  LinkFolder
//
//  Created by 유지민 on 2022/11/23.
//

import Foundation

struct FolderNameModifyInput: Encodable {
    var updateFolderName: String?
    var folderIdx: Int?
}

struct FolderNameModifyModel: Decodable {
    var isSuccess: Bool?
    var code: Int?
    var message: String?
    var result: FolderNameModifyResult
}

struct FolderNameModifyResult: Decodable {
    var folderIdx: Int?
}

