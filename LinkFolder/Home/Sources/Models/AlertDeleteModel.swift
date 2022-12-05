//
//  AlertDeleteModel.swift
//  LinkFolder
//
//  Created by 유지민 on 2022/12/05.
//

import Foundation

struct AlertDeleteModel: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: String
}
