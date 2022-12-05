//
//  AddLinkModel.swift
//  LinkFolder
//
//  Created by 유지민 on 2022/11/26.
//

import Foundation

struct AddLinkInput: Encodable {
    var linkUrl: String?
    var folderIdx: Int
    var linkAlias: String?
}

struct AddLinkModel: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: AddLinkResult?
}

struct AddLinkResult: Decodable {
    var linkIdx: Int?
}
