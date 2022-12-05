//
//  FolderCopyModel.swift
//  LinkFolder
//
//  Created by 유지민 on 2022/12/04.
//

import Foundation

struct FolderCopyInput: Encodable {
    var folderIdx: Int
    var sendUserIdx: Int
}

struct FolderCopyModel: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: FolderCopyResult?
}

struct FolderCopyResult: Decodable {
    var folderIdx: Int?
}
