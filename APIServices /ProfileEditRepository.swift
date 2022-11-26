//
//  ProfileEditRepository.swift
//  LinkFolder
//
//  Created by 임영준 on 2022/11/26.
//

import Foundation
import Alamofire

class ProfileEditRepository{
    func editProfile(_ parameter : EditProfileInput, _ completion: @escaping () -> Void){
        AF.request(Const.baseUrl+Const.editProfileUrl, method: .patch, parameters: parameter, encoder: JSONParameterEncoder.default, headers: Const.header).responseDecodable(of: EditProfileModel.self){
            response in
            switch response.result {
            case .success(let result):
                print("프로필 수정 성공")
                debugPrint(response)
                completion()

            case .failure:
                print("프로필 수정 실패")
                debugPrint(response)
            }
        }
    }
}
