//
//  NoticeDeleteRepository.swift
//  LinkFolder
//
//  Created by 유지민 on 2022/12/05.
//

import Foundation
import Alamofire

class NoticeDeleteRepository {
    func deleteNotice(_ alertIndex: Int, _  completion: @escaping () -> Void){

        AF.request(Const.baseUrl+Const.deleteNoticeUrl+"\(alertIndex)",
                   method: .delete,
                   parameters: nil,
                   encoding: JSONEncoding.default,
                   headers: Const.header)
        .responseDecodable(of: AlertDeleteModel.self){ response in
            switch response.result {
            case .success(let result):
                print("알림 삭제 성공")
                debugPrint(response)
                if result.isSuccess{
    //                    print(#function)
//                         viewController.successNoticeAPI(result)
                    completion()
                }

            case .failure:
                print("알림 삭제 실패")
                debugPrint(response)
            }
        }
    }
}


