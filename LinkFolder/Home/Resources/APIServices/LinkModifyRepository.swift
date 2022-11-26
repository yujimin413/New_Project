//
//  LinkModifyRepository.swift
//  LinkFolder
//
//  Created by 유지민 on 2022/11/26.
//

import Foundation
import Alamofire

class LinkModifyRepository {
    
    func modifyLink(_ parameter: LinkModifyInput, _  completion: @escaping () -> Void){
        
        let jwtToken = UserDefaults.standard.string(forKey: "jwtToken")
        
        let header: HTTPHeaders = [
            "LF-ACCESS-TOKEN" : jwtToken!
        ]
        
        AF.request(Const.baseUrl+Const.modifyLinkUrl, method: .patch, parameters: parameter, encoder: JSONParameterEncoder.default, headers: header).responseDecodable(of: LinkModifyModel.self){ response in
            switch response.result {
            case .success(let result):
                print("링크 수정 성공")
                debugPrint(response)
                if result.isSuccess{
                    completion()
                }
                

            case .failure:
                print("링크 수정 실패")
                debugPrint(response)
            }
        }
    }
}
