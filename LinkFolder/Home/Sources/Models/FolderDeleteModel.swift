//
//  FolderDeleteModel.swift
//  LinkFolder
//
//  Created by 유지민 on 2022/11/23.
//

import Foundation

struct FolderDeleteModel: Decodable {
    var isSuccess: Bool?
    var code: Int?
    var message: String?
    var result: String?
}
