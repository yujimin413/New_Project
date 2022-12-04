//
//  AlertSendRepository.swift
//  LinkFolder
//
//  Created by 유지민 on 2022/12/04.
//

import Foundation
import Alamofire

class AlertSendRepository {
    func sendAlert(_ parameter: AlertSendInput, _  completion: @escaping () -> Void){

        AF.request(Const.baseUrl+Const.createAlertsUrl, method: .post, parameters: parameter, encoder: JSONParameterEncoder.default, headers: Const.header).responseDecodable(of: AlertSendModel.self){
            response in
            switch response.result {
            case .success(let result):
                print("알림 보내기 성공")
                debugPrint(response)
                if result.isSuccess{
                    completion()
                }

            case .failure:
                print("알림 보내기 실패")
                debugPrint(response)
            }
        }
    }
}
