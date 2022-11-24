//
//  LinksListRepository.swift
//  LinkFolder
//
//  Created by 유지민 on 2022/11/24.
//

import Foundation
import Alamofire

class LinksListRepository {
    
    func getLinksList(_ viewController: LinkListViewController, _ folderIdx: Int){
        
        let jwtToken = UserDefaults.standard.string(forKey: "jwtToken")
        
        let header: HTTPHeaders = [
            "LF-ACCESS-TOKEN" : jwtToken!
        ]
        
        AF.request(Const.baseUrl+Const.linksUrl+"\(folderIdx)", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header).responseDecodable(of: LinksListModel.self){
            response in
            switch response.result {
            case .success(let result):
                print("링크리스트 불러오기 성공")
                debugPrint(response)
                if result.isSuccess{
                     viewController.successLinksListAPI(result)
                }

            case .failure:
                print("링크리스트 불러오기 실패")
                debugPrint(response)
            }
        }
    }
}
