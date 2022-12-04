//
//  NoticeRepository.swift
//  LinkFolder
//
//  Created by 임영준 on 2022/11/28.
//

import Foundation
import Alamofire

class NoticeRepository {
    
    func getNoticeList(viewcontroller: NoticeViewController){
        
        AF.request(Const.baseUrl+Const.getNoticeUrl, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: Const.header).responseDecodable(of: NoticeModel.self){
            response in
            switch response.result {
            case .success(let result):
                print("알림 목록 가져오기 성공")
                debugPrint(response)
                if result.isSuccess{
                }
                viewcontroller.successNoticeAPI(result)

            case .failure:
                print("알림 목록 가져오기 실패")
                debugPrint(response)
            }
        }
    }
}

