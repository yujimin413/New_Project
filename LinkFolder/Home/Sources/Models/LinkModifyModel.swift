//
//  LinkModifyModel.swift
//  LinkFolder
//
//  Created by 유지민 on 2022/11/26.
//

import Foundation

struct LinkModifyInput: Encodable {
    var updateLinkUrl: String?
    var linkIdx: Int?
    var updateLinkAlias: String?
}

struct LinkModifyModel: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: LinkModifyResult?
}

struct LinkModifyResult: Decodable {
    var linkIdx: Int?
}
