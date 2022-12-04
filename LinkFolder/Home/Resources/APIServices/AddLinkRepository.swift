//
//  AddLinkRepository.swift
//  LinkFolder
//
//  Created by 유지민 on 2022/11/26.
//

import Foundation
import Alamofire

class AddLinkRepository {
    
    func addLink(_ parameter: AddLinkInput, _  completion: @escaping () -> Void){

        
        AF.request(Const.baseUrl+Const.addLinkUrl, method: .post, parameters: parameter, encoder: JSONParameterEncoder.default, headers: Const.header).responseDecodable(of: AddFolderModel.self){
            response in
            switch response.result {
            case .success(let result):
                print("링크 생성 성공")
                debugPrint(response)
                if result.isSuccess{
                    completion()
                }
                

            case .failure:
                print("링크 생성 실패")
                debugPrint(response)
            }
        }
    }
}
