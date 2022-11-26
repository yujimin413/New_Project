//
//  FoldersListRepository.swift
//  LinkFolder
//
//  Created by 유지민 on 2022/11/23.
//

import Foundation
import Alamofire

class FoldersListRepository {
    
    func getFoldersList(_ viewController: HomeViewController){
        
        let jwtToken = UserDefaults.standard.string(forKey: "jwtToken")
        
        let header: HTTPHeaders = [
            "LF-ACCESS-TOKEN" : jwtToken!
        ]
        
        AF.request(Const.baseUrl+Const.foldersUrl, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header).responseDecodable(of: FoldersListModel.self){
            response in
            switch response.result {
            case .success(let result):
                print("폴더리스트 불러오기 성공")
                debugPrint(response)
                if result.isSuccess{
                     viewController.successFeedAPI(result)
                }

            case .failure:
                print("폴더리스트 불러오기 실패")
                debugPrint(response)
            }
        }
    }
}

