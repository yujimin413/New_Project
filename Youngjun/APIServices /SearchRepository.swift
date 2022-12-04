//
//  SearchRepository.swift
//  LinkFolder
//
//  Created by 임영준 on 2022/11/30.
//

import Foundation
import Alamofire

class SearchRepository {
    
    func searchUserById(_ id: String, completion: @escaping (_ data: SearchResult) -> Void){
        AF.request(Const.baseUrl+Const.searchIdUrl+id, method: .get, parameters: nil, headers: nil).responseDecodable(of: SearchModel.self){
            response in
            switch response.result {
            case .success(let result):
                print("검색결과 가져오기 성공")
                debugPrint(response)

                completion(result.result!)
                if result.isSuccess{
                }
                
            case .failure:
                print("검색결과 가져오기 실패")
                debugPrint(response)
            }
        }
    }
}
