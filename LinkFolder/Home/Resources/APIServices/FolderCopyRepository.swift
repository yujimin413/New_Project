//
//  FolderCopyRepository.swift
//  LinkFolder
//
//  Created by 유지민 on 2022/12/04.
//

import Foundation
import Alamofire

class FolderCopyRepository {
    
func copyFolder(_ parameter: FolderCopyInput, _  completion: @escaping () -> Void){

    AF.request(Const.baseUrl+Const.copyFolderUrl, method: .post, parameters: parameter, encoder: JSONParameterEncoder.default, headers: Const.header).responseDecodable(of: FolderCopyModel.self){
            response in
            switch response.result {
            case .success(let result):
                print("폴더 사본 생성 성공")
                debugPrint(response)
                if result.isSuccess{
                    completion()
                }
                

            case .failure:
                print("폴더 사본 생성 실패")
                debugPrint(response)
            }
        }
    }
}
