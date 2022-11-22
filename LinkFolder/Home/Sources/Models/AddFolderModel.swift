//
//  AddFolderModel.swift
//  LinkFolder
//
//  Created by 유지민 on 2022/11/23.
//

import Foundation

struct AddFolderInput: Encodable {
    var folderName: String?
}

struct AddFolderModel: Decodable {
    var isSuccess: Bool?
    var code: Int?
    var message: String?
    var result: AddFolderResult
}

struct AddFolderResult: Decodable {
    var folderIdx: Int?
}
