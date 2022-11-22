//
//  AddFolderRepository.swift
//  LinkFolder
//
//  Created by 유지민 on 2022/11/23.
//

import Foundation
import Alamofire

class AddFolderRepository {
    
//    var delegate: HomeReloadDelegate?
    
    func addFolder(_ parameter: AddFolderInput, _  completion: @escaping () -> Void){
        
        let jwtToken = UserDefaults.standard.string(forKey: "jwtToken")
        
        let header: HTTPHeaders = [
            "LF-ACCESS-TOKEN" : jwtToken!
        ]
        
        AF.request(Const.baseUrl+Const.addFolderUrl, method: .post, parameters: parameter, encoder: JSONParameterEncoder.default, headers: header).responseDecodable(of: AddFolderModel.self){
            response in
            switch response.result {
            case .success(let result):
                print("폴더 생성 성공")
                debugPrint(response)
                if result.isSuccess!{
//                    self.delegate?.setupFolderData()
                    completion()
                }
                

            case .failure:
                print("폴더 생성 실패")
                debugPrint(response)
            }
        }
    }
}


