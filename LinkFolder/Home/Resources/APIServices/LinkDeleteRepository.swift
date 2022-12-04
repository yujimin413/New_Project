//
//  LinkDeleteRepository.swift
//  LinkFolder
//
//  Created by 유지민 on 2022/11/26.
//

import Foundation
import Alamofire

class LinkDeleteRepository {
    
    func deleteLink(_ folderIndex: Int, _  completion: @escaping () -> Void){

        
        AF.request(Const.baseUrl+Const.deleteLinkUrl+"\(folderIndex)",
                   method: .delete,
                   parameters: nil,
                   encoding: JSONEncoding.default,
                   headers: Const.header)
        .responseDecodable(of: FolderDeleteModel.self){ response in
            switch response.result {
            case .success(let result):
                print("링크 삭제 성공")
                debugPrint(response)
                if result.isSuccess{
//                    print(#function)
                    completion()
                }

            case .failure:
                print("링크 삭제 실패")
                debugPrint(response)
            }
        }
    }
}
