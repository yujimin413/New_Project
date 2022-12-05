//
//  FolderCopyModel.swift
//  LinkFolder
//
//  Created by 유지민 on 2022/12/04.
//

import Foundation

struct LinkCopyInput: Encodable {
    var foldrIdx: Int
    var linkIdx: Int
    var sendUserIdx: Int
}

struct LinkCopyModel: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: LinkCopyResult?
}

struct LinkCopyResult: Decodable {
    var linkIdx: Int?
}
