//
//  LinkCopyRepository.swift
//  LinkFolder
//
//  Created by 유지민 on 2022/12/04.
//

import Foundation
import Alamofire

class LinkCopyRepository {
    
func copyLink(_ parameter: LinkCopyInput, _  completion: @escaping () -> Void){

    AF.request(Const.baseUrl+Const.copyLinkUrl, method: .post, parameters: parameter, encoder: JSONParameterEncoder.default, headers: Const.header).responseDecodable(of: FolderCopyModel.self){
            response in
            switch response.result {
            case .success(let result):
                print("링크 사본 생성 성공")
                debugPrint(response)
                if result.isSuccess{
                    completion()
                }
                

            case .failure:
                print("링크 사본 생성 실패")
                debugPrint(response)
            }
        }
    }
}

