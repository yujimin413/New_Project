//
//  SignupRepository.swift
//  LinkFolder
//
//  Created by 임영준 on 2022/11/08.
//

import Alamofire
import Foundation

class SignupRepository{
    
    func signup(_ parameter: SignupInput){
        AF.request(Const.baseUrl+Const.singupUrl, method: .post, parameters: parameter, encoder: JSONParameterEncoder.default).responseJSON{
            response in
            switch response.result {
            case .success:
                print("회원가입 성공")
                debugPrint(response)
                
//                UserDefaults.standard.setValue(result.jwtToken, forKey: "jwtToken")
            
            case .failure:
                print("회원가입 실패")
                debugPrint(response)
            }
        }
    }
}

