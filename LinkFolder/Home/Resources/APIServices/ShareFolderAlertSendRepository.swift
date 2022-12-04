//
//  ShareFolderAlertSendRepository.swift
//  LinkFolder
//
//  Created by 유지민 on 2022/12/04.
//

import Foundation
import Alamofire

class ShareFolderAlertSendRepository {
    func sendShareFolderAlert(_ parameter: ShareFolderAlertSendInput, _  completion: @escaping () -> Void){

        AF.request(Const.baseUrl+Const.createAlertsUrl, method: .post, parameters: parameter, encoder: JSONParameterEncoder.default, headers: Const.header).responseDecodable(of: ShareFolderAlertSendModel.self){
            response in
            switch response.result {
            case .success(let result):
                print("폴더 공유 요청 알림 보내기 성공")
                debugPrint(response)
                if result.isSuccess{
                    completion()
                }

            case .failure:
                print("폴더 공유 요청 알림 보내기 실패")
                debugPrint(response)
            }
        }
    }
}
