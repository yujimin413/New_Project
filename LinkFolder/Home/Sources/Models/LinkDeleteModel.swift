//
//  LinkDeleteModel.swift
//  LinkFolder
//
//  Created by 유지민 on 2022/11/26.
//

import Foundation

struct LinkDeleteModel: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: String
}
