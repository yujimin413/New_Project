//
//  LoginRepository.swift
//  LinkFolder
//
//  Created by 임영준 on 2022/11/08.
//

import Foundation
import Alamofire

class LoginRepository{
    
    func login(_ parameter: LoginInput){
        AF.request(Const.baseUrl+Const.loginUrl, method: .post, parameters: parameter, encoder: JSONParameterEncoder.default).responseDecodable(of: LoginModel.self){
            response in
            switch response.result {
            case .success(let result):
                print("로그인 성공")
                debugPrint(response)
                if result.isSuccess{
                    print(#function)
                }

            case .failure:
                print("로그인 실패")
                debugPrint(response)
            }
        }
    }
}
