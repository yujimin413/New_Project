//
//  SearchModel.swift
//  LinkFolder
//
//  Created by 임영준 on 2022/11/30.
//

import Foundation

struct SearchModel: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: SearchResult?
}

// MARK: - Result
struct SearchResult: Codable {
    let userIdx: Int
    let id, nickname: String
    let profileImageURL: String?
}
