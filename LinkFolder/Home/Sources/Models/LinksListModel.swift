//
//  LinksListModel.swift
//  LinkFolder
//
//  Created by 유지민 on 2022/11/24.
//

import Foundation

struct LinksListInput: Encodable {
    var folderIdx: Int
}

struct LinksListModel: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: [linkInfo]?
}

struct linkInfo: Decodable {
    var linkUrl: String?
    var linkIdx: Int?
    var linkAlias: String?
}
