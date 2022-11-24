//
//  FolderNameModifyRepository.swift
//  LinkFolder
//
//  Created by 유지민 on 2022/11/23.
//

import Foundation
import Alamofire

class FolderNameModifyRepository {
    
//    var delegate : HomeReloadDelegate?
    
    func modifyFolderName(_ parameter: FolderNameModifyInput, _  completion: @escaping () -> Void){
        
        let jwtToken = UserDefaults.standard.string(forKey: "jwtToken")
        
        let header: HTTPHeaders = [
            "LF-ACCESS-TOKEN" : jwtToken!
        ]
        
        AF.request(Const.baseUrl+Const.modifyFolderNameUrl, method: .patch, parameters: parameter, encoder: JSONParameterEncoder.default, headers: header).responseDecodable(of: FolderNameModifyModel.self){ response in
            switch response.result {
            case .success(let result):
                print("폴더 이름 수정 성공")
                debugPrint(response)
                if result.isSuccess!{
//                    self.delegate?.setupFolderData()
                    completion()
                }
                

            case .failure:
                print("폴더 이름 수정 실패")
                debugPrint(response)
            }
        }
    }
}
