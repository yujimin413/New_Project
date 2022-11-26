//
//  FolderDeleteRepository.swift
//  LinkFolder
//
//  Created by 유지민 on 2022/11/23.
//

import Foundation
import Alamofire

class FolderDeleteRepository {
    
    func deleteFolder(_ folderIndex: Int, _  completion: @escaping () -> Void){
        
        let jwtToken = UserDefaults.standard.string(forKey: "jwtToken")
        
        let header: HTTPHeaders = [
            "LF-ACCESS-TOKEN" : jwtToken!
        ]
        
        AF.request(Const.baseUrl+Const.deleteFolderUrl+"\(folderIndex)",
                   method: .delete,
                   parameters: nil,
                   encoding: JSONEncoding.default,
                   headers: header)
        .responseDecodable(of: FolderDeleteModel.self){ response in
            switch response.result {
            case .success(let result):
                print("폴더 삭제 성공")
                debugPrint(response)
                if result.isSuccess{
//                    print(#function)
//                     viewController.successFeedAPI(result)
                    completion()
                }

            case .failure:
                print("폴더 삭제 실패")
                debugPrint(response)
            }
        }
    }
}
